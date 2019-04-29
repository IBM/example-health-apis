      ******************************************************************
      * ADD Prescription Details   - changed feb 27 2017
      *  Look for %regi for fixes on abends due missing date
      *
      *  To add patient's name, address and date of birth to the       *
      *  DB2 patient table creating a new patient entry.               *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCMADB02.
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
                                        VALUE 'HCMADB02------WS'.
           03 WS-TRANSID               PIC X(4).
           03 WS-TERMID                PIC X(4).
           03 WS-TASKNUM               PIC 9(7).
           03 WS-FILLER                PIC X.
           03 WS-ADDR-DFHCOMMAREA      USAGE is POINTER.
           03 WS-CALEN                 PIC S9(4) COMP.

      *
       01  WS-RESP                   PIC S9(8) COMP.
      *----------------------------------------------------------------*
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSWS.cpy at HCMADB02.cbl line 34
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSWS.cpy at HCMADB02.cbl line 34
      *----------------------------------------------------------------*
      * Definitions required for data manipulation                     *
      *----------------------------------------------------------------*
      * Fields to be used to check that commarea is correct length
       01  WS-COMMAREA-LENGTHS.
           03 WS-CA-HEADER-LEN         PIC S9(4) COMP VALUE +18.
           03 WS-REQUIRED-CA-LEN       PIC S9(4)      VALUE +0.

      *----------------------------------------------------------------*
       01  WS-NUM-DATE-FIELDS.
             05  WS-WORKING-DATE          PIC  9(8).
             05  WS-START-NUM-DATE.
                 10  WS-START-NUM-YEAR    PIC  9(4).
                 10  WS-START-NUM-MONTH   PIC  9(2).
                 10  WS-START-NUM-DAY     PIC  9(2).
             05  WS-START-NUM-TIME.
                 10  WS-START-NUM-HOUR    PIC  9(2).
                 10  WS-START-NUM-MINUTE  PIC  9(2).
                 10  WS-START-NUM-SECOND  PIC  9(2).
                 10  WS-START-NUM-MS      PIC  9(2).
             05  WS-END-NUM-DATE.
                 10  WS-END-NUM-YEAR    PIC  9(4).
                 10  WS-END-NUM-MONTH   PIC  9(2).
                 10  WS-END-NUM-DAY     PIC  9(2).
             05  WS-END-NUM-TIME.
                 10  WS-END-NUM-HOUR    PIC  9(2).
                 10  WS-END-NUM-MINUTE  PIC  9(2).
                 10  WS-END-NUM-SECOND  PIC  9(2).
                 10  WS-END-NUM-MS      PIC  9(2).
             05  WS-INTEGER-START-DATE   PIC 9(8).
             05  WS-INTEGER-END-DATE     PIC 9(8).
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
           03 DB2-PRESCRIPTION-ID-INT  PIC S9(9) COMP.
           03 DB2-PATIENT-ID           PIC S9(9) COMP.
           03 DB2-TIMESTAMP            PIC X(19).
           03 DB2-TAKEN                PIC X.
      *----------------------------------------------------------------*

      *----------------------------------------------------------------*
      *    DB2 CONTROL
      *----------------------------------------------------------------*
      * SQLCA DB2 communications area
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\SQLCA.cpy at HCMADB02.cbl line 87
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\SQLCA.cpy at HCMADB02.cbl line 87

      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.

       01  DFHCOMMAREA.
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCMADB02.cbl line 97
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCMADB02.cbl line 97

      ******************************************************************
      *    P R O C E D U R E S
      ******************************************************************
       PROCEDURE DIVISION.

      *----------------------------------------------------------------*
       MAINLINE SECTION.
       REG-100-COMMON-CODE.
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

       REG-120-PROCESS-COMMAREA.
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

      * Process start and end dates
           MOVE CA-PATIENT-ID TO DB2-PATIENT-ID.
           MOVE CA-PRESCRIPTION-ID TO DB2-PRESCRIPTION-ID-INT.
           MOVE 'N' TO DB2-TAKEN.
       REG-150-PROCESS-DATES.

           MOVE CA-START-DATE (1:4) TO  WS-START-NUM-YEAR
           MOVE CA-START-DATE (6:2) TO  WS-START-NUM-MONTH
           MOVE CA-START-DATE (9:2) TO  WS-START-NUM-DAY

           MOVE CA-END-DATE (1:4) TO  WS-END-NUM-YEAR
           MOVE CA-END-DATE (6:2) TO  WS-END-NUM-MONTH
           MOVE CA-END-DATE (9:2) TO  WS-END-NUM-DAY

           MOVE WS-START-NUM-DATE TO  WS-WORKING-DATE
      * %regi ======================================================
      * added to fix abend #1 START DATE
      *     IF WS-WORKING-DATE < 16010101 or
      *        WS-WORKING-DATE > 99991231
      *        MOVE FUNCTION CURRENT-DATE (1:8) TO WS-WORKING-DATE
      *        END-IF
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++

           COMPUTE WS-INTEGER-START-DATE =
                   FUNCTION INTEGER-OF-DATE (WS-WORKING-DATE)

           MOVE WS-END-NUM-DATE TO  WS-WORKING-DATE
      * %regi ======================================================
      * added to fix abend #2 END DATE
      *     IF WS-WORKING-DATE < 16010101 or
      *        WS-WORKING-DATE > 99991231
      *        MOVE FUNCTION CURRENT-DATE (1:8) TO WS-WORKING-DATE
      *        COMPUTE WS-WORKING-DATE = WS-WORKING-DATE + 1
      *        END-IF
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++

           COMPUTE WS-INTEGER-END-DATE =
                   FUNCTION INTEGER-OF-DATE (WS-WORKING-DATE)

           PERFORM UNTIL WS-INTEGER-START-DATE > WS-INTEGER-END-DATE
               COMPUTE WS-WORKING-DATE =
                       FUNCTION DATE-OF-INTEGER (WS-INTEGER-START-DATE)
               MOVE WS-WORKING-DATE TO WS-START-NUM-DATE
               EVALUATE CA-FREQUENCY
                  WHEN 1
                    MOVE 12000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                  WHEN 2
                    MOVE 08000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                    MOVE 20000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                  WHEN 3
                    MOVE 08000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                    MOVE 14000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                    MOVE 20000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                  WHEN 4
                    MOVE 08000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                    MOVE 12000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                    MOVE 16000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
                    MOVE 20000000 TO WS-START-NUM-TIME
                    PERFORM INSERT-PRESCRIPTION
               END-EVALUATE

               ADD 1 TO WS-INTEGER-START-DATE
           END-PERFORM.

      *
      *    Return to caller
           EXEC CICS RETURN END-EXEC.

       MAINLINE-EXIT.
           EXIT.
      *----------------------------------------------------------------*
       FORMAT-TIMESTAMP.
           MOVE WS-START-NUM-YEAR   TO DB2-TIMESTAMP(1:4)
           MOVE '-'                 TO DB2-TIMESTAMP(5:1)
           MOVE WS-START-NUM-MONTH  TO DB2-TIMESTAMP(6:2)
           MOVE '-'                 TO DB2-TIMESTAMP(8:1)
           MOVE WS-START-NUM-DAY    TO DB2-TIMESTAMP(9:2)
           MOVE SPACE               TO DB2-TIMESTAMP (11:1)
           MOVE WS-START-NUM-HOUR   TO DB2-TIMESTAMP(12:2)
           MOVE ':'                 TO DB2-TIMESTAMP(14:1)
           MOVE WS-START-NUM-MINUTE TO DB2-TIMESTAMP(15:2)
           MOVE ':'                 TO DB2-TIMESTAMP(17:1)
           MOVE WS-START-NUM-SECOND TO DB2-TIMESTAMP(18:2)
      *    MOVE '.'                 TO DB2-TIMESTAMP(20:1)
      *    MOVE WS-START-NUM-MS     TO DB2-TIMESTAMP(21:2)
      *    MOVE 0                   TO DB2-TIMESTAMP(22:1).

           EXIT.
      *================================================================*
       INSERT-PRESCRIPTION.
      *================================================================*
      * Insert row into Prescription table based on patient number     *
      *================================================================*
           MOVE ' INSERT PRESCRIPTION' TO EM-SQLREQ
      *================================================================*
           PERFORM FORMAT-TIMESTAMP

             EXEC SQL
               INSERT INTO PRESCRIPTION
                         ( PRESCRIPTIONID,
                           PATIENTID,
                           PDATETIME,
                           TAKEN )
                  VALUES ( :DB2-PRESCRIPTION-ID-INT,
                           :DB2-PATIENT-ID,
                           :DB2-TIMESTAMP,
                           :DB2-TAKEN )
             END-EXEC
      *       DISPLAY 'SQLCODE='
      *       DISPLAY SQLCODE

             IF SQLCODE NOT EQUAL 0
               MOVE '90' TO CA-RETURN-CODE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS RETURN END-EXEC
             END-IF.
           EXIT.
      *================================================================*

      *----------------------------------------------------------------*
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSPD.cpy at HCMADB02.cbl line 278
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSPD.cpy at HCMADB02.cbl line 278
