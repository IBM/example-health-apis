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
      *                    Inquire Medications                         *
      *                                                                *
      * Select medication details from DB2 table                       *
      *                                                                *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCIMDB01.
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
                                        VALUE 'HCIMDB01------WS'.
           03 WS-TRANSID               PIC X(4).
           03 WS-TERMID                PIC X(4).
           03 WS-TASKNUM               PIC 9(7).
           03 WS-FILLER                PIC X.
           03 WS-ADDR-DFHCOMMAREA      USAGE is POINTER.
           03 WS-CALEN                 PIC S9(4) COMP.

      *----------------------------------------------------------------*
      * Fields to be used to calculate if commarea is large enough
       01  WS-COMMAREA-LENGTHS.
           03 WS-CA-HEADERTRAILER-LEN  PIC S9(4) COMP VALUE +18.
           03 WS-REQUIRED-CA-LEN       PIC S9(4)      VALUE +0.
           03 WS-COUNTER               PIC S9(4)      VALUE +0.

      *----------------------------------------------------------------*
      * Definitions required by SQL statement                          *
      *   DB2 datatypes to COBOL equivalents                           *
      *     SMALLINT    :   PIC S9(4) COMP                             *
      *     INTEGER     :   PIC S9(9) COMP                             *
      *     DATE        :   PIC X(10)                                  *
      *     TIMESTAMP   :   PIC X(26)                                  *
      *----------------------------------------------------------------*
      * Host variables for input to DB2 integer types
      *01  DB2-IN-INTEGERS.
      *    03 DB2-CUSTOMERNUMBER-INT   PIC S9(9) COMP.
       01  DB2-IN.
           03 DB2-MEDICATION-ID     PIC S9(9) COMP.
           03 DB2-PATIENT-ID        PIC X(10).
           03 DB2-DRUG-NAME         PIC X(50).
           03 DB2-STRENGTH          PIC X(20).
           03 DB2-AMOUNT            PIC S9(4) COMP.
           03 DB2-ROUTE             PIC X(20).
           03 DB2-FREQUENCY         PIC X(20).
           03 DB2-IDENTIFIER        PIC X(20).
           03 DB2-BIOMED-TYPE       PIC X(2).

      *----------------------------------------------------------------*
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSWS.cpy at HCIMDB01.cbl line 73
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSWS.cpy at HCIMDB01.cbl line 73
      *----------------------------------------------------------------*
      *    DB2 CONTROL
      *----------------------------------------------------------------*
      * SQLCA DB2 communications area
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\SQLCA.cpy at HCIMDB01.cbl line 79
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\SQLCA.cpy at HCIMDB01.cbl line 79
      *
      *
      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.

       01  DFHCOMMAREA.
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMARE2.cpy at HCIMDB01.cbl line 90
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
      *   This commarea can be used for Inq Medications                *
      *                                                                *
      *                                                                *
      *                                                                *
      ******************************************************************
           03 CA-REQUEST-ID            PIC X(6).
           03 CA-RETURN-CODE           PIC 9(2).
           03 CA-PATIENT-ID            PIC 9(10).
      *    Fields used in Inquire Medications
           03 CA-LIST-MEDICATION-REQUEST.
              05 CA-NUM-MEDICATIONS    PIC 99 COMP-3.
              05 CA-MEDICATIONS OCCURS 0 to 50 times
                 depending on CA-NUM-MEDICATIONS.
                 10 CA-MEDICATION-ID      PIC 9(10).
                 10 CA-DRUG-NAME          PIC X(50).
                 10 CA-STRENGTH           PIC X(20).
                 10 CA-AMOUNT             PIC 9(03).
                 10 CA-ROUTE              PIC X(20).
                 10 CA-FREQUENCY          PIC X(20).
                 10 CA-IDENTIFIER         PIC X(20).
                 10 CA-TYPE               PIC X(2).
