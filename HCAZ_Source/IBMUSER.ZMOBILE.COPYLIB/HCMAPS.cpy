      ******************************************************************
      * Copyright 2011,2014 IBM Corp. All Rights Reserved.
      *
      * Licensed under the Apache License, Version 2.0 (the "License");
      * you may not use this file except in compliance with the License.
      * You may obtain a copy of the License at
      * http://www.apache.org/licenses/LICENSE-2.0
      *
      * Unless required by applicable law or agreed to in writing,
      * software distributed under the License is distributed on an
      * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
      * either express or implied.
      * See the License for the specific language governing permissions
      * and limitations under the License.
      ******************************************************************
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