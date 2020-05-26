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
      *                    Patient Prescription Menu                   *
      *                                                                *
      *                                                                *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCM1PL01.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77 MSGEND                       PIC X(24) VALUE
                                        'Transaction ended      '.

       COPY HCMAPS.

       01 COMM-AREA.
       COPY HCCMARE2.
       01 PATIENT-COMM-AREA.
           03 PCA-REQUEST-ID            PIC X(6).
           03 PCA-RETURN-CODE           PIC 9(2).
           03 PCA-PATIENT-ID            PIC 9(10).
           03 PCA-REQUEST-SPECIFIC      PIC X(32482).
      *    Fields used in INQ All and ADD patient
           03 CA-PATIENT-REQUEST REDEFINES PCA-REQUEST-SPECIFIC.
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

      *----------------------------------------------------------------*
      *****************************************************************
       PROCEDURE DIVISION.

      *---------------------------------------------------------------*
       MAINLINE SECTION.

           IF EIBCALEN > 0
              GO TO A-GAIN.

           Initialize HCM1MAPI.
           Initialize HCM1MAPO.
           Initialize PATIENT-COMM-AREA.
      *    Initialize COMM-AREA.
           Move LOW-VALUES To HCM1CNOI.
           Move SPACES to CA-REQUEST-ID.
           Move zeroes to CA-RETURN-CODE.
           Move zeroes to CA-PATIENT-ID.
           Move zeroes to CA-NUM-MEDICATIONS.
      *

      * Display Main Menu
           EXEC CICS SEND MAP ('HCM1MAP')
                     MAPSET ('HCMAPS')
                     ERASE
                     END-EXEC.

       A-GAIN.

           EXEC CICS HANDLE AID
                     CLEAR(CLEARIT)
                     PF3(ENDIT)
                     PF12(CANCELIT)
                     PF7(NOT-IMPLEMENTED)
                     PF8(NOT-IMPLEMENTED)
                     END-EXEC.
           EXEC CICS HANDLE CONDITION
                     MAPFAIL(ENDIT)
                     END-EXEC.

           EXEC CICS RECEIVE MAP('HCM1MAP')
                     INTO(HCM1MAPI) ASIS TERMINAL
                     MAPSET('HCMAPS') END-EXEC.


           PERFORM GET-PATIENT

      * Get medications
           Move '01IMED'   To CA-REQUEST-ID
           Move HCM1CNOI   To CA-PATIENT-ID
           Move 0          To CA-NUM-MEDICATIONS
           EXEC CICS LINK PROGRAM('HCM1BI01')
                     COMMAREA(COMM-AREA)
                     LENGTH(LENGTH OF COMM-AREA)
           END-EXEC

           IF CA-NUM-MEDICATIONS > 0
              MOVE CA-DRUG-NAME OF CA-MEDICATIONS (1)
                TO HCM1DNA1O
              MOVE CA-STRENGTH OF CA-MEDICATIONS (1)
                TO HCM1DST1O
              MOVE CA-AMOUNT OF CA-MEDICATIONS (1)
                TO HCM1DAM1O
              MOVE CA-ROUTE OF CA-MEDICATIONS (1)
                TO HCM1DRO1O
              MOVE CA-FREQUENCY OF CA-MEDICATIONS (1)
                TO HCM1DFR1O
           END-IF

           IF CA-NUM-MEDICATIONS > 1
              MOVE CA-DRUG-NAME OF CA-MEDICATIONS (2)
                TO HCM1DNA2O
              MOVE CA-STRENGTH OF CA-MEDICATIONS (2)
                TO HCM1DST2O
              MOVE CA-AMOUNT OF CA-MEDICATIONS (2)
                TO HCM1DAM2O
              MOVE CA-ROUTE OF CA-MEDICATIONS (2)
                TO HCM1DRO2O
              MOVE CA-FREQUENCY OF CA-MEDICATIONS (2)
                TO HCM1DFR2O
           END-IF

           IF CA-NUM-MEDICATIONS > 2
              MOVE CA-DRUG-NAME OF CA-MEDICATIONS (3)
                TO HCM1DNA3O
              MOVE CA-STRENGTH OF CA-MEDICATIONS (3)
                TO HCM1DST3O
              MOVE CA-AMOUNT OF CA-MEDICATIONS (3)
                TO HCM1DAM3O
              MOVE CA-ROUTE OF CA-MEDICATIONS (3)
                TO HCM1DRO3O
              MOVE CA-FREQUENCY OF CA-MEDICATIONS (3)
                TO HCM1DFR3O
           END-IF

           IF CA-RETURN-CODE > 0
             GO TO NO-MED-DATA
           END-IF

           EXEC CICS SEND MAP ('HCM1MAP')
                     FROM(HCM1MAPO)
                     MAPSET ('HCMAPS')
           END-EXEC
           GO TO ENDIT-STARTIT

      *    Send message to terminal and return

           EXEC CICS RETURN
           END-EXEC.

       ENDIT-STARTIT.
           Move SPACES to CA-REQUEST-ID.
           Move zeroes to CA-RETURN-CODE.
           Move zeroes to CA-PATIENT-ID.
           Move zeroes to CA-NUM-MEDICATIONS.

           EXEC CICS RETURN
                TRANSID('HCM1')
                COMMAREA(COMM-AREA)
                END-EXEC.

       ENDIT.
           EXEC CICS SEND TEXT
                     FROM(MSGEND)
                     LENGTH(LENGTH OF MSGEND)
                     ERASE
                     FREEKB
           END-EXEC
           EXEC CICS RETURN
           END-EXEC.

       GET-PATIENT.
      * Get patient name
           Move '01IPAT'   To PCA-REQUEST-ID
           Move HCM1CNOI   To PCA-PATIENT-ID
           EXEC CICS LINK PROGRAM('HCP1BI01')
                     COMMAREA(PATIENT-COMM-AREA)
                     LENGTH(32500)
           END-EXEC

           IF PCA-RETURN-CODE > 0
              GO TO NO-PATIENT-DATA
           END-IF

           Move CA-FIRST-NAME to HCM1FNAI
           Move CA-LAST-NAME  to HCM1LNAI.

       CLEARIT.

           Initialize HCM1MAPI.
           EXEC CICS SEND MAP ('HCM1MAP')
                     MAPSET ('HCMAPS')
                     MAPONLY
           END-EXEC

           Move SPACES to CA-REQUEST-ID.
           Move zeroes to CA-RETURN-CODE.
           Move zeroes to CA-PATIENT-ID.
           Move zeroes to CA-NUM-MEDICATIONS.

           EXEC CICS RETURN
                TRANSID('HCM1')
                COMMAREA(COMM-AREA)
                END-EXEC.

       CANCELIT.

           EXEC CICS RETURN
                TRANSID('HCAZ')
                IMMEDIATE
                END-EXEC.

       NOT-IMPLEMENTED.
           Move 'That feature has not been implemented yet.'
                To  HCM1MSGO
           Go To ERROR-OUT.

       NO-PATIENT-DATA.
           Move 'No patient data was returned.'  To  HCM1MSGO
           Go To ERROR-OUT.

       NO-MED-DATA.
           Move 'No medication data was returned.' To  HCM1MSGO
           Go To ERROR-OUT.

       ERROR-OUT.
           EXEC CICS SEND MAP ('HCM1MAP')
                     FROM(HCM1MAPO)
                     MAPSET ('HCMAPS')
           END-EXEC.

           Initialize HCM1MAPI.
           Initialize HCM1MAPO.
           Initialize PATIENT-COMM-AREA.

           GO TO ENDIT-STARTIT.