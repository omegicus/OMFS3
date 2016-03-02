debugging:

DISKSIZE = 1024*1024*4


       
			     
			     
			     
			     
			     
			     
       
	  
      
WindowSZS_TitleHeight	= 20
WindowSZS_BorderWidth	= 03
WindowSZS_MenuHeight	= 20
			     
			     
			     




;============================================================================================================;
; OMFS-3
OF2_VERS =   02
OF2_SSSZ = 0512 		; sector size
OF2_CLSS = 0128 		; sectors per cluster
OF2_CLSZ = OF2_CLSS * OF2_SSSZ	; cluster size in bytes (64 KiB)
OF2_CLDS = OF2_CLSZ - 8 	; cluster data size
OF2_INSZ = 0064 		; inode size
OF2_DRNR = OF2_CLSZ/OF2_INSZ	; num of records in dir
OF2_RTCN = 0002 		; # of root cluster
OF2_BTSZ = 64*1024		; size of bitmap area







LMM_BLOCK_SIZE	EQU 0x10000
LMM_MAP_SZ	EQU ( ADDRPROSTOR*MB ) / LMM_BLOCK_SIZE






; RADHARANI
; System colors
	colorBG_RedHAT	       equ 0x005F6986 ; Cool
	White		       equ 0x00FFFFFF
	Black		       equ 0x00000000



lotus_border		= 0x00000000
lotus_pcolor		= 0x00D6D3CE
lotus_height		= 26
lotus_skipheight	= 40
lotus_dcolor		= 0x00AAAAAA   ;0x00054D5B;
lotuspanel_text 	= 0x00000000
lotusmenu_width 	= 120

radhe_bcolor		=  0x00396DA5
radharani_bg_col	=  radhe_bcolor
radha_win_tb_col	=  0x00000080 ; title bgColor
radha_win_tt_col	=  0x00FFFFFF ; title Color
radha_win_dkgray	=  0x00808080 ; darkgray
radha_win_ltgray	=  0x00C0C0C0 ; lightgray
radha_win_wwhite	=  0x00FFFFFF ; white
radha_win_bblack	=  0x00000000 ; black
radha_text_color	=  0x00000000
radha_win_vdgray	=  0x00404040


radha16_bblack		= 00
radha16_dkredd		= 01
radha16_dkgren		= 02
radha16_dkyelw		= 03
radha16_ttblue		= 04
radha16_ttviol		= 05
radha16_ttmarn		= 06
radha16_dkgray		= 07
radha16_ltgray		= 08
radha16_ltredd		= 09
radha16_ltgren		= 10
radha16_ltylow		= 11
radha16_ltblue		= 12
radha16_transp		= 13 ; tsparent (pink)
radha16_ltcyan		= 14
radha16_wwhite		= 15

xradha16_bblack 	 = 16
xradha16_dkredd 	 = 17
xradha16_dkgren 	 = 18
xradha16_dkyelw 	 = 19
xradha16_ttblue 	 = 20
xradha16_ttviol 	 = 21
xradha16_ttmarn 	 = 22
xradha16_dkgray 	 = 23
xradha16_ltgray 	 = 24
xradha16_ltredd 	 = 25
xradha16_ltgren 	 = 26
xradha16_ltylow 	 = 27
xradha16_ltblue 	 = 28
xradha16_transp 	 = 29
xradha16_ltcyan 	 = 30
xradha16_wwhite 	 = 31

rdhe256_ltltblue	 = 32
rdhe256_ltdkblue	 = 33
rdhe256_ltltgray	 = 34
rdhe256_ltdkgra 	 = 35
rdhe256_awinbgcl	 = 36 ; frame active
rdhe256_awcredcl	 = 37 ; close active
rdhe256_scrll_bg	 = 38 ;
rdhe256_scrll_fg	 = 39 ;

radha16_vdgray		= radha16_dkgray
radha16_textcl		= radha16_bblack
radha16_panelc		= radha16_wwhite






EXPLREVNT_RELSE = 0
EXPLREVNT_CLICK = 1
EXPLREVNT_HOVER = 2
EXPLREVNT_KEYPR = 10
EXPLREVNT_KEYRL = 11


