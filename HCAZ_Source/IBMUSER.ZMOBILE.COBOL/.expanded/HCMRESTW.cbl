      ******************************************************************
      *                                                                *
      * LICENSED MATERIALS - PROPERTY OF IBM                           *
      *                                                                *
      * "RESTRICTED MATERIALS OF IBM"                                  *
      *                                                                *
      * CB12                                                           *
      *                                                                *
      * (C) COPYRIGHT IBM CORP. 2011, 2013 ALL RIGHTS RESERVED         *
      *                                                                *
      * US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,      *
      * OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE                   *
      * CONTRACT WITH IBM CORPORATION                                  *
      *                                                                *
      *                                                                *
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

      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCMRST01.cpy at HCMRESTW.cbl line 31
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * This file contains the generated language structure(s) for
      *  restful JSON schema 'getMedications.json'.
      * This structure was generated using 'DFHJS2LS' at mapping level
      *  '3.0'.
      *
      *
      *      06 patient-medications.
      *
      * Comments for field 'patient-id':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->patient_id'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '10'.
      * JSON schema keyword 'maxLength' value: '10'.
      *        09 patient-id                    PIC X(10).
      *
      *
      * Array 'medications2' contains a variable number of instances
      *  of JSON schema keyword 'patient_medications->medications'.
      *  The number of instances present is indicated in field
      *  'medications2-num'.
      * There should be at least '0' instance(s).
      * There should be at most '50' instance(s).
      *        09 medications2-num              PIC S9(9) COMP-5 SYNC.
      *
      *
      *        09 medications OCCURS 50.
      *
      * Comments for field 'medication-id':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->medication_id'.
      * JSON schema type: 'integer'.
      * JSON schema keyword 'maximum' value: '9999999999'.
      * JSON schema keyword 'minimum' value: '0'.
      *          12 medication-id                 PIC 9(10) DISPLAY.
      *
      * Comments for field 'name':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->name'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '50'.
      * JSON schema keyword 'maxLength' value: '50'.
      *          12 name                          PIC X(50).
      *
      * Comments for field 'strength':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->strength'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *          12 strength                      PIC X(20).
      *
      * Comments for field 'amount':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->amount'.
      * JSON schema type: 'integer'.
      * JSON schema keyword 'maximum' value: '999'.
      * JSON schema keyword 'minimum' value: '0'.
      *          12 amount                        PIC 9(3) DISPLAY.
      *
      * Comments for field 'route':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->route'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *          12 route                         PIC X(20).
      *
      * Comments for field 'frequency':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->frequency'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *          12 frequency                     PIC X(20).
      *
      * Comments for field 'identifier':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->identifier'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *          12 identifier                    PIC X(20).
      *
      * Comments for field 'biomed-type':
      * This field represents the value of JSON schema keyword
      *  'patient_medications->medications->biomed_type'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '2'.
      * JSON schema keyword 'maxLength' value: '2'.
      *          12 biomed-type                   PIC X(2).
      *
      *
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

             06 patient-medications.
               09 patient-id                    PIC X(10).

               09 medications2-num              PIC S9(9) COMP-5 SYNC.

               09 medications OCCURS 50.
                 12 medication-id                 PIC 9(10) DISPLAY.
                 12 name                          PIC X(50).
                 12 strength                      PIC X(20).
                 12 amount                        PIC 9(3) DISPLAY.
                 12 route                         PIC X(20).
                 12 frequency                     PIC X(20).
                 12 identifier                    PIC X(20).
                 12 biomed-type                   PIC X(2).
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCMRST01.cpy at HCMRESTW.cbl line 31

        01 HCPAPP-PATIENT-DETAILS.

      * COPY HCCMAREA.
      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMARE2.cpy at HCMRESTW.cbl line 36
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMARE2.cpy at HCMRESTW.cbl line 36

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
