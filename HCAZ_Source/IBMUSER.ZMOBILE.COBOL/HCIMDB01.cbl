      ******************************************************************
      * Copyright 2014 IBM Corp. All Rights Reserved.
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
       COPY HCERRSWS.
      *----------------------------------------------------------------*
      *    DB2 CONTROL
      *----------------------------------------------------------------*
      * SQLCA DB2 communications area
           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.
      *
      *
      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.

       01  DFHCOMMAREA.
           EXEC SQL
             INCLUDE HCCMARE2
           END-EXEC.

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
       COPY HCERRSPD.