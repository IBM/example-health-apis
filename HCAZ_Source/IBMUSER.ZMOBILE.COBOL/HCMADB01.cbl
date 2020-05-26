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
      *                                                                *
      *                    ADD Medication Details                      *
      *                                                                *
      *   To add patient's name, address and date of birth to the      *
      *  DB2 patient table creating a new patient entry.               *
      *                                                                *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCMADB01.
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
                                        VALUE 'HCMADB01------WS'.
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
      * Definitions required by SQL statement                          *
      *   DB2 datatypes to COBOL equivalents                           *
      *     SMALLINT    :   PIC S9(4) COMP                             *
      *     INTEGER     :   PIC S9(9) COMP                             *
      *     DATE        :   PIC X(10)                                  *
      *     TIMESTAMP   :   PIC X(26)                                  *
      *----------------------------------------------------------------*
      * Host variables for output from DB2 integer types
       01  DB2-OUT.
           03 DB2-MEDICATION-ID-INT    PIC S9(9) COMP.
           03 DB2-PATIENT-ID           PIC S9(9) COMP.
           03 DB2-AMOUNT            PIC S9(4) COMP.
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

      * Call routine to Insert row in Medication table
           PERFORM Obtain-Patient-Id.
           PERFORM INSERT-MEDICATION.

      *    Return to caller
           EXEC CICS RETURN END-EXEC.

       MAINLINE-EXIT.
           EXIT.
      *----------------------------------------------------------------*


       Obtain-Patient-Id.
      *
           MOVE CA-PATIENT-ID TO DB2-PATIENT-ID.
           MOVE CA-AMOUNT TO DB2-AMOUNT.

      *================================================================*
       INSERT-MEDICATION.
      *================================================================*
      * Insert row into Medication table based on patient number       *
      *================================================================*
           MOVE ' INSERT MEDICATION' TO EM-SQLREQ
      *================================================================*
             EXEC SQL
               INSERT INTO MEDICATION
                         ( MEDICATIONID,
                           PATIENTID,
                           DRUGNAME,
                           STRENGTH,
                           AMOUNT,
                           ROUTE,
                           FREQUENCY,
                           IDENTIFIER,
                           TYPE )
                  VALUES ( DEFAULT,
                           :DB2-PATIENT-ID,
                           :CA-DRUG-NAME,
                           :CA-STRENGTH,
                           :DB2-AMOUNT,
                           :CA-ROUTE,
                           :CA-FREQUENCY,
                           :CA-IDENTIFIER,
                           :CA-BIOMED-TYPE  )
             END-EXEC
      *       DISPLAY 'SQLCODE='
      *       DISPLAY SQLCODE

             IF SQLCODE NOT EQUAL 0
               MOVE '90' TO CA-RETURN-CODE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS RETURN END-EXEC
             ELSE
               EXEC SQL
                    SET :DB2-MEDICATION-ID-INT = IDENTITY_VAL_LOCAL()
               END-EXEC
             END-IF

           MOVE DB2-PATIENT-ID TO CA-PATIENT-ID.
           MOVE DB2-MEDICATION-ID-INT TO CA-PRESCRIPTION-ID.
           EXIT.
      *================================================================*

      *----------------------------------------------------------------*
       COPY HCERRSPD.