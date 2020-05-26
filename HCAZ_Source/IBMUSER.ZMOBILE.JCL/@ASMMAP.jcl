//HCZMMAP JOB 241901,'MAPGEN',NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H
//****************************************************************************
//* Copyright 2019 IBM Corp. All Rights Reserved.
//*
//*  Licensed under the Apache License, Version 2.0 (the "License");
//*  you may not use this file except in compliance with the License.
//*  You may obtain a copy of the License at
//*
//*       http://www.apache.org/licenses/LICENSE-2.0
//*
//*   Unless required by applicable law or agreed to in writing, software
//*   distributed under the License is distributed on an "AS IS" BASIS,
//*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//*   See the License for the specific language governing permissions and
//*   limitations under the License.
//****************************************************************************
// SET HLQ=IBMUSER
// SET CICSHLQ=DFH520.CICS
// SET LINKHLQ=DFH520.CICSA
//*-------------------------------------------------------------------*
//*  COPY MAP TO A TEMPORARY DATASET                                  *
//*-------------------------------------------------------------------*
//COPY     EXEC PGM=IEBGENER
//*
//SYSPRINT DD DUMMY
//SYSIN    DD DUMMY
//SYSUT1   DD DISP=SHR,DSN=&HLQ..ZMOBILE.BMS(HCMAPS)
//SYSUT2   DD DISP=(,PASS),DSN=&&TEMPM,
//            DCB=(LRECL=80,BLKSIZE=3120,RECFM=FB),
//            UNIT=SYSDA,SPACE=(CYL,(1,1))
//*-------------------------------------------------------------------*
//*  INVOKE THE IBM MVS HIGH LEVEL ASSEMBLER                          *
//*  TO CREATE THE EXECUTABLE OBJECT MODULE OF THE MAP (SYSPARM(MAP)) *
//*-------------------------------------------------------------------*
//ASMMAP   EXEC PGM=ASMA90,
// PARM='SYSPARM(MAP),DECK,NOOBJECT'
//*
//SYSPRINT DD SYSOUT=*
//SYSLIB   DD DISP=SHR,DSN=&CICSHLQ..SDFHMAC
//         DD DISP=SHR,DSN=&HLQ..ZMOBILE.BMS
//         DD DISP=SHR,DSN=SYS1.MODGEN
//         DD DISP=SHR,DSN=SYS1.MACLIB
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(10,10))
//SYSUT2   DD UNIT=SYSDA,SPACE=(CYL,(10,10))
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(10,10))
//SYSPUNCH DD DISP=(,PASS),DSN=&&MAP,
//            UNIT=SYSDA,DCB=BLKSIZE=3120,
//            SPACE=(CYL,(1,1))
//SYSIN    DD DISP=(OLD,PASS),DSN=&&TEMPM
//*-------------------------------------------------------------------*
//*  INVOKE THE MVS LINKAGE-EDITOR PROGRAM                            *
//*-------------------------------------------------------------------*
//LINKMAP  EXEC PGM=IEWL,COND=(7,LT,ASMMAP),
// PARM='LIST,LET,XREF'
//*
//SYSPRINT DD SYSOUT=*
//SYSLMOD  DD DISP=SHR,DSN=&LINKHLQ..LOAD(HCMAPS)
//SYSUT1   DD UNIT=SYSDA,DCB=BLKSIZE=1024,
//            SPACE=(CYL,(1,1))
//SYSLIN   DD DISP=(OLD,DELETE),DSN=&&MAP
//*-------------------------------------------------------------------*
//*  INVOKE THE IBM MVS HIGH LEVEL ASSEMBLER                          *
//*  TO CREATE THE ASSEMBLER DSECT OF THE MAP (SYSPARM(DSECT))        *
//*  REQUIRED, AT ASSEMBLY TIME, BY PROGRAMS THAT USE THE MAP         *
//*-------------------------------------------------------------------*
//ASMDSECT EXEC PGM=ASMA90,
// PARM='SYSPARM(DSECT),DECK,NOOBJECT'
//*
//SYSPRINT DD SYSOUT=*
//SYSLIB   DD DISP=SHR,DSN=&CICSHLQ..SDFHMAC
//         DD DISP=SHR,DSN=&HLQ..ZMOBILE.BMS
//         DD DISP=SHR,DSN=SYS1.MODGEN
//         DD DISP=SHR,DSN=SYS1.MACLIB
//SYSUT1   DD UNIT=SYSDA,SPACE=(CYL,(10,10))
//SYSUT2   DD UNIT=SYSDA,SPACE=(CYL,(10,10))
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(10,10))
//SYSPUNCH DD DISP=SHR,DSN=&HLQ..ZMOBILE.COPYLIB(HCMAPS)
//SYSIN    DD DISP=(OLD,DELETE),DSN=&&TEMPM