;COLORS:
;	 dd 0x00000000	 ; 0
;	 dd 0x00800000	 ; 1
;	 dd 0x00008000	 ; 2
;	 dd 0x00808000	 ; 3
;	 dd 0x00000080	 ; 4
;	 dd 0x00800080	 ; 5
;	 dd 0x00008080	 ; 6
;	 dd 0x00808080	 ; 7
;	 dd 0x00C0C0C0	 ; 8
;	 dd 0x00FF0000	 ; 9
;	 dd 0x0000FF00	 ; 10
;	 dd 0x00FFFF00	 ; 11
;	 dd 0x000000FF	 ; 12
;	 dd 0x00FF00FF	 ; 13 transparent
;	 dd 0x0000FFFF	 ; 14
;	 dd 0x00FFFFFF	 ; 15


; GUI
   wnd_topa_size = 22
   wnd_margin_sz = 07
   wnd_border_sz = 01
   wnd_mrgn_tops = wnd_topa_size + wnd_border_sz*2 + wnd_margin_sz ;
   wnd_mrgn_left = wnd_margin_sz + wnd_border_sz*2
   wnd_skip_horz = wnd_mrgn_left * 2
   wnd_skip_vert = wnd_mrgn_left + wnd_mrgn_tops



WNDLIST_ITEM_SZ 	= 64 ; 32 for MSG structure
DESKTOP_WINDOWS 	= 128;255
TOPMOSTLEVEL		= 256;511


BTN_STATE_NORMAL	= 00000000000000000000000000000000b ; 0
BTN_STATE_PRESSED	= 00000000000000000000000000000010b ; 1
BTN_CHECKBOX_OFF	= 00000000000000000000000000000100b ; 2
BTN_CHECKBOX_ON 	= 00000000000000000000000000001000b ; 3
BTN_RADIO_OFF		= 00000000000000000000000000010000b ; 4
BTN_RADIO_ON		= 00000000000000000000000000100000b ; 5





MS_REDRAW		= 0x00000001
MS_CLOSE		= 0x00000002
MS_MINIMIZE		= 0x00000003
MS_RESTORE		= 0x00000004
MS_MAXIMIZE		= 0x00000005
MS_CLICKED		= 0x00000006


; FONTS: {{
	FONT_SZX		EQU 8;05;08
	FONT_SZY		EQU 8;09;08
	cursSz			EQU 08;06;12
FNTFAM_FIX_NORMAL   = 0x00000000
FNTFAM_FIX_BOLD     = 0x00000001
FNTFAM_FIX_COURIER  = 0x00000002
FNTFAM_FIX_ITALIC   = 0x00000003
; END OF FONTS }}

MASK_NULLMASK		= 00000000000000000000000000000000b
MASK_GOTCLICK		= 10000000000000000000000000000000b ; 31
MASK_UPDATEWN		= 01000000000000000000000000000000b ; 30
MASK_LEFTBTUP		= 00100000000000000000000000000000b ; 29
MASK_LEFTBTDN		= 00010000000000000000000000000000b ; 28
MASK_RGHTBTUP		= 00001000000000000000000000000000b ; 27
MASK_RGHTBTDN		= 00000100000000000000000000000000b ; 26
MASK_CHKCHILD		= 00000010000000000000000000000000b ; 25
MASK_MOVINGWN		= 00000001000000000000000000000000b ; 24
MASK_ACTIVEWN		= 00000000100000000000000000000000b ; 23
MASK_MINIMIZD		= 00000000010000000000000000000000b ; 22
MASK_FULLUPDT		= 00000000000000000000000000000001b ;

MASW_NOTITBAR		= 00000000000000000000000000000010b ; 01
MASW_TOPMOST		= 00000000000000000000000000000100b ; 02


WIN_TITLE_ACTIVE	= 0
WIN_TITLE_INACTIVE	= 2


WINEVNT_NONEEV = 0x00000000
WINEVNT_CLOSEW = 0x00000001
WINEVNT_MINIMZ = 0x00000002
WINEVNT_RESTOR = 0x00000003
;WINEVNT_MINIM = 0x00000004










; RADHE:
  radhe_elements_fulsz = 32 * 2048
  radhe_elements_elmsz = 32
  ;
  radheelm_flags:
	RELM_TBUT     = 00000001b
	RELM_TTXT     = 00000010b
	RELM_CBOX     = 00000100b
	RELM_CRAD     = 00000101b
	;
	;			  ; FLAGS-128:
	RELM_ACTV     = 10000000b ; active...
	RELM_SHVR     = 01000000b ; hover...
	RELM_LCDN     = 00100000b ; l_click_dn
	RELM_LCUP     = 00010000b ; l_click_up














