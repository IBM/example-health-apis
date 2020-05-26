      ******************************************************************
      * Copyright 2017 IBM Corp. All Rights Reserved.
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
       COPY HCERRSWS.
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
           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.

      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.

       01  DFHCOMMAREA.
           EXEC SQL
             INCLUDE HCCMAREA
           END-EXEC.

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
       COPY HCERRSPD.