//HCZACSD JOB 241901,'CSD GENERATE',NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H
//*
//* LICENSED MATERIALS - PROPERTY OF IBM
//*
//* "RESTRICTED MATERIALS OF IBM"
//*
//* (C) COPYRIGHT IBM CORP. 2014 ALL RIGHTS RESERVED
//*
//*  US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,
//*  OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE
//*  CONTRACT WITH IBM CORPORATION
//*
//*****
// SET HLQ=IBMUSER
// SET CICSHLQ=DFH520.CICS
//***** CSD definitions for zMobile Health Care App
//*****
//CSDDEFS  EXEC PGM=DFHCSDUP,REGION=1M
//STEPLIB  DD DISP=SHR,DSN=DFH520.CICS.SDFHLOAD
//DFHCSD   DD DSN=DFH520.CICS.CICSA.DFHCSD,DISP=SHR
//SYSUT1   DD UNIT=SYSDA,SPACE=(1024,(100,100))
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
**********************************************************
Remove Group(HCAZMOBL)  List(HCAZLIST)
Delete Group(HCAZMOBL)  All
*
Add    Group(HCAZMOBL)   List(HCAZLIST)
*******

***** Transactions
Define Transaction(HCAZ) Group(HCAZMOBL)
       Program(HCAZMENU) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCPA) Group(HCAZMOBL)
       Program(HCP1PL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCP1) Group(HCAZMOBL)
       Program(HCP1PL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCMA) Group(HCAZMOBL)
       Program(HCMAPL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCM1) Group(HCAZMOBL)
       Program(HCM1PL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCVA) Group(HCAZMOBL)
       Program(HCV1PL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCV1) Group(HCAZMOBL)
       Program(HCV1PL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCTA) Group(HCAZMOBL)
       Program(HCT1PL01) TaskDataLoc(Any)   TaskDataKey(User)
Define Transaction(HCT1) Group(HCAZMOBL)
       Program(HCT1PL01) TaskDataLoc(Any)   TaskDataKey(User)

***** Copy of CPIH, default HTTP Inbound Router Transaction
Define Transaction(HCJW) Group(HCAZMOBL)
       Program(DFHPIDSH) TaskDataLoc(Any)   Spurge(YES)

***** Programs
Define Program(HCMAPS)    Group(HCAZMOBL)
       Description(BMS Map)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCAZMENU) Group(HCAZMOBL)
       Description(Main menu)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCP1PL01) Group(HCAZMOBL)
       Description(Patient Presentation Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCP1BA01) Group(HCAZMOBL)
       Description(Add Patient Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCP1BI01) Group(HCAZMOBL)
       Description(Inq Patient Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCPRESTW) Group(HCAZMOBL)
       Description(Patient REST Wrapper)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCAPDB01) Group(HCAZMOBL)
       Description(DB2 Add Patient)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCAPDB02) Group(HCAZMOBL)
       Description(DB2 Add User)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCIPDB01) Group(HCAZMOBL)
       Description(DB2 Inq Patient)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCM1PL01) Group(HCAZMOBL)
       Description(Inq Medication Presentation Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCM1BI01) Group(HCAZMOBL)
       Description(Inq Medication Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCMRESTW) Group(HCAZMOBL)
       Description(Medication REST Wrapper)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCIMDB01) Group(HCAZMOBL)
       Description(DB2 Inq Medication)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCMAPL01) Group(HCAZMOBL)
       Description(Add Medication Presentation Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCMABA01) Group(HCAZMOBL)
       Description(Add Medication Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCMADB01) Group(HCAZMOBL)
       Description(DB2 Add Medication)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCMADB02) Group(HCAZMOBL)
       Description(DB2 Add Prescription)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCV1PL01) Group(HCAZMOBL)
       Description(Visit Presentation Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCV1BA01) Group(HCAZMOBL)
       Description(Add Visit Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCV1BI01) Group(HCAZMOBL)
       Description(Inq Visit Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCAVDB01) Group(HCAZMOBL)
       Description(DB2 Add Visit)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCIVDB01) Group(HCAZMOBL)
       Description(DB2 Inq Visit)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCT1PL01) Group(HCAZMOBL)
       Description(Threshold Presentation Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCT1BA01) Group(HCAZMOBL)
       Description(Add Threshold Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCT1BI01) Group(HCAZMOBL)
       Description(Inq Threshold Business Logic)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCTRESTW) Group(HCAZMOBL)
       Description(Threshold REST Wrapper)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCATDB01) Group(HCAZMOBL)
       Description(DB2 Add Threshold)
       Language(Cobol)   DataLocation(Any)   Execkey(User)
Define Program(HCITDB01) Group(HCAZMOBL)
       Description(DB2 Inq Threshold)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

Define Program(HCAZERRS) Group(HCAZMOBL)
       Description(Error Message output to TSQueue)
       Language(Cobol)   DataLocation(Any)   Execkey(User)

***** Pipeline
Define Pipeline(HCAZMOBL) Group(HCAZMOBL)
       Description(Json Pipeline for the HC ZMOBILE Application)
       Configfile(/u/zmobile/pipeline/zmobilejsonprovider.xml)
       Shelf(/var/cicsts)
       WSDir(/u/zmobile/webservices/wsbind)

***** TCPIP Service
Define TCPIPService(HCAZMOBL) Group(HCAZMOBL)
       Description(Tcpip Service for the HC ZMOBILE Application)
       Portnumber(6484)  URM(DFHWBAAX)       Protocol(HTTP)
       Transaction(CWXN) Backlog(1)

***** JVM Server
Define JVMServer(HCAZJVM) Group(HCAZMOBL)
       Description(CICS jvmserver to run the HC ZMOBILE Application)
       Jvmprofile(DFHJVMAX)