; MICE:
MT_3B	      = 0x01
MT_3BScroll   = 0x02
MT_5BScroll   = 0x03
CURSOR_SZ     =   16



LINE		 EQU 0x0D

LFBVADDR     = 0xE0000000
EXEC_ADDR	 EQU	0x08000000;0x40000

; NETWORK
ETHER_IP4	=	0x0008;0x0008  ; Reversed from 0800 for intel 0800
ETHER_IP6	=	0xDD86	; 86DD
ETHER_ARP	=	0x0608	; 0x0608  ; 0806
ETHER_RARP	=	0x3580	; 8035


IPBUFFSIZE	=	1500		    ; MTU of an ethernet packet

; IP protocols
PROTOCOL_IP	=	00
PROTOCOL_ICMP	=	01
PROTOCOL_TCP	=	06
PROTOCOL_UDP	=	17

; Address families
AF_UNSPEC	= 0
AF_INET 	= 2	; IPv4
;AF_INET6	= 28	; IPv6 (not supported)

PF_UNSPEC	= AF_UNSPEC
PF_INET 	= AF_INET
;PF_INET6	= AF_INET6







; GOVINDA
govinda_colors_window	= 0x002E3436
govinda_colors_wbgtit	= 0x00252A2B
govinda_colors_wtitle	= 0x00FFFFFF
govinda_colors_wcontr	= 0x00555753
VAR_COL_ALERT		= 0x00AA0000
EQU_GREEN		= 0x0000FF00
EQU_RED 		= 0x00FF0000
EQU_LBLUE		= 0x0000AFF0

govinda_window_titleheight = 30
govinda_window_titlemargin = 10



















;------------------------------------------------;
;						 ;
; OMEGICUS FS					 ;
;						 ;
OFS_MBR_ID		=   0x47
BOOT_ADDR		=   0x7C00		 ;
OFS_VER 		=   1			 ; FS VERSION
OFS_CS			=   8			 ; CLUSTER SIZE
OFS_SS			=   512 		 ; SECTOR SIZE
OFS_CLS 	= OFS_SS*OFS_CS
OFS_SYSTAREA_SZ 	=   2 * 16 * OFS_CS	  ; NUM OF SECTORS FOR FS BITMAP + LOADER (KERNEL)
OFS_DIR_RECORDS 	=   64			 ;
OFS_RECORD_SIZE 	=   64			 ;
OMFS_ROOT_CLUSTER	=   01			 ;
OFS_PSIZE		EQU 0x10000		 ; PART SIZE IN SECTORS. divable by 64
OFS_EN			EQU 'NONE'		 ; ENCRYPTION
OFS_OW			EQU 'KABAK V.'		 ; OWNER
OFS_BIT 		EQU 32			 ; OPT RECORD SIZE (bit)
OFS_OPT_SYST		EQU 0x0000001		 ;
OFS_OPT_FREE		EQU 0x0000000		 ;
OFS_OPT_BADB		EQU 0xFFFFFFFF		 ;
OFS_OPT_LAST		EQU 0xFFFFFFFE		 ;
; FILE TYPES					 ;
OFS_FTYPE_EXEC_OM	EQU 'OMEG'		 ;
;						 ;
;						 ;
;------------------------------------------------;



; ========== SE86 OMEGICUS EXE FORMAT :
  SE86_HEAD_SIZE	=   40
  SE86_HEAD_MAGW	=   'OMEG'
; ====================================;















;
; ICMP types & codes, RFC 792 and FreeBSD's ICMP sources
;
	ICMP_ECHOREPLY		equ	0		; echo reply message
ICMP_UNREACH		equ	3
	ICMP_UNREACH_NET	equ	0		; bad net
	ICMP_UNREACH_HOST	equ	1		; bad host
	ICMP_UNREACH_PROTOCOL	equ	2		; bad protocol
	ICMP_UNREACH_PORT	equ	3		; bad port
	ICMP_UNREACH_NEEDFRAG	equ	4		; IP_DF caused drop
	ICMP_UNREACH_SRCFAIL	equ	5		; src route failed
	ICMP_UNREACH_NET_UNKNOWN equ	6		; unknown net
	ICMP_UNREACH_HOST_UNKNOWN equ	7		; unknown host
	ICMP_UNREACH_ISOLATED	equ	8		; src host isolated
	ICMP_UNREACH_NET_PROHIB equ	9		; prohibited access
	ICMP_UNREACH_HOST_PROHIB equ	10		; ditto
	ICMP_UNREACH_TOSNET	equ	11		; bad tos for net
	ICMP_UNREACH_TOSHOST	equ	12		; bad tos for host
	ICMP_UNREACH_FILTER_PROHIB equ	13		; admin prohib
	ICMP_UNREACH_HOST_PRECEDENCE equ 14		; host prec vio.
	ICMP_UNREACH_PRECEDENCE_CUTOFF equ 15		; prec cutoff
