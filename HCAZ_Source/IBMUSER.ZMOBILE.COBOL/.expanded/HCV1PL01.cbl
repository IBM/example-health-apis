      ******************************************************************
      *                                                                *
      * LICENSED MATERIALS - PROPERTY OF IBM                           *
      *                                                                *
      * "RESTRICTED MATERIALS OF IBM"                                  *
      *                                                                *
      * CB12                                                           *
      *                                                                *
      * (C) COPYRIGHT IBM CORP. 2011, 2014 ALL RIGHTS RESERVED         *
      *                                                                *
      * US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,      *
      * OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE                   *
      * CONTRACT WITH IBM CORPORATION                                  *
      *                                                                *
      *                                                                *
      *                    Patient Visit menu                          *
      *                                                                *
      * Menu for Patient transactions                                  *
      *                                                                *
      *                                                                *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCV1PL01.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-RESP                   PIC S9(8) COMP.

       77 INQ-TRANS                    PIC X(4) VALUE 'HCV1'.
       77 ADD-TRANS                    PIC X(4) VALUE 'HCVA'.

       77 MSGEND                     PIC X(24) VALUE
                                        'Transaction ended      '.

      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCMAPS.cpy at HCV1PL01.cbl line 39
       01  HCZMENUI.
           02  FILLER PIC X(12).
           02  HCZINPUTL    COMP  PIC  S9(4).
           02  HCZINPUTF    PICTURE X.
           02  FILLER REDEFINES HCZINPUTF.
             03 HCZINPUTA    PICTURE X.
           02  HCZINPUTI  PIC X(1).
           02  HCZMSGL    COMP  PIC  S9(4).
           02  HCZMSGF    PICTURE X.
           02  FILLER REDEFINES HCZMSGF.
             03 HCZMSGA    PICTURE X.
           02  HCZMSGI  PIC X(49).
       01  HCZMENUO REDEFINES HCZMENUI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  HCZINPUTO  PIC X(1).
           02  FILLER PICTURE X(3).
           02  HCZMSGO  PIC X(49).
       01  HCP1MAPI.
           02  FILLER PIC X(12).
           02  HCP1TRNL    COMP  PIC  S9(4).
           02  HCP1TRNF    PICTURE X.
           02  FILLER REDEFINES HCP1TRNF.
             03 HCP1TRNA    PICTURE X.
           02  HCP1TRNI  PIC X(4).
           02  HCP1TITL    COMP  PIC  S9(4).
           02  HCP1TITF    PICTURE X.
           02  FILLER REDEFINES HCP1TITF.
             03 HCP1TITA    PICTURE X.
           02  HCP1TITI  PIC X(27).
           02  HCP1PNOL    COMP  PIC  S9(4).
           02  HCP1PNOF    PICTURE X.
           02  FILLER REDEFINES HCP1PNOF.
             03 HCP1PNOA    PICTURE X.
           02  HCP1PNOI  PIC X(10).
           02  HCP1FNAL    COMP  PIC  S9(4).
           02  HCP1FNAF    PICTURE X.
           02  FILLER REDEFINES HCP1FNAF.
             03 HCP1FNAA    PICTURE X.
           02  HCP1FNAI  PIC X(10).
           02  HCP1LNAL    COMP  PIC  S9(4).
           02  HCP1LNAF    PICTURE X.
           02  FILLER REDEFINES HCP1LNAF.
             03 HCP1LNAA    PICTURE X.
           02  HCP1LNAI  PIC X(20).
           02  HCP1DOBL    COMP  PIC  S9(4).
           02  HCP1DOBF    PICTURE X.
           02  FILLER REDEFINES HCP1DOBF.
             03 HCP1DOBA    PICTURE X.
           02  HCP1DOBI  PIC X(10).
           02  HCP1ADDRL    COMP  PIC  S9(4).
           02  HCP1ADDRF    PICTURE X.
           02  FILLER REDEFINES HCP1ADDRF.
             03 HCP1ADDRA    PICTURE X.
           02  HCP1ADDRI  PIC X(20).
           02  HCP1CITYL    COMP  PIC  S9(4).
           02  HCP1CITYF    PICTURE X.
           02  FILLER REDEFINES HCP1CITYF.
             03 HCP1CITYA    PICTURE X.
           02  HCP1CITYI  PIC X(20).
           02  HCP1HPCL    COMP  PIC  S9(4).
           02  HCP1HPCF    PICTURE X.
           02  FILLER REDEFINES HCP1HPCF.
             03 HCP1HPCA    PICTURE X.
           02  HCP1HPCI  PIC X(10).
           02  HCP1HP2L    COMP  PIC  S9(4).
           02  HCP1HP2F    PICTURE X.
           02  FILLER REDEFINES HCP1HP2F.
             03 HCP1HP2A    PICTURE X.
           02  HCP1HP2I  PIC X(20).
           02  HCP1HMOL    COMP  PIC  S9(4).
           02  HCP1HMOF    PICTURE X.
           02  FILLER REDEFINES HCP1HMOF.
             03 HCP1HMOA    PICTURE X.
           02  HCP1HMOI  PIC X(30).
           02  HCP1INOL    COMP  PIC  S9(4).
           02  HCP1INOF    PICTURE X.
           02  FILLER REDEFINES HCP1INOF.
             03 HCP1INOA    PICTURE X.
           02  HCP1INOI  PIC X(10).
           02  HCP1UIDL    COMP  PIC  S9(4).
           02  HCP1UIDF    PICTURE X.
           02  FILLER REDEFINES HCP1UIDF.
             03 HCP1UIDA    PICTURE X.
           02  HCP1UIDI  PIC X(10).
           02  HCP1MSGL    COMP  PIC  S9(4).
           02  HCP1MSGF    PICTURE X.
           02  FILLER REDEFINES HCP1MSGF.
             03 HCP1MSGA    PICTURE X.
           02  HCP1MSGI  PIC X(40).
       01  HCP1MAPO REDEFINES HCP1MAPI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  HCP1TRNO  PIC X(4).
           02  FILLER PICTURE X(3).
           02  HCP1TITO  PIC X(27).
           02  FILLER PICTURE X(3).
           02  HCP1PNOO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCP1FNAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCP1LNAO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCP1DOBO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCP1ADDRO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCP1CITYO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCP1HPCO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCP1HP2O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCP1HMOO  PIC X(30).
           02  FILLER PICTURE X(3).
           02  HCP1INOO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCP1UIDO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCP1MSGO  PIC X(40).
       01  HCM1MAPI.
           02  FILLER PIC X(12).
           02  HCM1CNOL    COMP  PIC  S9(4).
           02  HCM1CNOF    PICTURE X.
           02  FILLER REDEFINES HCM1CNOF.
             03 HCM1CNOA    PICTURE X.
           02  HCM1CNOI  PIC X(10).
           02  HCM1FNAL    COMP  PIC  S9(4).
           02  HCM1FNAF    PICTURE X.
           02  FILLER REDEFINES HCM1FNAF.
             03 HCM1FNAA    PICTURE X.
           02  HCM1FNAI  PIC X(10).
           02  HCM1LNAL    COMP  PIC  S9(4).
           02  HCM1LNAF    PICTURE X.
           02  FILLER REDEFINES HCM1LNAF.
             03 HCM1LNAA    PICTURE X.
           02  HCM1LNAI  PIC X(20).
           02  HCM1DNA1L    COMP  PIC  S9(4).
           02  HCM1DNA1F    PICTURE X.
           02  FILLER REDEFINES HCM1DNA1F.
             03 HCM1DNA1A    PICTURE X.
           02  HCM1DNA1I  PIC X(27).
           02  HCM1DST1L    COMP  PIC  S9(4).
           02  HCM1DST1F    PICTURE X.
           02  FILLER REDEFINES HCM1DST1F.
             03 HCM1DST1A    PICTURE X.
           02  HCM1DST1I  PIC X(20).
           02  HCM1DAM1L    COMP  PIC  S9(4).
           02  HCM1DAM1F    PICTURE X.
           02  FILLER REDEFINES HCM1DAM1F.
             03 HCM1DAM1A    PICTURE X.
           02  HCM1DAM1I  PIC X(5).
           02  HCM1DRO1L    COMP  PIC  S9(4).
           02  HCM1DRO1F    PICTURE X.
           02  FILLER REDEFINES HCM1DRO1F.
             03 HCM1DRO1A    PICTURE X.
           02  HCM1DRO1I  PIC X(20).
           02  HCM1DFR1L    COMP  PIC  S9(4).
           02  HCM1DFR1F    PICTURE X.
           02  FILLER REDEFINES HCM1DFR1F.
             03 HCM1DFR1A    PICTURE X.
           02  HCM1DFR1I  PIC X(20).
           02  HCM1DNA2L    COMP  PIC  S9(4).
           02  HCM1DNA2F    PICTURE X.
           02  FILLER REDEFINES HCM1DNA2F.
             03 HCM1DNA2A    PICTURE X.
           02  HCM1DNA2I  PIC X(27).
           02  HCM1DST2L    COMP  PIC  S9(4).
           02  HCM1DST2F    PICTURE X.
           02  FILLER REDEFINES HCM1DST2F.
             03 HCM1DST2A    PICTURE X.
           02  HCM1DST2I  PIC X(20).
           02  HCM1DAM2L    COMP  PIC  S9(4).
           02  HCM1DAM2F    PICTURE X.
           02  FILLER REDEFINES HCM1DAM2F.
             03 HCM1DAM2A    PICTURE X.
           02  HCM1DAM2I  PIC X(5).
           02  HCM1DRO2L    COMP  PIC  S9(4).
           02  HCM1DRO2F    PICTURE X.
           02  FILLER REDEFINES HCM1DRO2F.
             03 HCM1DRO2A    PICTURE X.
           02  HCM1DRO2I  PIC X(20).
           02  HCM1DFR2L    COMP  PIC  S9(4).
           02  HCM1DFR2F    PICTURE X.
           02  FILLER REDEFINES HCM1DFR2F.
             03 HCM1DFR2A    PICTURE X.
           02  HCM1DFR2I  PIC X(20).
           02  HCM1DNA3L    COMP  PIC  S9(4).
           02  HCM1DNA3F    PICTURE X.
           02  FILLER REDEFINES HCM1DNA3F.
             03 HCM1DNA3A    PICTURE X.
           02  HCM1DNA3I  PIC X(27).
           02  HCM1DST3L    COMP  PIC  S9(4).
           02  HCM1DST3F    PICTURE X.
           02  FILLER REDEFINES HCM1DST3F.
             03 HCM1DST3A    PICTURE X.
           02  HCM1DST3I  PIC X(20).
           02  HCM1DAM3L    COMP  PIC  S9(4).
           02  HCM1DAM3F    PICTURE X.
           02  FILLER REDEFINES HCM1DAM3F.
             03 HCM1DAM3A    PICTURE X.
           02  HCM1DAM3I  PIC X(5).
           02  HCM1DRO3L    COMP  PIC  S9(4).
           02  HCM1DRO3F    PICTURE X.
           02  FILLER REDEFINES HCM1DRO3F.
             03 HCM1DRO3A    PICTURE X.
           02  HCM1DRO3I  PIC X(20).
           02  HCM1DFR3L    COMP  PIC  S9(4).
           02  HCM1DFR3F    PICTURE X.
           02  FILLER REDEFINES HCM1DFR3F.
             03 HCM1DFR3A    PICTURE X.
           02  HCM1DFR3I  PIC X(20).
           02  HCM1MSGL    COMP  PIC  S9(4).
           02  HCM1MSGF    PICTURE X.
           02  FILLER REDEFINES HCM1MSGF.
             03 HCM1MSGA    PICTURE X.
           02  HCM1MSGI  PIC X(43).
       01  HCM1MAPO REDEFINES HCM1MAPI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  HCM1CNOO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCM1FNAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCM1LNAO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DNA1O  PIC X(27).
           02  FILLER PICTURE X(3).
           02  HCM1DST1O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DAM1O  PIC X(5).
           02  FILLER PICTURE X(3).
           02  HCM1DRO1O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DFR1O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DNA2O  PIC X(27).
           02  FILLER PICTURE X(3).
           02  HCM1DST2O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DAM2O  PIC X(5).
           02  FILLER PICTURE X(3).
           02  HCM1DRO2O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DFR2O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DNA3O  PIC X(27).
           02  FILLER PICTURE X(3).
           02  HCM1DST3O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DAM3O  PIC X(5).
           02  FILLER PICTURE X(3).
           02  HCM1DRO3O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1DFR3O  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCM1MSGO  PIC X(43).
       01  HCMAMAPI.
           02  FILLER PIC X(12).
           02  HCMACNOL    COMP  PIC  S9(4).
           02  HCMACNOF    PICTURE X.
           02  FILLER REDEFINES HCMACNOF.
             03 HCMACNOA    PICTURE X.
           02  HCMACNOI  PIC X(10).
           02  HCMAFNAL    COMP  PIC  S9(4).
           02  HCMAFNAF    PICTURE X.
           02  FILLER REDEFINES HCMAFNAF.
             03 HCMAFNAA    PICTURE X.
           02  HCMAFNAI  PIC X(10).
           02  HCMALNAL    COMP  PIC  S9(4).
           02  HCMALNAF    PICTURE X.
           02  FILLER REDEFINES HCMALNAF.
             03 HCMALNAA    PICTURE X.
           02  HCMALNAI  PIC X(20).
           02  HCMADNAML    COMP  PIC  S9(4).
           02  HCMADNAMF    PICTURE X.
           02  FILLER REDEFINES HCMADNAMF.
             03 HCMADNAMA    PICTURE X.
           02  HCMADNAMI  PIC X(27).
           02  HCMADSTRL    COMP  PIC  S9(4).
           02  HCMADSTRF    PICTURE X.
           02  FILLER REDEFINES HCMADSTRF.
             03 HCMADSTRA    PICTURE X.
           02  HCMADSTRI  PIC X(20).
           02  HCMADAMOL    COMP  PIC  S9(4).
           02  HCMADAMOF    PICTURE X.
           02  FILLER REDEFINES HCMADAMOF.
             03 HCMADAMOA    PICTURE X.
           02  HCMADAMOI  PIC X(5).
           02  HCMADROUL    COMP  PIC  S9(4).
           02  HCMADROUF    PICTURE X.
           02  FILLER REDEFINES HCMADROUF.
             03 HCMADROUA    PICTURE X.
           02  HCMADROUI  PIC X(20).
           02  HCMADFREL    COMP  PIC  S9(4).
           02  HCMADFREF    PICTURE X.
           02  FILLER REDEFINES HCMADFREF.
             03 HCMADFREA    PICTURE X.
           02  HCMADFREI  PIC X(2).
           02  HCMAIDENL    COMP  PIC  S9(4).
           02  HCMAIDENF    PICTURE X.
           02  FILLER REDEFINES HCMAIDENF.
             03 HCMAIDENA    PICTURE X.
           02  HCMAIDENI  PIC X(20).
           02  HCMATYPEL    COMP  PIC  S9(4).
           02  HCMATYPEF    PICTURE X.
           02  FILLER REDEFINES HCMATYPEF.
             03 HCMATYPEA    PICTURE X.
           02  HCMATYPEI  PIC X(2).
           02  HCMASDTAL    COMP  PIC  S9(4).
           02  HCMASDTAF    PICTURE X.
           02  FILLER REDEFINES HCMASDTAF.
             03 HCMASDTAA    PICTURE X.
           02  HCMASDTAI  PIC X(10).
           02  HCMAEDTAL    COMP  PIC  S9(4).
           02  HCMAEDTAF    PICTURE X.
           02  FILLER REDEFINES HCMAEDTAF.
             03 HCMAEDTAA    PICTURE X.
           02  HCMAEDTAI  PIC X(10).
           02  HCMAMSGL    COMP  PIC  S9(4).
           02  HCMAMSGF    PICTURE X.
           02  FILLER REDEFINES HCMAMSGF.
             03 HCMAMSGA    PICTURE X.
           02  HCMAMSGI  PIC X(40).
       01  HCMAMAPO REDEFINES HCMAMAPI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  HCMACNOO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCMAFNAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCMALNAO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCMADNAMO  PIC X(27).
           02  FILLER PICTURE X(3).
           02  HCMADSTRO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCMADAMOO  PIC X(5).
           02  FILLER PICTURE X(3).
           02  HCMADROUO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCMADFREO  PIC X(2).
           02  FILLER PICTURE X(3).
           02  HCMAIDENO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCMATYPEO  PIC X(2).
           02  FILLER PICTURE X(3).
           02  HCMASDTAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCMAEDTAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCMAMSGO  PIC X(40).
       01  HCV1MAPI.
           02  FILLER PIC X(12).
           02  HCV1TRNL    COMP  PIC  S9(4).
           02  HCV1TRNF    PICTURE X.
           02  FILLER REDEFINES HCV1TRNF.
             03 HCV1TRNA    PICTURE X.
           02  HCV1TRNI  PIC X(4).
           02  HCV1TITL    COMP  PIC  S9(4).
           02  HCV1TITF    PICTURE X.
           02  FILLER REDEFINES HCV1TITF.
             03 HCV1TITA    PICTURE X.
           02  HCV1TITI  PIC X(33).
           02  HCV1PNOL    COMP  PIC  S9(4).
           02  HCV1PNOF    PICTURE X.
           02  FILLER REDEFINES HCV1PNOF.
             03 HCV1PNOA    PICTURE X.
           02  HCV1PNOI  PIC X(10).
           02  HCV1FNAL    COMP  PIC  S9(4).
           02  HCV1FNAF    PICTURE X.
           02  FILLER REDEFINES HCV1FNAF.
             03 HCV1FNAA    PICTURE X.
           02  HCV1FNAI  PIC X(10).
           02  HCV1LNAL    COMP  PIC  S9(4).
           02  HCV1LNAF    PICTURE X.
           02  FILLER REDEFINES HCV1LNAF.
             03 HCV1LNAA    PICTURE X.
           02  HCV1LNAI  PIC X(20).
           02  HCV1DATEL    COMP  PIC  S9(4).
           02  HCV1DATEF    PICTURE X.
           02  FILLER REDEFINES HCV1DATEF.
             03 HCV1DATEA    PICTURE X.
           02  HCV1DATEI  PIC X(10).
           02  HCV1TIMEL    COMP  PIC  S9(4).
           02  HCV1TIMEF    PICTURE X.
           02  FILLER REDEFINES HCV1TIMEF.
             03 HCV1TIMEA    PICTURE X.
           02  HCV1TIMEI  PIC X(10).
           02  HCV1HRATEL    COMP  PIC  S9(4).
           02  HCV1HRATEF    PICTURE X.
           02  FILLER REDEFINES HCV1HRATEF.
             03 HCV1HRATEA    PICTURE X.
           02  HCV1HRATEI  PIC X(20).
           02  HCV1HRTHL    COMP  PIC  S9(4).
           02  HCV1HRTHF    PICTURE X.
           02  FILLER REDEFINES HCV1HRTHF.
             03 HCV1HRTHA    PICTURE X.
           02  HCV1HRTHI  PIC X(10).
           02  HCV1BLPRL    COMP  PIC  S9(4).
           02  HCV1BLPRF    PICTURE X.
           02  FILLER REDEFINES HCV1BLPRF.
             03 HCV1BLPRA    PICTURE X.
           02  HCV1BLPRI  PIC X(20).
           02  HCV1BPTHL    COMP  PIC  S9(4).
           02  HCV1BPTHF    PICTURE X.
           02  FILLER REDEFINES HCV1BPTHF.
             03 HCV1BPTHA    PICTURE X.
           02  HCV1BPTHI  PIC X(10).
           02  HCV1MSGL    COMP  PIC  S9(4).
           02  HCV1MSGF    PICTURE X.
           02  FILLER REDEFINES HCV1MSGF.
             03 HCV1MSGA    PICTURE X.
           02  HCV1MSGI  PIC X(40).
       01  HCV1MAPO REDEFINES HCV1MAPI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  HCV1TRNO  PIC X(4).
           02  FILLER PICTURE X(3).
           02  HCV1TITO  PIC X(33).
           02  FILLER PICTURE X(3).
           02  HCV1PNOO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCV1FNAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCV1LNAO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCV1DATEO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCV1TIMEO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCV1HRATEO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCV1HRTHO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCV1BLPRO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCV1BPTHO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCV1MSGO  PIC X(40).
       01  HCT1MAPI.
           02  FILLER PIC X(12).
           02  HCT1TRNL    COMP  PIC  S9(4).
           02  HCT1TRNF    PICTURE X.
           02  FILLER REDEFINES HCT1TRNF.
             03 HCT1TRNA    PICTURE X.
           02  HCT1TRNI  PIC X(4).
           02  HCT1TITL    COMP  PIC  S9(4).
           02  HCT1TITF    PICTURE X.
           02  FILLER REDEFINES HCT1TITF.
             03 HCT1TITA    PICTURE X.
           02  HCT1TITI  PIC X(33).
           02  HCT1PNOL    COMP  PIC  S9(4).
           02  HCT1PNOF    PICTURE X.
           02  FILLER REDEFINES HCT1PNOF.
             03 HCT1PNOA    PICTURE X.
           02  HCT1PNOI  PIC X(10).
           02  HCT1FNAL    COMP  PIC  S9(4).
           02  HCT1FNAF    PICTURE X.
           02  FILLER REDEFINES HCT1FNAF.
             03 HCT1FNAA    PICTURE X.
           02  HCT1FNAI  PIC X(10).
           02  HCT1LNAL    COMP  PIC  S9(4).
           02  HCT1LNAF    PICTURE X.
           02  FILLER REDEFINES HCT1LNAF.
             03 HCT1LNAA    PICTURE X.
           02  HCT1LNAI  PIC X(20).
           02  HCT1HRTHL    COMP  PIC  S9(4).
           02  HCT1HRTHF    PICTURE X.
           02  FILLER REDEFINES HCT1HRTHF.
             03 HCT1HRTHA    PICTURE X.
           02  HCT1HRTHI  PIC X(10).
           02  HCT1BPTHL    COMP  PIC  S9(4).
           02  HCT1BPTHF    PICTURE X.
           02  FILLER REDEFINES HCT1BPTHF.
             03 HCT1BPTHA    PICTURE X.
           02  HCT1BPTHI  PIC X(10).
           02  HCT1MSGL    COMP  PIC  S9(4).
           02  HCT1MSGF    PICTURE X.
           02  FILLER REDEFINES HCT1MSGF.
             03 HCT1MSGA    PICTURE X.
           02  HCT1MSGI  PIC X(40).
       01  HCT1MAPO REDEFINES HCT1MAPI.
           02  FILLER PIC X(12).
           02  FILLER PICTURE X(3).
           02  HCT1TRNO  PIC X(4).
           02  FILLER PICTURE X(3).
           02  HCT1TITO  PIC X(33).
           02  FILLER PICTURE X(3).
           02  HCT1PNOO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCT1FNAO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCT1LNAO  PIC X(20).
           02  FILLER PICTURE X(3).
           02  HCT1HRTHO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCT1BPTHO  PIC X(10).
           02  FILLER PICTURE X(3).
           02  HCT1MSGO  PIC X(40).
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCMAPS.cpy at HCV1PL01.cbl line 39
        01 COMM-AREA.
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCV1PL01.cbl line 41
      ******************************************************************
      *                                                                *
      * LICENSED MATERIALS - PROPERTY OF IBM                           *
      *                                                                *
      * "RESTRICTED MATERIALS OF IBM"                                  *
      *                                                                *
      * (C) COPYRIGHT IBM CORP. 2011, 2014 ALL RIGHTS RESERVED         *
      *                                                                *
      * US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,      *
      * OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE                   *
      * CONTRACT WITH IBM CORPORATION                                  *
      *                                                                *
      *                                                                *
      *               COPYBOOK for COMMAREA structure                  *
      *                                                                *
      *   This commarea can be used for most functions                 *
      *                                                                *
      *                                                                *
      *                                                                *
      ******************************************************************
           03 CA-REQUEST-ID            PIC X(6).
           03 CA-RETURN-CODE           PIC 9(2).
           03 CA-PATIENT-ID            PIC 9(10).
           03 CA-REQUEST-SPECIFIC      PIC X(32482).
      *    Fields used in INQ All and ADD patient
           03 CA-PATIENT-REQUEST REDEFINES CA-REQUEST-SPECIFIC.
              05 CA-INS-CARD-NUM       PIC X(10).
              05 CA-FIRST-NAME         PIC X(10).
              05 CA-LAST-NAME          PIC X(20).
              05 CA-DOB                PIC X(10).
              05 CA-ADDRESS            PIC X(20).
              05 CA-CITY               PIC X(20).
              05 CA-POSTCODE           PIC X(10).
              05 CA-PHONE-MOBILE       PIC X(20).
              05 CA-EMAIL-ADDRESS      PIC X(50).
              05 CA-USERID             PIC X(10).
              05 CA-ADDITIONAL-DATA    PIC X(32302).
      *    Fields used in Add Patient User
           03 CA-PATIENT-USER-REQUEST REDEFINES CA-REQUEST-SPECIFIC.
              05 CA-USERNAME           PIC X(10).
              05 CA-USERPASSWORD       PIC X(14).
              05 CA-ADDITIONAL-DATA    PIC X(32458).
      *     Fields used in UPD, ADD & DELETE medication
           03 CA-MEDICATION-REQUEST REDEFINES CA-REQUEST-SPECIFIC.
              05 CA-DRUG-NAME          PIC X(50).
              05 CA-STRENGTH           PIC X(20).
              05 CA-AMOUNT             PIC 9(03).
              05 CA-ROUTE              PIC X(20).
              05 CA-FREQUENCY          PIC X(20).
              05 CA-IDENTIFIER         PIC X(20).
              05 CA-BIOMED-TYPE        PIC X(2).
              05 CA-START-DATE         PIC X(10).
              05 CA-END-DATE           PIC X(10).
              05 CA-PRESCRIPTION-ID    PIC 9(10).
              05 CA-ADDITIONAL-DATA    PIC X(32317).
      *    Fields used in UPD, ADD & DELETE meditation
           03 CA-MEDITATION-REQUEST REDEFINES CA-REQUEST-SPECIFIC.
              05 CA-MEDITATION-NAME    PIC X(50).
              05 CA-MEDITATION-TYPE    PIC X(20).
              05 CA-RELIEF             PIC X(20).
              05 CA-POSTURE            PIC X(20).
              05 CA-HOW-OFTEN          PIC X(20).
              05 CA-ADDITIONAL-DATA    PIC X(32352).
      *    Fields used in INQ, UPD, ADD & DELETE thresholds
           03 CA-THRESHOLD-REQUEST REDEFINES CA-REQUEST-SPECIFIC.
              05 CA-HR-THRESHOLD       PIC X(10).
              05 CA-BP-THRESHOLD       PIC X(10).
              05 CA-MS-THRESHOLD       PIC X(10).
              05 CA-ADDITIONAL-DATA    PIC X(32452).
      *    Fields used in INQ, UPD, ADD & DELETE visit data
           03 CA-VISIT-REQUEST REDEFINES CA-REQUEST-SPECIFIC.
              05 CA-VISIT-DATE         PIC X(10).
              05 CA-VISIT-TIME         PIC X(10).
              05 CA-HEART-RATE         PIC X(10).
              05 CA-BLOOD-PRESSURE     PIC X(10).
              05 CA-MENTAL-STATE       PIC X(10).
              05 CA-ADDITIONAL-DATA    PIC X(32432).
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCV1PL01.cbl line 41

      *----------------------------------------------------------------*
      *****************************************************************
       PROCEDURE DIVISION.

      *---------------------------------------------------------------*
       MAINLINE SECTION.

           IF EIBCALEN > 0
              GO TO A-GAIN.

           Initialize HCV1MAPI.
           Initialize HCV1MAPO.
           Initialize COMM-AREA.
           MOVE LOW-VALUES To HCV1PNOO.

           MOVE -1 TO HCV1PNOL

           PERFORM SETUP-SCREEN.

      * Display appropriate screen
           EXEC CICS SEND MAP ('HCV1MAP')
                     FROM(HCV1MAPO)
                     MAPSET ('HCMAPS')
                     ERASE
                     CURSOR
                     RESP(WS-RESP)
                     END-EXEC.

        A-GAIN.

           EXEC CICS HANDLE AID
                     CLEAR(CLEARIT)
                     PF3(ENDIT)
                     PF12(CANCELIT)
                     END-EXEC.
           EXEC CICS HANDLE CONDITION
                     MAPFAIL(ENDIT)
                     END-EXEC.

           EXEC CICS RECEIVE MAP('HCV1MAP')
                     INTO(HCV1MAPI) ASIS TERMINAL
                     MAPSET('HCMAPS') END-EXEC.

           PERFORM GET-PATIENT.

           PERFORM GET-THRESHOLD.

      * Get patient visit data
           IF (HCV1DATEI EQUAL ZEROS OR SPACES OR LOW-VALUES) OR
              (HCV1TIMEI EQUAL ZEROS OR SPACES OR LOW-VALUES)
                 Move 'Enter visit date and time'
                       To  HCV1MSGO
                 MOVE -1 TO HCV1DATEL
           ELSE
      * Handle the Inquiry request
              IF EIBTRNID EQUAL INQ-TRANS
                 Move '01IVIS'   To CA-REQUEST-ID
                 Move HCV1PNOI   To CA-PATIENT-ID
                 Move HCV1DATEI  To CA-VISIT-DATE
                 Move HCV1TIMEI  To CA-VISIT-TIME

                 EXEC CICS LINK PROGRAM('HCV1BI01')
                        COMMAREA(COMM-AREA)
                        LENGTH(32500)
                 END-EXEC

                 IF CA-RETURN-CODE <= 1
                    Move CA-HEART-RATE     to HCV1HRATEI
                    Move CA-BLOOD-PRESSURE to HCV1BLPRI
      *             Move SPACES   to HCV1MSTATEI
                 END-IF
              ELSE
      * Handle the Add request
                 IF EIBTRNID EQUAL ADD-TRANS
                    Move '01AVIS'   To CA-REQUEST-ID
                    Move HCV1DATEI  To CA-VISIT-DATE
                    Move HCV1TIMEI  To CA-VISIT-TIME
                    Move HCV1HRATEI To CA-HEART-RATE
                    Move HCV1BLPRI  To CA-BLOOD-PRESSURE
      *             Move HCV1MSTATEI To CA-MENTAL-STATE

                    EXEC CICS LINK PROGRAM('HCV1BA01')
                              COMMAREA(COMM-AREA)
                             LENGTH(32500)
                    END-EXEC
                    IF CA-RETURN-CODE > 0
                       Exec CICS Syncpoint Rollback End-Exec
                       GO TO NO-ADD
                    END-IF

                    Move CA-PATIENT-ID   To HCV1PNOI
                    Move 'New Patient Visit Inserted'
                      To  HCV1MSGO

                 END-IF
              END-IF
           END-IF

           PERFORM SETUP-SCREEN.

           EXEC CICS SEND MAP ('HCV1MAP')
                     FROM(HCV1MAPO)
                     MAPSET ('HCMAPS')
                     CURSOR
           END-EXEC
           GO TO ENDIT-STARTIT.

      *          Move '01UVIS'   To CA-REQUEST-ID
      *          Move HCV1CNOI   To CA-PATIENT-ID
      *
      *          IF HCV1DATEI > SPACES
      *                Move HCV1HRATEI  to CA-HEART-RATE
      *                Move HCV1BLPRI   to CA-BLOOD-PRESSURE
      *                Move HCV1MSTATEI to CA-MENTAL-STATE
      *
      *                EXEC CICS LINK PROGRAM('HCV1BU01')
      *                    COMMAREA(COMM-AREA)
      *                    LENGTH(32500)
      *                END-EXEC
      *          ELSE
      *             Move HCV1HRTHI  to CA-HR-THRESHOLD
      *             Move HCV1BPTHI  to CA-BP-THRESHOLD
      *             Move HCV1MSTHI  to CA-MS-THRESHOLD
      *
      *             EXEC CICS LINK PROGRAM('HCT1BU01')
      *                  COMMAREA(COMM-AREA)
      *                  LENGTH(32500)
      *             END-EXEC
      *          END-IF
      *
      *          IF CA-RETURN-CODE > 0
      *            GO TO NO-UPD
      *          END-IF
      *
      *          Move CA-PATIENT-ID   To HCV1CNOI
      *          Move ' '             To HCV1OPTI
      *          IF HCV1DATEI > SPACES
      *             Move 'Patient visit details updated'
      *                  To  HCV1MSGO
      *          ELSE
      *             Move 'Patient threshold details updated'
      *                  To  HCV1MSGO
      *          END-IF
      *          EXEC CICS SEND MAP ('HCV1MAP')
      *                    FROM(HCV1MAPO)
      *                    MAPSET ('HCMAPS')
      *          END-EXEC
      *          GO TO ENDIT-STARTIT

      *    Send message to terminal and return

           EXEC CICS RETURN
           END-EXEC.

       ENDIT-STARTIT.
           EXEC CICS RETURN
                TRANSID(EIBTRNID)
                COMMAREA(COMM-AREA)
                END-EXEC.

       ENDIT.
           EXEC CICS SEND TEXT
                     FROM(MSGEND)
                     LENGTH(LENGTH OF MSGEND)
                     ERASE
                     FREEKB
           END-EXEC
           EXEC CICS RETURN
           END-EXEC.

       CLEARIT.

           Initialize HCV1MAPI.
           EXEC CICS SEND MAP ('HCV1MAP')
                     MAPSET ('HCMAPS')
                     MAPONLY
           END-EXEC

           EXEC CICS RETURN
                TRANSID(EIBTRNID)
                COMMAREA(COMM-AREA)
                END-EXEC.

       CANCELIT.

           EXEC CICS RETURN
                TRANSID('HCAZ')
                IMMEDIATE
                END-EXEC.

       SETUP-SCREEN.
      * Determine appropriate heading
           IF EIBTRNID EQUAL INQ-TRANS
              MOVE INQ-TRANS TO HCV1TRNO
              MOVE 'Inquire Visit Information' to HCV1TITO
           ELSE
           IF EIBTRNID EQUAL ADD-TRANS
              MOVE ADD-TRANS TO HCV1TRNO
              MOVE 'Add Visit Information' to HCV1TITO
           END-IF.

       GET-PATIENT.
      * Get patient name
           Move '01IPAT'   To CA-REQUEST-ID
           Move HCV1PNOI   To CA-PATIENT-ID
           EXEC CICS LINK PROGRAM('HCP1BI01')
                     COMMAREA(COMM-AREA)
                     LENGTH(32500)
           END-EXEC

           IF CA-RETURN-CODE > 0
              GO TO NO-PATIENT-DATA
           END-IF

           Move CA-FIRST-NAME to HCV1FNAI
           Move CA-LAST-NAME  to HCV1LNAI.

       GET-THRESHOLD.
      * Get patient threshold data
           Move '01ITHR'   To CA-REQUEST-ID
           Move HCV1PNOO   To CA-PATIENT-ID
           EXEC CICS LINK PROGRAM('HCT1BI01')
                     COMMAREA(COMM-AREA)
                     LENGTH(32500)
           END-EXEC

           IF CA-RETURN-CODE = 0
              Move CA-HR-THRESHOLD to HCV1HRTHI
              Move CA-BP-THRESHOLD to HCV1BPTHI
      *       Move CA-MS-THRESHOLD to HCV1MSTHI
           END-IF.

       NO-UPD.
           Move 'Error Updating Patient visit'    To  HCV1MSGO.
           Go To ERROR-OUT.

       NO-ADD.
           Move 'Error Adding Patient visit'      To  HCV1MSGO.
           Go To ERROR-OUT.

       NO-DATA.
           Move 'No data was returned.'           To  HCV1MSGO.
           Go To ERROR-OUT.

       NO-PATIENT-DATA.
           Move 'No patient data was returned.'  To  HCV1MSGO
           Go To ERROR-OUT.

       ERROR-OUT.
           EXEC CICS SEND MAP ('HCV1MAP')
                     FROM(HCV1MAPO)
                     CURSOR
                     MAPSET ('HCMAPS')
           END-EXEC.

           Initialize HCV1MAPI.
           Initialize HCV1MAPO.
           Initialize COMM-AREA.

           GO TO ENDIT-STARTIT.
           EXIT.
