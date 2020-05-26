//HCAZBIND JOB 241901,'BIND PROGRAMS',NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H
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
// SET DB2HLQ=DSNB10
//*
//BIND    EXEC PGM=IKJEFT01,DYNAMNBR=20
//*STEPLIB  DD  DSN=&DB2HLQ..RUNLIB.LOAD,DISP=SHR
//STEPLIB  DD  DSN=&DB2HLQ..SDSNLOAD,DISP=SHR
//DBRMLIB  DD  DSN=&HLQ..ZMOBILE.DBRMLIB,DISP=SHR
//SYSPRINT DD  SYSOUT=*
//SYSTSPRT DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//SYSIN  DD *
/*
//SYSTSIN DD *
DSN SYSTEM(DBBG)
BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCIPDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCAPDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCAPDB02)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCITDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCATDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCIVDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCAVDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCIMDB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCMADB01)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PACKAGE (HCZMSA1)                                    -
     ISO(CS)                                              -
     CURRENTDATA(NO)                                      -
     MEMBER(HCMADB02)                                     -
     DEGREE(1)                                            -
     DYNAMICRULES(BIND)                                   -
     ACTION (REPLACE)                                     -
     EXPLAIN(NO)                                          -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     ENABLE(BATCH,CICS)                                   -
     REL(DEALLOCATE)                                      -
     VALIDATE(BIND)

BIND PLAN (HCZPLAN)                                       -
     PKLIST(*.HCZMSA1.*)                                  -
     CURRENTDATA(NO)                                      -
     ISO(CS)                                              -
     ACTION (REP)                                         -
     OWNER(IBMUSER)                                       -
     QUALIFIER(HCZMSA1)                                   -
     REL(DEALLOCATE)                                      -
     ACQUIRE(USE)                                         -
     RETAIN                                               -
     NOREOPT(VARS)                                        -
     VALIDATE(BIND)

RUN PROGRAM(DSNTIAD) PLAN(DSNTIA11) -
     LIB('DSNB10.DBBG.RUNLIB.LOAD')
END
/*