ICMP_SOURCEQUENCH	equ	4		; packet lost, slow down
ICMP_REDIRECT		equ	5		; shorter route, codes:
	ICMP_REDIRECT_NET	equ	0		; for network
	ICMP_REDIRECT_HOST	equ	1		; for host
	ICMP_REDIRECT_TOSNET	equ	2		; for tos and net
	ICMP_REDIRECT_TOSHOST	equ	3		; for tos and host
ICMP_ALTHOSTADDR	equ	6		; alternate host address
ICMP_ECHO		equ	8		; echo service
ICMP_ROUTERADVERT	equ	9		; router advertisement
	ICMP_ROUTERADVERT_NORMAL equ 0			; normal advertisement
	ICMP_ROUTERADVERT_NOROUTE_COMMON equ 16 	; selective routing
ICMP_ROUTERSOLICIT	equ	10		; router solicitation
ICMP_TIMXCEED		equ	11		; time exceeded, code:
    ICMP_TIMXCEED_INTRANS	equ	0		; ttl==0 in transit
    ICMP_TIMXCEED_REASS equ	1		; ttl==0 in reass
ICMP_PARAMPROB		  equ  12		; ip header bad
    ICMP_PARAMPROB_ERRATPTR   equ  0		; error at param ptr
    ICMP_PARAMPROB_OPTABSENT  equ  1		; req. opt. absent
    ICMP_PARAMPROB_LENGTH     equ  2		; bad length
ICMP_TSTAMP		equ	13		; timestamp request
ICMP_TSTAMPREPLY	equ	14		; timestamp reply
ICMP_IREQ		equ	15		; information request
ICMP_IREQREPLY		equ	16		; information reply
ICMP_MASKREQ		equ	17		; address mask request
ICMP_MASKREPLY		equ	18		; address mask reply
ICMP_TRACEROUTE 	equ	30		; traceroute
ICMP_DATACONVERR	equ	31		; data conversion error
ICMP_MOBILE_REDIRECT	equ	32		; mobile host redirect
ICMP_IPV6_WHEREAREYOU	equ	33		; IPv6 where-are-you
 ICMP_IPV6_IAMHERE	equ	34		; IPv6 i-am-here
ICMP_MOBILE_REGREQUEST	equ	35		; mobile registration req
ICMP_MOBILE_REGREPLY	equ	36		; mobile registreation reply
ICMP_SKIP		equ	39		; SKIP
ICMP_PHOTURIS		equ	40		; Photuris
    ICMP_PHOTURIS_UNKNOWN_INDEX   equ  1		; unknown sec index
    ICMP_PHOTURIS_AUTH_FAILED	  equ  2		; auth failed
    ICMP_PHOTURIS_DECRYPT_FAILED  equ  3		; decrypt failed
























; PCI
PCI_CONFIG_ADDRESS	EQU	0x0CF8
PCI_CONFIG_DATA 	EQU	0x0CFC




















MEM_WB	   equ 6	       ; write-back memory
MEM_WC	   equ 1	       ; write combined memory
MEM_UC	   equ 0	       ; uncached memory

dpl0	equ  10010000b	   ; data read	     dpl0
drw0	equ  10010010b	    ; data read/write dpl0
drw3	equ  11110010b	    ; data read/write dpl3
cpl0	equ  10011010b	    ; code read dpl0
cpl3	equ  11111010b	    ; code read dpl3

D32	equ  01000000b	    ; 32bit segment
G32	equ  10000000b	    ; page gran


;;;;;;;;;;;;cpu_caps flags;;;;;;;;;;;;;;;;

CPU_386        equ 3
CPU_486        equ 4
CPU_PENTIUM    equ 5
CPU_P6	       equ 6
CPU_PENTIUM4   equ 0x0F

