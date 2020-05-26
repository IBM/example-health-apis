//HCZMDB2 JOB 241901,'DB2 DELETE',NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H
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
//JOBLIB   DD DSN=DSNB10.SDSNLOAD,DISP=SHR
//*
//********************************************************************
//*   CREATE STORAGE GROUP/DATABASES/TABLESPACES                     *
//********************************************************************
//DELETE  EXEC PGM=IKJEFT01,DYNAMNBR=20
//SYSTSPRT DD SYSOUT=*
//SYSTSIN  DD *
   DSN SYSTEM(DBBG)
   RUN  PROGRAM(DSNTIAD) PLAN(DSNTIA11) -
        LIB('DSNB10.DBBG.RUNLIB.LOAD')
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
    DROP     TABLE      HCZMSA1.patient;
    DROP     TABLE      HCZMSA1.user;
    DROP     TABLE      HCZMSA1.medication;
    DROP     TABLE      HCZMSA1.meditation;
    DROP     TABLE      HCZMSA1.prescription;
    DROP     TABLE      HCZMSA1.threshold;
    DROP     TABLE      HCZMSA1.heartrate;
    DROP     TABLE      HCZMSA1.bloodpressure;
    DROP     TABLE      HCZMSA1.session;
    DROP     TABLESPACE HCZMSA1.HCZMTS01;
    DROP     TABLESPACE HCZMSA1.HCZMTS02;
    DROP     TABLESPACE HCZMSA1.HCZMTS03;
    DROP     TABLESPACE HCZMSA1.HCZMTS04;
    DROP     TABLESPACE HCZMSA1.HCZMTS05;
    DROP     TABLESPACE HCZMSA1.HCZMTS06;
    DROP     TABLESPACE HCZMSA1.HCZMTS07;
    DROP     TABLESPACE HCZMSA1.HCZMTS08;
    commit;
    DROP     DATABASE   HCZMSA1;
    commit;
    DROP     STOGROUP   HCZMSG02;
/*