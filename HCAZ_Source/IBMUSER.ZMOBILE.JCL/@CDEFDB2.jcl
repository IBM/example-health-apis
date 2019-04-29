//HCZACSD JOB 241901,'CSD GENERATE',NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H
//*****
// SET HLQ=IBMUSER
// SET CICSHLQ=DFH520.CICS
//***** CSD definitions for zMobile Health Care App
//*****
//CSDDEFS  EXEC PGM=DFHCSDUP,REGION=1M
//STEPLIB  DD DISP=SHR,DSN=&CICSHLQ..SDFHLOAD
//DFHCSD   DD DSN=DFH520.CICS.CICSA.DFHCSD,DISP=SHR
//SYSUT1   DD UNIT=SYSDA,SPACE=(1024,(100,100))
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
**********************************************************

***** DB2 Attachment
Define DB2Conn(DSNZ)     Group(HCAZMOBL)  DB2ID(DBBG)
       NONtermrel(No)    ResyncMember(No)
       MSGqueue1(CSMT)   StatsQueue(CSMT)
       TCBlimit(400)     ThreadError(Abend)
       AccountRec(Txid)  AuthType(Userid)
       Drollback(Yes)    ThreadLimit(250)

***** DB2 Entry supports 3270 transactions and JSON services
Define DB2Entry(DBBGJSN) Group(HCAZMOBL)      Transid(HC*)
       Authid(IBMUSER)     AccountRec(Txid)
       Plan(HCZPLAN)     ThreadLimit(250)