      ******************************************************************
      *                                                                *
      * LICENSED MATERIALS - PROPERTY OF IBM                           *
      *                                                                *
      * "RESTRICTED MATERIALS OF IBM"                                  *
      *                                                                *
      * (C) COPYRIGHT IBM CORP. 2014 ALL RIGHTS RESERVED               *
      *                                                                *
      * US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,      *
      * OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE                   *
      * CONTRACT WITH IBM CORPORATION                                  *
      *                                                                *
      *                                                                *
      *                    ADD Visit Details                           *
      *                                                                *
      *   To add patient's visit details to bloodpressure and the      *
      *  heartrate DB2 tables.                                         *
      *                                                                *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCAVDB01.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.

       WORKING-STORAGE SECTION.

      *----------------------------------------------------------------*
      * Common defintions                                              *
      *----------------------------------------------------------------*
      * Run time (debug) infomation for this invocation
        01  WS-HEADER.
           03 WS-EYECATCHER            PIC X(16)
                                        VALUE 'HCAPDB01------WS'.
           03 WS-TRANSID               PIC X(4).
           03 WS-TERMID                PIC X(4).
           03 WS-TASKNUM               PIC 9(7).
           03 WS-FILLER                PIC X.
           03 WS-ADDR-DFHCOMMAREA      USAGE is POINTER.
           03 WS-CALEN                 PIC S9(4) COMP.

      *
       01  WS-RESP                   PIC S9(8) COMP.

      *----------------------------------------------------------------*
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSWS.cpy at HCAVDB01.cbl line 48
      * Error handler
       01 HCAZERRS           PIC x(8) Value 'HCAZERRS'.

      * Variables for time/date processing
       01  WS-ABSTIME                  PIC S9(8) COMP VALUE +0.
       01  WS-TIME                     PIC X(8)  VALUE SPACES.
       01  WS-DATE                     PIC X(10) VALUE SPACES.

      * Error Message structure
       01  ERROR-MSG.
           03 EM-DATE                  PIC X(8)  VALUE SPACES.
           03 FILLER                   PIC X     VALUE SPACES.
           03 EM-TIME                  PIC X(6)  VALUE SPACES.
           03 FILLER                   PIC X(9)  VALUE ' HCP1BI01'.
           03 EM-VARIABLE.
             05 FILLER                 PIC X(6)  VALUE ' PNUM='.
             05 EM-PATNUM              PIC X(10)  VALUE SPACES.
             05 FILLER                 PIC X(6)  VALUE ' MNUM='.
             05 EM-MEDNUM              PIC X(10)  VALUE SPACES.
             05 EM-SQLREQ              PIC X(16) VALUE SPACES.
             05 FILLER                 PIC X(9)  VALUE ' SQLCODE='.
             05 EM-SQLRC               PIC +9(5) USAGE DISPLAY.

       01 CA-ERROR-MSG.
           03 FILLER                PIC X(9)  VALUE 'COMMAREA='.
           03 CA-DATA               PIC X(90) VALUE SPACES.
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSWS.cpy at HCAVDB01.cbl line 48

      *----------------------------------------------------------------*
      * Definitions required for data manipulation                     *
      *----------------------------------------------------------------*
      * Fields to be used to check that commarea is correct length
       01  WS-COMMAREA-LENGTHS.
           03 WS-CA-HEADER-LEN         PIC S9(4) COMP VALUE +18.
           03 WS-REQUIRED-CA-LEN       PIC S9(4)      VALUE +0.

      *----------------------------------------------------------------*
      * Definitions required by SQL statement                          *
      *   DB2 datatypes to COBOL equivalents                           *
      *     SMALLINT    :   PIC S9(4) COMP                             *
      *     INTEGER     :   PIC S9(9) COMP                             *
      *     DATE        :   PIC X(10)                                  *
      *     TIMESTAMP   :   PIC X(26)                                  *
      *----------------------------------------------------------------*
      * Host variables for output from DB2 integer types
       01  DB2-OUT.
           03 DB2-PATIENT-ID        PIC S9(9) COMP.
           03 DB2-TIMESTAMP         PIC X(26).
      *----------------------------------------------------------------*

      *----------------------------------------------------------------*
      *    DB2 CONTROL
      *----------------------------------------------------------------*
      * SQLCA DB2 communications area
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\SQLCA.cpy at HCAVDB01.cbl line 77
       01  SQLCA.                                                       00010000
           05  SQLCAID         PIC X(8).                                00020000
           05  SQLCABC         PIC S9(9) COMP.                          00030000
           05  SQLCODE         PIC S9(9) COMP.                          00040000
           05  SQLERRM.                                                 00050000
               49  SQLERRML        PIC S9(4) COMP.                      00060000
               49  SQLERRMC        PIC X(70).                           00070000
           05  SQLERRP         PIC X(8).                                00080000
           05  SQLERRD         OCCURS 6 TIMES PIC S9(9) COMP.           00090000
           05  SQLWARN.                                                 00100000
               10  SQLWARN0    PIC X(1).                                00110000
               10  SQLWARN1    PIC X(1).                                00120000
               10  SQLWARN2    PIC X(1).                                00130000
               10  SQLWARN3    PIC X(1).                                00140000
               10  SQLWARN4    PIC X(1).                                00150000
               10  SQLWARN5    PIC X(1).                                00160000
               10  SQLWARN6    PIC X(1).                                00170000
               10  SQLWARN7    PIC X(1).                                00180000
           05  SQLEXT.                                                  00190000
               10 SQLWARN8     PIC X(1).                                00200000
               10 SQLWARN9     PIC X(1).                                00210000
               10 SQLWARNA     PIC X(1).                                00220000
               10 SQLSTATE     PIC X(5).                                00230000
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\SQLCA.cpy at HCAVDB01.cbl line 77

      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.

       01  DFHCOMMAREA.
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCAVDB01.cbl line 87
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCAVDB01.cbl line 87

      ******************************************************************
      *    P R O C E D U R E S
      ******************************************************************
       PROCEDURE DIVISION.

      *----------------------------------------------------------------*
       MAINLINE SECTION.

      *----------------------------------------------------------------*
      * Common code                                                    *
      *----------------------------------------------------------------*
      * initialize working storage variables
           INITIALIZE WS-HEADER.
      * set up general variable
           MOVE EIBTRNID TO WS-TRANSID.
           MOVE EIBTRMID TO WS-TERMID.
           MOVE EIBTASKN TO WS-TASKNUM.
      *----------------------------------------------------------------*


      * initialize DB2 host variables
           INITIALIZE DB2-OUT.

      *----------------------------------------------------------------*
      * Process incoming commarea                                      *
      *----------------------------------------------------------------*
      * If NO commarea received issue an ABEND
           IF EIBCALEN IS EQUAL TO ZERO
               MOVE ' NO COMMAREA RECEIVED' TO EM-VARIABLE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS ABEND ABCODE('HCCA') NODUMP END-EXEC
           END-IF

      * initialize commarea return code to zero
           MOVE '00' TO CA-RETURN-CODE
           MOVE EIBCALEN TO WS-CALEN.
           SET WS-ADDR-DFHCOMMAREA TO ADDRESS OF DFHCOMMAREA.

      * check commarea length
           ADD WS-CA-HEADER-LEN TO WS-REQUIRED-CA-LEN
      *    ADD WS-CUSTOMER-LEN  TO WS-REQUIRED-CA-LEN

      * if less set error return code and return to caller
           IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
             MOVE '98' TO CA-RETURN-CODE
             EXEC CICS RETURN END-EXEC
           END-IF

      * Call routine to Insert row in Patient table                   *
           MOVE CA-PATIENT-ID TO DB2-PATIENT-ID.
           MOVE CA-VISIT-DATE   TO DB2-TIMESTAMP(1:10)
           MOVE SPACE           TO DB2-TIMESTAMP (11:1)
           MOVE CA-VISIT-TIME   TO DB2-TIMESTAMP(12:10)

           PERFORM INSERT-BLOODPRESSURE.
           PERFORM INSERT-HEARTRATE.

      *    Return to caller
           EXEC CICS RETURN END-EXEC.

       MAINLINE-EXIT.
           EXIT.
      *----------------------------------------------------------------*

      *================================================================*
       INSERT-BLOODPRESSURE.
      *================================================================*
      * Insert row into Bloodpressure table based on patient number  *
      *================================================================*
           MOVE ' INSERT BLOODPRESSURE' TO EM-SQLREQ
             EXEC SQL
               INSERT INTO BLOODPRESSURE
                         ( PATIENTID,
                           BPDATETIME,
                           BLOODPRESSURE )
                  VALUES ( :DB2-PATIENT-ID,
                           :DB2-TIMESTAMP,
                           :CA-BLOOD-PRESSURE )
             END-EXEC

             IF SQLCODE NOT EQUAL 0
               MOVE '90' TO CA-RETURN-CODE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS RETURN END-EXEC
             END-IF

           MOVE DB2-PATIENT-ID TO CA-PATIENT-ID.

           EXIT.

      *================================================================*
       INSERT-HEARTRATE.
      *================================================================*
      * Insert row into Heartrate table based on patient number  *
      *================================================================*
           MOVE ' INSERT HEARTRATE' TO EM-SQLREQ
             EXEC SQL
               INSERT INTO HEARTRATE
                         ( PATIENTID,
                           HRDATETIME,
                           HEARTRATE )
                  VALUES ( :DB2-PATIENT-ID,
                           :DB2-TIMESTAMP,
                           :CA-HEART-RATE )
             END-EXEC

             IF SQLCODE NOT EQUAL 0
               MOVE '90' TO CA-RETURN-CODE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS RETURN END-EXEC
             END-IF

           MOVE DB2-PATIENT-ID TO CA-PATIENT-ID.

           EXIT.

      *----------------------------------------------------------------*
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSPD.cpy at HCAVDB01.cbl line 207
      *================================================================*
      * Procedure to write error message to Queues                     *
      *   message will include Date, Time, Program Name, Patient Id,   *
      *   Medication Id and SQLCODE.                                   *
      *================================================================*
       WRITE-ERROR-MESSAGE.
      * Obtain and format current time and date
           EXEC CICS ASKTIME ABSTIME(WS-ABSTIME)
           END-EXEC
           EXEC CICS FORMATTIME ABSTIME(WS-ABSTIME)
                     MMDDYYYY(WS-DATE)
                     TIME(WS-TIME)
           END-EXEC
           MOVE WS-DATE TO EM-DATE
           MOVE WS-TIME TO EM-TIME
      * Write output message to TDQ
           EXEC CICS LINK PROGRAM(HCAZERRS)
                     COMMAREA(ERROR-MSG)
                     LENGTH(LENGTH OF ERROR-MSG)
           END-EXEC.
      * Write 90 bytes or as much as we have of commarea to TDQ
           IF EIBCALEN > 0 THEN
             IF EIBCALEN < 91 THEN
               MOVE DFHCOMMAREA(1:EIBCALEN) TO CA-DATA
               EXEC CICS LINK PROGRAM(HCAZERRS)
                         COMMAREA(CA-ERROR-MSG)
                         LENGTH(LENGTH OF CA-ERROR-MSG)
               END-EXEC
             ELSE
               MOVE DFHCOMMAREA(1:90) TO CA-DATA
               EXEC CICS LINK PROGRAM(HCAZERRS)
                         COMMAREA(CA-ERROR-MSG)
                         LENGTH(LENGTH OF CA-ERROR-MSG)
               END-EXEC
             END-IF
           END-IF.
           EXIT.
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSPD.cpy at HCAVDB01.cbl line 207