CAPS_FPU       equ    00 ;on-chip x87 floating point unit
CAPS_VME       equ    01 ;virtual-mode enhancements
CAPS_DE        equ    02 ;debugging extensions
CAPS_PSE       equ    03 ;page-size extensions
CAPS_TSC       equ    04 ;time stamp counter
CAPS_MSR       equ    05 ;model-specific registers
CAPS_PAE       equ    06 ;physical-address extensions
CAPS_MCE       equ    07 ;machine check exception
CAPS_CX8       equ    08 ;CMPXCHG8B instruction
CAPS_APIC      equ    09 ;on-chip advanced programmable
			 ; interrupt controller
;		      10 ;unused
CAPS_SEP       equ    11 ;SYSENTER and SYSEXIT instructions
CAPS_MTRR      equ    12 ;memory-type range registers
CAPS_PGE       equ    13 ;page global extension
CAPS_MCA       equ    14 ;machine check architecture
CAPS_CMOV      equ    15 ;conditional move instructions
CAPS_PAT       equ    16 ;page attribute table

CAPS_PSE36     equ    17 ;page-size extensions
CAPS_PSN       equ    18 ;processor serial number
CAPS_CLFLUSH   equ    19 ;CLFUSH instruction

CAPS_DS        equ    21 ;debug store
CAPS_ACPI      equ    22 ;thermal monitor and software
			 ;controlled clock supported
CAPS_MMX       equ    23 ;MMX instructions
CAPS_FXSR      equ    24 ;FXSAVE and FXRSTOR instructions
CAPS_SSE       equ    25 ;SSE instructions
CAPS_SSE2      equ    26 ;SSE2 instructions
CAPS_SS        equ    27 ;self-snoop
CAPS_HTT       equ    28 ;hyper-threading technology
CAPS_TM        equ    29 ;thermal monitor supported
CAPS_IA64      equ    30 ;IA64 capabilities
CAPS_PBE       equ    31 ;pending break enable

;ecx
CAPS_SSE3      equ    32 ;SSE3 instructions
;		      33
;		      34
CAPS_MONITOR   equ    35 ;MONITOR/MWAIT instructions
CAPS_DS_CPL    equ    36 ;
CAPS_VMX       equ    37 ;virtual mode extensions
;		      38 ;
CAPS_EST       equ    39 ;enhansed speed step
CAPS_TM2       equ    40 ;thermal monitor2 supported
;		      41
CAPS_CID       equ    42 ;
;		      43
;		      44
CAPS_CX16      equ    45 ;CMPXCHG16B instruction
CAPS_xTPR      equ    46 ;
;
;reserved
;
;ext edx /ecx
CAPS_SYSCAL    equ    64 ;
CAPS_XD        equ    65 ;execution disable
CAPS_FFXSR     equ    66 ;
CAPS_RDTSCP    equ    67 ;
CAPS_X64       equ    68 ;
CAPS_3DNOW     equ    69 ;
CAPS_3DNOWEXT  equ    70 ;
CAPS_LAHF      equ    71 ;
CAPS_CMP_LEG   equ    72 ;
CAPS_SVM       equ    73 ;secure virual machine
CAPS_ALTMOVCR8 equ    74 ;
;CAPS_MTRR	equ    12 ; MTRR


CAPS_FPU       equ    00 ;on-chip x87 floating point unit
CAPS_VME       equ    01 ;virtual-mode enhancements
CAPS_DE       equ    02 ;debugging extensions
CAPS_PSE       equ    03 ;page-size extensions
CAPS_TSC       equ    04 ;time stamp counter
CAPS_MSR       equ    05 ;model-specific registers
CAPS_PAE       equ    06 ;physical-address extensions
CAPS_MCE       equ    07 ;machine check exception
CAPS_CX8       equ    08 ;CMPXCHG8B instruction
CAPS_APIC     equ    09 ;on-chip advanced programmable
			 ; interrupt controller
;		      10 ;unused
CAPS_SEP       equ    11 ;SYSENTER and SYSEXIT instructions
CAPS_MTRR      equ    12 ;memory-type range registers
CAPS_PGE       equ    13 ;page global extension
CAPS_MCA       equ    14 ;machine check architecture
CAPS_CMOV     equ    15 ;conditional move instructions
CAPS_PAT       equ    16 ;page attribute table
 
CAPS_PSE36     equ    17 ;page-size extensions
CAPS_PSN       equ    18 ;processor serial number
CAPS_CLFLUSH   equ    19 ;CLFUSH instruction
 
