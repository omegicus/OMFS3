INCLUDE 'include/omegicus.inc'
INCLUDE 'include/systemicus.inc'

USE16
FORMAT BINARY AS 'img'
ORG    BOOT_ADDR
PARTITION1:
   OFS2_PSIZE = 1024*1024*512 / OF2_SSSZ
   ; Cluster 0
   OMFS3:
	; 64 bytes: PARTINFO
	DB	0xE8, 0x58, 0x90		; +00 JMP
	DB	'OMFS3.00'			; +03 SIGNATURE
	DB	0				; +11 OWNER
	DD	OFS2_PSIZE			; +12 PART SIZE IN SECTORS
	DD	-1				; +16 Number of Free Clusters (Set to -1 if Unknown)
	DD	0				; +20 TIMESTAMP. HIGHT BITS FOR 64 BIT, since 19.01.2038
	DD	1352904793			; +24 TIMESTAMP. 32 BIT
	DD	0x00000002			; +28 Cluster # of ROOT DIR
	DD	0x00000003			; +32 First BITMAP cluster. Next - right after every 4Gb
	DD	0				; +36 Serial Number
	DD	0				; +40 CheckCode
	DB	16 DUP 'o'			; res
	DB	0				; +60 Compression (0;none, 1:LZO, 2:LZ4, 3:LZMA, 4;deflate, ...)
	DB	0				; +61 WhatEncrypt: 0=Nothing, 1=Only files fith 'c' flag, 2=Files And Clusters
	DB	0				; +62 encryption mode for CLUSTERS ENCRYPTION(0: none, 1: GOST89, 2:GOST89-14 3:RC6, 4:MARS, 5:BlowFish, 6: Serpent, ...)
	DB	0				; +63 encryption mode for FILES ENCRYPTION(0: none, 1: GOST89, 2:GOST89-14 3:RC6, 4:MARS, 5:BlowFish, 6: Serpent, ...)
	;---------------------------------------;
	DB	32 DUP 0			; +64 256 bit GOST 34.11-2012 of key for eachCluster encryption
	;					;     (generated by selfrehashing 256 cycles)
	DB	32 DUP 0			; +96 256 bit GOST 34.11-2012 of key for Files encryption
	;					;     (generated by selfrehashing 256 cycles)
	;---------------------------------------;
	; OMFS2 - 64 bytes:			; +128 Boot code + reserv
	DB	OF2_CLSZ - ( $ - OMFS3 ) DUP 'O';

   ; Cluster 1: Systemicus
	file	'omegicus.x86':0, 64*1024



   ; Cluster 2: Root directory == 1024-1 records (record #0 seems to be system)
   OMFS2_Root:
	; Dir Info
	dd	0x00000002			; parent dir cluster (root points to itself)
	dd	0x00000000			;
	dq	0x00000000			; folder size;
	dd	0x00000000			; folder serial number
	dd	0x00000005			; num of elements
	db	40 dup 0			;

	; Inode 1
	dd	'BITM'				; File name CRC32
	dd	0x00000000			; File CRC32 | NUM of SunItems if FOLD
	dd	OF2_CLSZ			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'OMFS'				; File type
	dd	0x0000000F			; Start cluster
	dd	00000000000000000000000000110000b
	;	cerwxrwxSS-WZ-----------blhsdrwx
	;	W == LZW source data
	;	Z == LZO source data
	db	0x00				; UID
	db	0x00				; GID
	db	'////////////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)


	; Inode 2
	dd	0xAA275AED			; File name CRC32 ; // bin
	dd	0x00000000			; File CRC32
	dd	0x00010000			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'FOLD'				; File type
	dd	0x00000008			; Start cluster
	dd	00101101000000000000000000011111b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'bin/////////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode 3
	dd	0x1762498C			; File name CRC32 ; // bin
	dd	0x00000000			; File CRC32
	dd	0x00010000			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'FOLD'				; File type
	dd	0x00000009			; Start cluster
	dd	00100100000000000000000000011110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'usr/////////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)


	; Inode 4
	dd	0xA90F3BCC			; File name CRC32 ; // bin
	dd	0x00000000			; File CRC32
	dd	0x00010000			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'FOLD'				; File type
	dd	0x0000000D			; Start cluster
	dd	00100100000000000000000000011110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'lib/////////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)


	; Inode 5 (64 bytes)
	dd	0x9BC26813			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_01_sz			; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
						; +16 FOLD: parent dir cluster
	dd	'FONT'				; +20 File type
	dd	0x0000000F			; +24 Start cluster
	; Attributes				; +28
	dd	00100100000000000000000000010110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'font_arc_cp1251_8x8.fnt/////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)

	; PADDING REST AREA
	croot_inodes = $ - OMFS2_Root
	db	(OF2_INSZ * (OF2_DRNR - croot_inodes/OF2_INSZ) ) DUP 0







    ; Data starts here:

    ; Cluster 3: {BITMAP}, 1 byte is 1 cluster, starts from cl.0, 65536 ones
    ; 0 means free, 1 means just busy, 2 means busy&encrypt, 3..255 - reserved
	bitmap:
	db 1,1,1   ; CL00..02: HEAD, OS, ROOT
	db 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 1,1
	db 1,1,1,1,1,1,1,1,1,1,1
	bitmap_sz = $ - bitmap
	db	OF2_CLSZ - bitmap_sz dup 0



    ; Cluster 4:
	file_02:
	file	'files/test.ogm'
	file_02_sz = $ - file_02
	db	OF2_CLSZ - file_02_sz - 8 dup 0
	dd	file_02_sz			   ; This Cluster Size, if not last => == (OF2_CLSZ - 8)
	dd	0				   ; Next Cluster #, 0 if this one is last.

    ; Cluster 5:
	db	OF2_CLSZ dup 0

    ; Cluster 6:
	file_04:
	file	'apps/ofdisk.exe'
	file_04_sz = $ - file_04
	db	OF2_CLSZ - file_04_sz - 8 dup 0
	dd	file_04_sz
	dd	0

    ; Cluster 7:
	file_05:
	file	'apps/sysinfo.exe'
	file_05_sz = $ - file_05
	db	OF2_CLSZ - file_05_sz - 8 dup 0
	dd	file_05_sz
	dd	0

    ; Cluster 8:	 ; /bin
	; Dir Info
	dd	0x00000002			; parent dir cluster (root points to itself)
	dd	0x00000000			;
	dq	0x00000000			; folder size;
	dd	0x00000000			; folder serial number
	dd	0x00000007			; num of elements
	db	40 dup 0			;

	; Inode
	dd	0xfd6077ee			; File name CRC32
	dd	0x00000000			; File CRC32
	dd	file_04_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; File type
	dd	0x00000006			; Start cluster
	dd	00100100000000000000000000010111b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'fdisk///////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0xca18e340			; File name CRC32
	dd	0x00000000			; File CRC32
	dd	file_05_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; File type
	dd	0x00000007			; Start cluster
	dd	00101101000000000000000000010101b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'sysinfo.exe/////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)


	; Inode 5
	dd	0x6B643B84			; v
	dd	0x00000000			; File CRC32
	dd	file_14_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; File type
	dd	0x00000010			; Start cluster
	dd	00101101000000000000000000010101b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'v///////////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0xa16cf311			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_25_sz			; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; +20 File type
	dd	0x0000001C			; +24 Start cluster
	dd	00101101000000000000000000010101b
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'network.sys/////////////////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)

	; Inode
	dd	0xbe037055			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_21_sz			; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; +20 File type
	dd	0x00000018			; +24 Start cluster
	dd	00101101000000000000000000010101b
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'explorer.exe////////////////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)

	; Inode   terminal.exe
	dd	0x7d0208bc			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_23_sz			; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; +20 File type
	dd	0x0000001A			; +24 Start cluster
	dd	00101101000000000000000000010101b
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'terminal.exe////////////////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)

	; Inode   mice.exe
	dd	0xcefb0ac1			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_24_sz			; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; +20 File type
	dd	0x0000001B			; +24 Start cluster
	dd	00101101000000000000000000010101b
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'mice.sys////////////////////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)

	; Inode   notepad.exe
	dd	0xeb30059f			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_notepad_sz 		; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
	dd	'MZPE'				; +20 File type
	dd	0x0000001E			; +24 Start cluster
	dd	00101101000000000000000000010101b
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'notepad.exe/////////////////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)



	db	 (OF2_CLSZ - 09*OF2_INSZ) dup 0










    ; Cluster 9:	 ; /usr
	; Dir Info
	dd	0x00000002			; parent dir cluster (root points to itself)
	dd	0x00000000			;
	dq	0x00000000			; folder size;
	dd	0x00000000			; folder serial number
	dd	0x00000005			; num of elements
	db	40 dup 0			;
	;
	; Inode
	dd	0x0F8BAEB4			; File name CRC32
	dd	0x00000000			; File CRC32
	dd	file_02_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'MOGM'				; File type
	dd	0x00000004			; Start cluster
	dd	00100100000000000000000000010110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'test.ogm////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)


	; Inode
	dd	0xE6960A97			; File name CRC32
	dd	0x00000000			; File CRC32
	dd	file_10_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'IBMP'				; File type
	dd	0x0000000C			; Start cluster
	dd	00100100000000000000000000000110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'systemicus.bmp//////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0x452867a7			; File name CRC32
	dd	0x00000000			; File CRC32
	dd	file_12_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'TEXT'				; File type
	dd	0x0000000E			; Start cluster
	dd	00100100000000000000000000000110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'license.txt/////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0xFD2F1F35			; rtoslogo.png
	dd	0x00000000			; File CRC32
	dd	file_15_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'IGIF'				; File type
	dd	0x00000011			; Start cluster
	dd	00100100000000000000000000000100b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'rtoslogo.gif////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0xD01944F7			; rtoslogo.png
	dd	0x00000000			; File CRC32
	dd	file_100_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'IGIF'				; File type
	dd	0x00000021			; Start cluster
	dd	00100100000000000000000000000100b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'wall.gif////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0x34C64E2A			; rtoslogo.png
	dd	0x00000000			; File CRC32
	dd	file_0x17_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'IJPG'				; File type
	dd	0x00000017			; Start cluster
	dd	00100100000000000000000000000100b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'wall.jpg////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)

	; Inode
	dd	0x8641FD64			; File name CRC32
	dd	0x00000000			; File CRC32
	dd	0x00010000			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'FOLD'				; File type
	dd	0x0000001F			; Start cluster
	dd	00100100000000000000000000011110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'doc/////////////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)


	db	 (OF2_CLSZ - 8*OF2_INSZ) dup 0





    ; Cluster 10:
	db	OF2_CLSZ dup 0

    ; Cluster 11:
	db	OF2_CLSZ dup 0

    ; Cluster 12:
	file_10:
	file	'files/systemicus.bmp'
	file_10_sz = $ - file_10
	db	OF2_CLSZ - file_10_sz - 8 dup 0
	dd	file_10_sz
	dd	0

    ; Cluster 13:	  ; /lib
	; Dir Info
	dd	0x00000002			; parent dir cluster (root points to itself)
	dd	0x00000000			;
	dq	0x00000000			; folder size;
	dd	0x00000000			; folder serial number
	dd	0x00000004			; num of elements
	db	40 dup 0			;
	;
	; Inode
	dd	0x6AE69F02			; kernel32.dll
	dd	0x00000000			; File CRC32
	dd	file_17_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'SLIB'				; File type
	dd	0x00000014			; Start cluster
	dd	00100100000000000000000000010100b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; UID
	db	0x00				; GID
	db	'kernel32.dll////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)
	; Inode
	dd	0x02489AAB			; user32.dll
	dd	0x00000000			; File CRC32
	dd	file_18_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'SLIB'				; File type
	dd	0x00000015			; Start cluster
	dd	00100100000000000000000000010100b
	db	0x00				; UID
	db	0x00				; GID
	db	'user32.dll//////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)
	; Inode
	dd	0x2E90D8AF			; network32.dll
	dd	0x00000000			; File CRC32
	dd	file_22_sz			; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'SLIB'				; File type
	dd	0x00000019			; Start cluster
	dd	00100100000000000000000000010100b
	db	0x00				; UID
	db	0x00				; GID
	db	'network32.dll///////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)
	;
	; Inode
	dd	0x2F13997E			; omfs3.dll
	dd	0x00000000			; File CRC32
	dd	file_omfs3dll_sz		; File size
	dd	0x00000000			; Created (OMFS2_Created + $)
	dd	0x00000000			; Hash of encrypted data (or 0 if not used)
	dd	'SLIB'				; File type
	dd	0x0000001D			; Start cluster
	dd	00100100000000000000000000010100b
	db	0x00				; UID
	db	0x00				; GID
	db	'omfs3.dll///////////////////'	; File name (28 chars max) padded with '/'
	dw	0x00				; File name extra extension (00..99)
	;
	db	 (OF2_CLSZ - 5*OF2_INSZ) dup 0



	file_12:
	file	'files/license.txt'
	file_12_sz = $ - file_12
	db	OF2_CLSZ - file_12_sz - 8 dup 0
	dd	file_12_sz
	dd	0

	file_01:
	file	'files/fonts/font_slim_cp1251_8x8.fnt':0, 2048	 ; ? OK CP866 RUS Nomral
      ;  file	 'files/fonts/font_typ_cp1251_8x8.fnt':0, 2048	 ; ? OK CP866 RUS Courier
      ;  file	 'files/fonts/font_arc_cp1251_8x8.fnt':0, 2048	 ; ? OK CP866 RUS Bold
	file_01_sz = $ - file_01
	db	OF2_CLSZ - file_01_sz - 8 dup 0
	dd	file_01_sz
	dd	0

	file_14:
	file	'apps/thoth.exe'
	file_14_sz = $ - file_14
	db	OF2_CLSZ - file_14_sz - 8 dup 0
	dd	file_14_sz
	dd	0


	file_15:
	file	'files/rtoslogo.gif'
	file_15_sz = $ - file_15
	db	OF2_CLSZ - file_15_sz - 8 dup 0
	dd	file_15_sz
	dd	0



	db	OF2_CLSZ dup 0
	db	OF2_CLSZ dup 0



	file_17:
	file	'dll/kernel32.dll'
	file_17_sz = $ - file_17
	db	OF2_CLSZ - file_17_sz - 8 dup 0
	dd	file_17_sz
	dd	0

; clustre 0x15
	file_18:
	file	'dll/user32.dll'
	file_18_sz = $ - file_18
	db	OF2_CLSZ - file_18_sz - 8 dup 0
	dd	file_18_sz
	dd	0

; clustre 0x16
	file_19:
	file	'apps/peraw.exe'
	file_19_sz = $ - file_19
	db	OF2_CLSZ - file_19_sz - 8 dup 0
	dd	file_19_sz
	dd	0

; clustre 0x17
	file_0x17:
	file	'files/wall.jpg'
	file_0x17_sz = $ - file_0x17
	db	OF2_CLSZ - file_0x17_sz - 8 dup 0
	dd	file_0x17_sz
	dd	0

; clustre 0x18
	file_21:
	file	'apps/explorer.exe'
	file_21_sz = $ - file_21
	db	OF2_CLSZ - file_21_sz - 8 dup 0
	dd	file_21_sz
	dd	0

; clustre 0x19
	file_22:
	file	'dll/network32.dll'
	file_22_sz = $ - file_22
	db	OF2_CLSZ - file_22_sz - 8 dup 0
	dd	file_22_sz
	dd	0

; clustre 0x1A
	file_23:
	file	'apps/terminal.exe'
	file_23_sz = $ - file_23
	db	OF2_CLSZ - file_23_sz - 8 dup 0
	dd	file_23_sz
	dd	0

; clustre 0x1B
	file_24:
	file	'apps/mice.sys'
	file_24_sz = $ - file_24
	db	OF2_CLSZ - file_24_sz - 8 dup 0
	dd	file_24_sz
	dd	0

; clustre 0x1C
	file_25:
	file	'apps/network.sys'
	file_25_sz = $ - file_25
	db	OF2_CLSZ - file_25_sz - 8 dup 0
	dd	file_25_sz
	dd	0




; clustre 0x1D
	file_omfs3dll:
	file	'dll/omfs3.dll'
	file_omfs3dll_sz = $ - file_omfs3dll
	db	OF2_CLSZ - file_omfs3dll_sz - 8 dup 0
	dd	file_omfs3dll_sz
	dd	0

; clustre 0x1E
	file_notepad:
	file	'apps/notepad.exe'
	file_notepad_sz = $ - file_notepad
	db	OF2_CLSZ - file_notepad_sz - 8 dup 0
	dd	file_notepad_sz
	dd	0

; clustre 0x1F /usr/doc
	; Dir Info
	dd	0x00000009			; parent dir cluster (root points to itself)
	dd	0x00000000			;
	dq	0x00000000			; folder size;
	dd	0x00000000			; folder serial number
	dd	0x00000001			; num of elements
	db	40 dup 0			;
	;
	; Inode   mice.exe
	dd	0x8BCEA97C			; +00 File name CRC32
	dd	0x00000000			; +04 File CRC32
	dd	file_1F_sz			; +08 File size
	dd	0x00000000			; +12 Created (OMFS2_Created + $)
	dd	0x00000000			; +16 Hash of encrypted data (or 0 if not used)
	dd	'TEXT'				; +20 File type
	dd	0x00000020			; +24 Start cluster
	dd	00100100000000000000000000000110b
	;	cerwxrwxSS--------------blhsdrwx
	db	0x00				; +32 UID
	db	0x00				; +33 GID
	db	'fortunes////////////////////'	; +34 File name (28 chars max) padded with '/'
	dw	0x00				; +62 File name extra extension (00..99)
	;
	db	 (OF2_CLSZ - 2*OF2_INSZ) dup 0

; clustre 0x20
	file_1F:
	file	'.fortunes'
	file_1F_sz = $ - file_1F
	db	OF2_CLSZ - file_1F_sz - 8 dup 0
	dd	file_1F_sz
	dd	0

; clustre 0x21
	file_100:
	file	'files/wall.gif'
	file_100_sz = $ - file_100
	db	OF2_CLSZ - file_100_sz - 8 dup 0
	dd	file_100_sz
	dd	0

;DB DISKSIZE-$ DUP 0x00