.
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMARE2.cpy at HCIMDB01.cbl line 90

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

      *----------------------------------------------------------------*
      * Check commarea and obtain required details                     *
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

      * initialize DB2 host variables
      *    INITIALIZE DB2-IN-INTEGERS.

      *----------------------------------------------------------------*
      * Process incoming commarea                                      *
      *----------------------------------------------------------------*
      * check commarea length - meets minimum requirement
      *     MOVE WS-CUSTOMER-LEN        TO WS-REQUIRED-CA-LEN
           ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
      * if less set error return code and return to caller
           IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
             MOVE '98' TO CA-RETURN-CODE
             EXEC CICS RETURN END-EXEC
           END-IF

      * Convert commarea patient number to DB2 integer format
      *    MOVE CA-CUSTOMER-NUM TO DB2-CUSTOMERNUMBER-INT
           MOVE CA-PATIENT-ID TO DB2-PATIENT-ID
      * and save in error msg field incase required
           MOVE CA-PATIENT-ID TO EM-PATNUM

      *----------------------------------------------------------------*
      * Obtain details from DB2                                        *
      *----------------------------------------------------------------*
      *    Call routine to issue SQL to obtain info from DB2
           EXEC SQL
               DECLARE c CURSOR FOR
               SELECT MEDICATIONID,
                      DRUGNAME,
                      STRENGTH,
                      AMOUNT,
                      ROUTE,
                      FREQUENCY,
                      IDENTIFIER,
                      TYPE
               FROM MEDICATION
               WHERE PATIENTID = :DB2-PATIENT-ID
           END-EXEC

           PERFORM OPEN-CURSOR.
           PERFORM GET-MEDICATION-INFO
             UNTIL SQLCODE NOT EQUAL 0
                OR ws-counter EQUAL 50.
           EXEC SQL CLOSE c END-EXEC.
      *----------------------------------------------------------------*
      * END PROGRAM and return to caller                               *
      *----------------------------------------------------------------*
       MAINLINE-END.

           EXEC CICS RETURN END-EXEC.

       MAINLINE-EXIT.
           EXIT.
      *----------------------------------------------------------------*
       OPEN-CURSOR.
            EXEC SQL OPEN c END-EXEC.

            EXEC SQL
                 FETCH c
                 INTO :DB2-MEDICATION-ID,
                      :DB2-DRUG-NAME,
                      :DB2-STRENGTH,
                      :DB2-AMOUNT,
                      :DB2-ROUTE,
                      :DB2-FREQUENCY,
                      :DB2-IDENTIFIER,
                      :DB2-BIOMED-TYPE
            END-EXEC.

           Evaluate SQLCODE
             When 0
               MOVE '00' TO CA-RETURN-CODE
               PERFORM LOAD-COMMAREA
             When 100
               MOVE '01' TO CA-RETURN-CODE
             When -913
               MOVE '01' TO CA-RETURN-CODE
             When Other
               MOVE '90' TO CA-RETURN-CODE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS RETURN END-EXEC
           END-Evaluate.
           EXIT.

       GET-MEDICATION-INFO.

            EXEC SQL
                FETCH c
                INTO :DB2-MEDICATION-ID,
                      :DB2-DRUG-NAME,
                      :DB2-STRENGTH,
                      :DB2-AMOUNT,
                      :DB2-ROUTE,
                      :DB2-FREQUENCY,
                      :DB2-IDENTIFIER,
                      :DB2-BIOMED-TYPE
           END-EXEC.

           Evaluate SQLCODE
             When 0
               MOVE '00' TO CA-RETURN-CODE
               PERFORM LOAD-COMMAREA
             When 100
               IF ws-counter > 0
                  MOVE '00' TO CA-RETURN-CODE
               ELSE
                  MOVE '01' TO CA-RETURN-CODE
               END-IF
             When -913
               MOVE '01' TO CA-RETURN-CODE
             When Other
               MOVE '90' TO CA-RETURN-CODE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS RETURN END-EXEC
           END-Evaluate.

           EXIT.

       LOAD-COMMAREA.
           ADD 1 to ws-counter.
           MOVE DB2-MEDICATION-ID, TO CA-MEDICATION-ID
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-DRUG-NAME      TO CA-DRUG-NAME
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-STRENGTH       TO CA-STRENGTH
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-AMOUNT         TO CA-AMOUNT
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-ROUTE          TO CA-ROUTE
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-FREQUENCY      TO CA-FREQUENCY
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-IDENTIFIER     TO CA-IDENTIFIER
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE DB2-BIOMED-TYPE    TO CA-TYPE
                                   OF CA-MEDICATIONS (ws-counter)
           MOVE ws-counter to CA-NUM-MEDICATIONS.
           EXIT.

      *----------------------------------------------------------------*
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSPD.cpy at HCIMDB01.cbl line 267
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCERRSPD.cpy at HCIMDB01.cbl line 267