CAPS_DS       equ    21 ;debug store
CAPS_ACPI     equ    22 ;thermal monitor and software
			 ;controlled clock supported
CAPS_MMX       equ    23 ;MMX instructions
CAPS_FXSR     equ    24 ;FXSAVE and FXRSTOR instructions
CAPS_SSE       equ    25 ;SSE instructions
CAPS_SSE2     equ    26 ;SSE2 instructions
CAPS_SS       equ    27 ;self-snoop
CAPS_HTT       equ    28 ;hyper-threading technology
CAPS_TM       equ    29 ;thermal monitor supported
CAPS_IA64     equ    30 ;IA64 capabilities
CAPS_PBE       equ    31 ;pending break enable


; CPU MSR names
MSR_SYSENTER_CS 	equ	0x174
MSR_SYSENTER_ESP	equ	0x175
MSR_SYSENTER_EIP	equ	0x176
MSR_AMD_EFER		equ	0xC0000080	; Extended Feature Enable Register
MSR_AMD_STAR		equ	0xC0000081	; SYSCALL/SYSRET Target Address Register

CR0_PE	       equ    0x00000001   ;protected mode
CR0_MP	       equ    0x00000002   ;monitor fpu
CR0_EM	       equ    0x00000004   ;fpu emulation
CR0_TS	       equ    0x00000008   ;task switch
CR0_ET	       equ    0x00000010   ;extension type hardcoded to 1
CR0_NE	       equ    0x00000020   ;numeric error
CR0_WP	       equ    0x00010000   ;write protect
CR0_AM	       equ    0x00040000   ;alignment check
CR0_NW	       equ    0x20000000   ;not write-through
CR0_CD	       equ    0x40000000   ;cache disable
CR0_PG	       equ    0x80000000   ;paging


CR4_VME        equ    0x0001
CR4_PVI        equ    0x0002
CR4_TSD        equ    0x0004
CR4_DE	       equ    0x0008
CR4_PSE        equ    0x0010
CR4_PAE        equ    0x0020
CR4_MCE        equ    0x0040
CR4_PGE        equ    0x0080
CR4_PCE        equ    0x0100
CR4_OSFXSR     equ    0x0200
CR4_OSXMMEXPT  equ    0x0400

SSE_IE	       equ    0x0001
SSE_DE	       equ    0x0002
SSE_ZE	       equ    0x0004
SSE_OE	       equ    0x0008
SSE_UE	       equ    0x0010
SSE_PE	       equ    0x0020
SSE_DAZ        equ    0x0040
SSE_IM	       equ    0x0080
SSE_DM	       equ    0x0100
SSE_ZM	       equ    0x0200
SSE_OM	       equ    0x0400
SSE_UM	       equ    0x0800
SSE_PM	       equ    0x1000
SSE_FZ	       equ    0x8000

SSE_INIT equ (SSE_IM+SSE_DM+SSE_ZM+SSE_OM+SSE_UM+SSE_PM)









PG_SU_RW_PR = 011b
PG_SU_RW_NP = 010b
PG_SU_RO_PR = 001b
PG_SU_RO_NP = 000b
; US: If the bit is set, then the page may be accessed by all
PG_US_RW_PR = 111b
PG_US_RW_NP = 110b
PG_US_RO_PR = 101b
PG_US_RO_NP = 100b
PG_US_RW_PR_NC =  10111b; NOT CACHED....
PG_US_RW_PR_WT =  01111b; Write-Through
PG_US_RW_PR_WB =  00111b; write-back
PG_SU_RW_PR_NC =  10011b; NOT CACHED....
PG_SU_RW_PR_WT =  01011b; Write-Through
PG_SU_RW_PR_WB =  00011b; write-back
PG_SU_RW_PR_NC_WT = 11011B

LMM_NONE  = 00000000b	  ; FREE
LMM_URNP  = 00010000b	  ;
LMM_URXP  = 00110000b	  ;
LMM_UWNP  = 01010000b	  ; USER  R/W  nonEXE USED
LMM_UWXP  = 01110000b	  ; USER  R/W  EXE USED
LMM_SRNP  = 10010000b	  ;
LMM_SRXP  = 10110000b	  ;
LMM_SWNP  = 11010000b	  ; SVIS  R/W  nonEXE USED
LMM_SWXP  = 11110000b	  ; SVIS  R/W  EXE USED




include '../theme.inc'