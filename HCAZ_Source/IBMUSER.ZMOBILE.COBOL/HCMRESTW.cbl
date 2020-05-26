      ******************************************************************
      * Copyright 2011,2013 IBM Corp. All Rights Reserved.
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
       PROGRAM-ID. HCMRESTW.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *****************************************************************
      *    DFHJS2WS GENERATED COPYBOOKS
      *****************************************************************

        01 JSON-REST-DATA.

        COPY HCMRST01.

        01 HCPAPP-PATIENT-DETAILS.

      * COPY HCCMAREA.
        COPY HCCMARE2.

       01 DEFAULT-CHANNEL            PIC X(16).

       01  WS-TSQ-FIELDS.
           03  WS-TSQ-NAME           PIC X(8) VALUE 'HCMRESTW'.
           03  WS-TSQ-LEN            PIC S9(4) COMP VALUE +200.
           03  WS-TSQ-DATA           PIC X(200).

       01 WS-RETURN-RESPONSE         PIC X(100).

       01 WS-HTTP-METHOD             PIC X(8).

       01 WS-RESID                   PIC X(100).
       01 WS-RESID2                  PIC X(100).

      * Fields to be used to calculate if commarea is large enough
       01  WS-COMMAREA-LENGTHS.
           03 WS-CA-HEADERTRAILER-LEN  PIC S9(4) COMP VALUE +18.
           03 WS-REQUIRED-CA-LEN       PIC S9(4)      VALUE +0.
           03 WS-COUNTER               PIC S9(4)      VALUE +0.
           03 LOCATION                 PIC S9(4)      VALUE +0.

      * Fields for URI manipulation
       77 WS-FIELD1                  PIC X(10).
       77 WS-FIELD2                  PIC X(3).
       77 WS-FIELD3                  PIC X(3).
       77 WS-FIELD4                  PIC X(30).
       77 WS-FIELD5                  PIC X(30).

       77 RESP                       PIC S9(8) COMP-5 SYNC.
       77 RESP2                      PIC S9(8) COMP-5 SYNC.

      * Container values
       77 UNEXPECTED-RESP-ABCODE      PIC X(04) VALUE 'ERRS'.
       77 UNSUPPORTED-METHOD-ABCODE   PIC X(04) VALUE 'UMET'.

      * Method constants
       77 METHOD-GET                 PIC X(8) VALUE 'GET     '.
       77 METHOD-PUT                 PIC X(8) VALUE 'PUT     '.
       77 METHOD-POST                PIC X(8) VALUE 'POST    '.
      *77 METHOD-DELETE              PIC X(8) VALUE 'DELETE  '.
      *77 METHOD-HEAD                PIC X(8) VALUE 'HEAD    '.


      *****************************************************************
      * Externally referenced data areas
      *****************************************************************
       LINKAGE SECTION.
      *
      *****************************************************************
      * Main program code follows
      *****************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCESSING SECTION.

           PERFORM INITIALISE-TEST.

           PERFORM RETRIEVE-METHOD.

           PERFORM PROCESS-METHOD.

           EXEC CICS RETURN
                     RESP(RESP)
                     RESP2(RESP2)
           END-EXEC.
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
              PERFORM GENERIC-ABEND
           END-IF.

           GOBACK.

      *****************************************************************
      * Initialise any variables and retrieve any test-specific
      * configuration information
      *****************************************************************
       INITIALISE-TEST.
      *    INITIALIZE HCPAPP-PATIENT-DETAILS
           MOVE SPACES to CA-REQUEST-ID
           MOVE ZEROES to CA-RETURN-CODE
           MOVE ZEROES TO CA-PATIENT-ID
           MOVE ZEROES to CA-NUM-MEDICATIONS
           MOVE ' ' TO WS-RETURN-RESPONSE
      * get channel
           EXEC CICS ASSIGN
                     CHANNEL(DEFAULT-CHANNEL)
                     RESP(RESP)
                     RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
              EXEC CICS ABEND
                     ABCODE('CHAB')
              END-EXEC
           END-IF.

      *****************************************************************
      * Retrieve the content of the method container
      *****************************************************************
       RETRIEVE-METHOD.

           EXEC CICS GET CONTAINER('DFHHTTPMETHOD')
                         INTO(WS-HTTP-METHOD)
                         RESP(RESP)
                         RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
              EXEC CICS ABEND
                     ABCODE('MEAB')
              END-EXEC
           END-IF.

      *****************************************************************
      * Perform the method
      *****************************************************************
       PROCESS-METHOD.
           EVALUATE WS-HTTP-METHOD
               WHEN METHOD-GET
                    PERFORM GET-DATA
               WHEN METHOD-PUT
                    PERFORM PUT-DATA
               WHEN METHOD-POST
                    PERFORM POST-DATA
               WHEN OTHER
                    EXEC CICS ABEND
                        ABCODE(UNSUPPORTED-METHOD-ABCODE)
                    END-EXEC
           END-EVALUATE.

      *****************************************************************
      * Perform the GET method (READ)
      *****************************************************************
       get-data.
           DISPLAY ' '.
           DISPLAY 'Perform GET method.'

           PERFORM GET-RESID

           MOVE '01IMED'  TO CA-REQUEST-ID
           MOVE WS-FIELD1 TO CA-PATIENT-ID
           Move 0         To CA-NUM-MEDICATIONS

           EXEC CICS LINK PROGRAM('HCM1BI01')
                     COMMAREA(HCPAPP-PATIENT-DETAILS)
                     LENGTH(32500)
           END-EXEC

           MOVE CA-PATIENT-ID TO patient-id
           MOVE CA-NUM-MEDICATIONS TO medications2-num

           IF CA-NUM-MEDICATIONS > 0
              MOVE ZERO To ws-counter
              PERFORM CA-NUM-MEDICATIONS TIMES

                 ADD +1 to ws-counter
                 MOVE CA-MEDICATION-ID(ws-counter)
                      TO medication-id(ws-counter)
                 MOVE CA-DRUG-NAME(ws-counter) TO name(ws-counter)
                 MOVE CA-STRENGTH(ws-counter) TO strength(ws-counter)
                 MOVE CA-AMOUNT(ws-counter) TO amount(ws-counter)
                 MOVE CA-ROUTE(ws-counter) TO route(ws-counter)
                 MOVE CA-FREQUENCY(ws-counter) TO frequency(ws-counter)
                 MOVE CA-IDENTIFIER(ws-counter) TO
                      identifier(ws-counter)
                 MOVE CA-TYPE(ws-counter) TO biomed-type(ws-counter)

              END-PERFORM

           MOVE HCPAPP-PATIENT-DETAILS(1:200) TO WS-TSQ-DATA
           PERFORM WRITE-TSQ
           PERFORM PUT-RESPONSE-ROOT-DATA.

      *****************************************************************
      * Perform the POST method (CREATE)
      *****************************************************************
       post-data.
           DISPLAY ' '.
           DISPLAY 'Performing POST method.'

           PERFORM GET-RESID

           PERFORM GET-REQUEST-ROOT-DATA

           MOVE '01AMED'         TO CA-REQUEST-ID
           MOVE ZEROES           TO CA-PATIENT-ID
           MOVE medication-id(ws-counter)
                TO CA-MEDICATION-ID(ws-counter)
           MOVE name (ws-counter)       TO CA-DRUG-NAME(ws-counter)
           MOVE strength(ws-counter)    TO CA-STRENGTH(ws-counter)
           MOVE amount (ws-counter)     TO CA-AMOUNT(ws-counter)
           MOVE route(ws-counter)       TO CA-ROUTE(ws-counter)
           MOVE frequency (ws-counter)  TO CA-FREQUENCY(ws-counter)
           MOVE identifier(ws-counter)  TO CA-IDENTIFIER(ws-counter)
           MOVE biomed-type(ws-counter) TO CA-TYPE(ws-counter)

           EXEC CICS LINK PROGRAM('HCM1BA01')
                     COMMAREA(HCPAPP-PATIENT-DETAILS)
                     LENGTH(32500)
           END-EXEC

           MOVE CA-PATIENT-ID TO patient-id

           STRING WS-FIELD4 patient-id
              DELIMITED BY SPACE
              INTO WS-RETURN-RESPONSE
           EXEC CICS PUT
                     CONTAINER('DFHRESPONSE')
                     CHAR
                     FROM (WS-RETURN-RESPONSE)
                     RESP(RESP)
                     RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
                 EXEC CICS ABEND
                     ABCODE('POSA')
                 END-EXEC
           END-IF

           MOVE HCPAPP-PATIENT-DETAILS(1:200) TO WS-TSQ-DATA
           PERFORM WRITE-TSQ.

      *****************************************************************
      * Perform the PUT method (UPDATE)
      *****************************************************************
       put-data.
           DISPLAY ' '.
           DISPLAY 'Performing PUT method.'

           PERFORM GET-RESID

           PERFORM GET-REQUEST-ROOT-DATA

           MOVE '01UMED'         TO CA-REQUEST-ID
           MOVE WS-FIELD1        TO CA-PATIENT-ID
           MOVE medication-id(ws-counter)
                TO CA-MEDICATION-ID(ws-counter)
           MOVE name(ws-counter)        TO CA-DRUG-NAME(ws-counter)
           MOVE strength(ws-counter)    TO CA-STRENGTH(ws-counter)
           MOVE amount(ws-counter)      TO CA-AMOUNT(ws-counter)
           MOVE route (ws-counter)      TO CA-ROUTE(ws-counter)
           MOVE frequency(ws-counter)   TO CA-FREQUENCY(ws-counter)
           MOVE identifier(ws-counter)  TO CA-IDENTIFIER(ws-counter)
           MOVE biomed-type(ws-counter) TO CA-TYPE(ws-counter)

           EXEC CICS LINK PROGRAM('HCM1BU01')
                     COMMAREA(HCPAPP-PATIENT-DETAILS)
                     LENGTH(32500)
           END-EXEC

           MOVE CA-PATIENT-ID TO patient-id

           STRING WS-FIELD4 patient-id
              DELIMITED BY SPACE
              INTO WS-RETURN-RESPONSE
           EXEC CICS PUT
                     CONTAINER('DFHRESPONSE')
                     CHAR
                     FROM (WS-RETURN-RESPONSE)
                     RESP(RESP)
                     RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
                 EXEC CICS ABEND
                     ABCODE('PUTA')
                 END-EXEC
           END-IF

           MOVE HCPAPP-PATIENT-DETAILS(1:200) TO WS-TSQ-DATA
           PERFORM WRITE-TSQ.

      *****************************************************************
      * Retrieve the content of the root container of the request tree
      *****************************************************************
       GET-REQUEST-ROOT-DATA.

           EXEC CICS GET CONTAINER('DFHWS-DATA')
                         INTO(JSON-REST-DATA)
                         RESP(RESP)
                         RESP2(RESP2)
           END-EXEC.
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
              PERFORM GENERIC-ABEND
           END-IF.

      *****************************************************************
      * Return a copy of root data
      *****************************************************************
       PUT-RESPONSE-ROOT-DATA.

           EXEC CICS PUT
                     CONTAINER('DFHWS-DATA')
                     FROM (JSON-REST-DATA)
                     RESP(RESP)
                     RESP2(RESP2)
           END-EXEC.
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
              PERFORM GENERIC-ABEND
           END-IF.

      *****************************************************************
      * Get containers
      *****************************************************************
       GET-RESID.
           MOVE ' ' TO WS-RESID
           EXEC CICS GET CONTAINER('DFHWS-URIMAPPATH')
                         INTO(WS-RESID)
                         RESP(RESP)
                         RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL) THEN
              DISPLAY 'Cannot get URIMAP container.'
           ELSE
              UNSTRING WS-RESID DELIMITED BY '/'
                  INTO WS-FIELD1, WS-FIELD2, WS-FIELD3
              DISPLAY 'URIMAP in WS-resid is:' WS-RESID
              MOVE WS-RESID TO WS-RESID2
              UNSTRING WS-RESID2 DELIMITED BY '*'
                  INTO WS-FIELD4, WS-FIELD5
           END-IF
      *
           MOVE ' ' TO WS-RESID
           EXEC CICS GET CONTAINER('DFHWS-URI-QUERY')
                         INTO(WS-RESID)
                         RESP(RESP)
                         RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL) THEN
              DISPLAY 'Cannot get QUERY container.'
           ELSE
              DISPLAY 'QUERY in WS-RESID is:' WS-RESID
           END-IF
      *
           MOVE ' ' TO WS-RESID
           EXEC CICS GET CONTAINER('DFHWS-URI-RESID')
                         INTO(WS-RESID)
                         RESP(RESP)
                         RESP2(RESP2)
           END-EXEC
           IF RESP NOT = DFHRESP(NORMAL)
           THEN
              EXEC CICS ABEND
                     ABCODE('RESA')
              END-EXEC
           ELSE
               DISPLAY 'RESID container is ' WS-resid
               MOVE ' ' TO WS-FIELD1 WS-FIELD2 WS-FIELD3
               UNSTRING WS-RESID DELIMITED BY '/'
                  INTO WS-FIELD1, WS-FIELD2, WS-FIELD3
               DISPLAY 'After unstring, WS-FIELD1 is: ' WS-FIELD1
           END-IF.

      *****************************************************************
      * Generic abend
      *****************************************************************
       GENERIC-ABEND.

           EXEC CICS ABEND
                     ABCODE(UNEXPECTED-RESP-ABCODE)
           END-EXEC.

      *****************************************************************
      * Write to TSQ
      *****************************************************************
       WRITE-TSQ.

           EXEC CICS WRITEQ TS QUEUE(WS-TSQ-NAME)
                     FROM(WS-TSQ-DATA)
                     RESP(RESP)
                     NOSUSPEND
                     LENGTH(WS-TSQ-LEN)
           END-EXEC.