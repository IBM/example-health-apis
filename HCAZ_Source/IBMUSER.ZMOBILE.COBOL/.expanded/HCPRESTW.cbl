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
       PROGRAM-ID. HCPRESTW.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *****************************************************************
      *    DFHJS2WS GENERATED COPYBOOKS
      *****************************************************************

        01 JSON-REST-DATA.

      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCPRST01.cpy at HCPRESTW.cbl line 31
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * This file contains the generated language structure(s) for
      *  restful JSON schema 'getPatient.json'.
      * This structure was generated using 'DFHJS2LS' at mapping level
      *  '3.0'.
      *
      *
      *      06 patient-personal-information.
      *
      * Comments for field 'patient-id':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->patient_id'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '10'.
      * JSON schema keyword 'maxLength' value: '10'.
      *        09 patient-id                    PIC X(10).
      *
      * Comments for field 'insurance-card-number':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->insurance_card_number'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '10'.
      * JSON schema keyword 'maxLength' value: '10'.
      *        09 insurance-card-number         PIC X(10).
      *
      * Comments for field 'first-name':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->first_name'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *        09 first-name                    PIC X(20).
      *
      * Comments for field 'last-name':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->last_name'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *        09 last-name                     PIC X(20).
      *
      * Comments for field 'date-of-birth':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->date_of_birth'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '10'.
      * JSON schema keyword 'maxLength' value: '10'.
      *        09 date-of-birth                 PIC X(10).
      *
      * Comments for field 'street-address':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->street_address'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '25'.
      * JSON schema keyword 'maxLength' value: '25'.
      *        09 street-address                PIC X(25).
      *
      * Comments for field 'zipcode':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->zipcode'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '8'.
      * JSON schema keyword 'maxLength' value: '8'.
      *        09 zipcode                       PIC X(8).
      *
      * Comments for field 'cell-number':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->cell_number'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '20'.
      * JSON schema keyword 'maxLength' value: '20'.
      *        09 cell-number                   PIC X(20).
      *
      * Comments for field 'email-address':
      * This field represents the value of JSON schema keyword
      *  'patient_personal_information->email_address'.
      * JSON schema type: 'string'.
      * JSON schema keyword 'minLength' value: '40'.
      * JSON schema keyword 'maxLength' value: '40'.
      *        09 email-address                 PIC X(40).
      *
      *
      * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

             06 patient-personal-information.
               09 patient-id                    PIC X(10).
               09 insurance-card-number         PIC X(10).
               09 first-name                    PIC X(20).
               09 last-name                     PIC X(20).
               09 date-of-birth                 PIC X(10).
               09 street-address                PIC X(25).
               09 zipcode                       PIC X(8).
               09 cell-number                   PIC X(20).
               09 email-address                 PIC X(40).
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCPRST01.cpy at HCPRESTW.cbl line 31

        01 HCPAPP-PATIENT-DETAILS.

      * start of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCPRESTW.cbl line 35
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
      * end of expanded file: C:\REGI_EZSOURCE\IBMUSER.ZMOBILE.COPYLIB\HCCMAREA.cpy at HCPRESTW.cbl line 35

       01 DEFAULT-CHANNEL            PIC X(16).

       01  WS-TSQ-FIELDS.
           03  WS-TSQ-NAME           PIC X(8) VALUE 'HCPRESTW'.
           03  WS-TSQ-LEN            PIC S9(4) COMP VALUE +200.
           03  WS-TSQ-DATA           PIC X(200).

       01 WS-RETURN-RESPONSE         PIC X(100).

       01 WS-HTTP-METHOD             PIC X(8).

       01 WS-RESID                   PIC X(100).
       01 WS-RESID2                  PIC X(100).

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

      *
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
           INITIALIZE HCPAPP-PATIENT-DETAILS
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

           MOVE '01IPAT'  TO CA-REQUEST-ID
           MOVE WS-FIELD1 TO CA-PATIENT-ID

           EXEC CICS LINK PROGRAM('HCP1BI01')
                     COMMAREA(HCPAPP-PATIENT-DETAILS)
                     LENGTH(32500)
           END-EXEC

           MOVE CA-PATIENT-ID to patient-id
           MOVE CA-FIRST-NAME TO first-name
           MOVE CA-LAST-NAME TO last-name
           MOVE CA-DOB TO date-of-birth
           MOVE CA-POSTCODE TO zipcode
           MOVE CA-PHONE-MOBILE TO cell-number
           MOVE CA-EMAIL-ADDRESS TO email-address
           MOVE CA-INS-CARD-NUM TO insurance-card-number
           MOVE CA-ADDRESS to street-address
      *    MOVE CA-CITY to

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

           MOVE '01APAT'         TO CA-REQUEST-ID
           MOVE patient-id       TO CA-PATIENT-ID
      *    MOVE                  TO CA-USERID
           MOVE first-name       TO CA-FIRST-NAME
           MOVE last-name        TO CA-LAST-NAME
           MOVE date-of-birth    TO CA-DOB
           MOVE street-address   TO CA-ADDRESS
      *    MOVE                  TO CA-CITY
           MOVE zipcode          TO CA-POSTCODE
           MOVE cell-number      TO CA-PHONE-MOBILE
           MOVE email-address    TO CA-EMAIL-ADDRESS
           MOVE insurance-card-number TO CA-INS-CARD-NUM

           EXEC CICS LINK PROGRAM('HCP1BA01')
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

           MOVE '01UPAT'         TO CA-REQUEST-ID
           MOVE WS-FIELD1        TO CA-PATIENT-ID
           MOVE first-name       TO CA-FIRST-NAME
           MOVE last-name        TO CA-LAST-NAME
           MOVE date-of-birth    TO CA-DOB
           MOVE zipcode          TO CA-POSTCODE
           MOVE cell-number      TO CA-PHONE-MOBILE
           MOVE email-address    TO CA-EMAIL-ADDRESS
           MOVE insurance-card-number TO CA-INS-CARD-NUM

           EXEC CICS LINK PROGRAM('HCP1BU01')
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
