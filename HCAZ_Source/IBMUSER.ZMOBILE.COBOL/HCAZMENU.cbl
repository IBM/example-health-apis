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
      *                    Application menu                            *
      *                                                                *
      * Menu for health care application                               *
      *                                                                *
      *                                                                *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HCAZMENU.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-RESP                   PIC S9(8) COMP.

       77 MSGEND                       PIC X(24) VALUE
                                        'Transaction ended      '.

        COPY HCMAPS.
        01 COMM-AREA.
        COPY HCCMAREA.

      *****************************************************************
       PROCEDURE DIVISION.

      *---------------------------------------------------------------*
       MAINLINE SECTION.

           IF EIBCALEN > 0
              GO TO A-GAIN.

           Initialize HCZMENUI.
           Initialize HCZMENUO.
           Initialize COMM-AREA.

      * Display Main Menu
           EXEC CICS SEND MAP ('HCZMENU')
                     FROM(HCZMENUO)
                     MAPSET ('HCMAPS')
                     ERASE
                     RESP(WS-RESP)
                     END-EXEC.
       A-GAIN.

           EXEC CICS HANDLE AID
                     CLEAR(CLEARIT)
                     PF3(ENDIT) END-EXEC.
           EXEC CICS HANDLE CONDITION
                     MAPFAIL(ENDIT)
                     END-EXEC.

           EXEC CICS RECEIVE MAP('HCZMENU')
                     INTO(HCZMENUI) ASIS TERMINAL
                     MAPSET('HCMAPS') END-EXEC.


           EVALUATE HCZINPUTI
      * Add Patient
             WHEN '1'
                EXEC CICS RETURN
                          TRANSID('HCPA')
                          IMMEDIATE
                END-EXEC
      * Inquire Patient
             WHEN '2'
                EXEC CICS RETURN
                          TRANSID('HCP1')
                          IMMEDIATE
                END-EXEC
      * Add Medication
             WHEN '3'
                EXEC CICS RETURN
                          TRANSID('HCMA')
                          IMMEDIATE
                END-EXEC
      * Inquire Medications
             WHEN '4'
                EXEC CICS RETURN
                          TRANSID('HCM1')
                          IMMEDIATE
                END-EXEC
      * Add Visit
             WHEN '5'
                EXEC CICS RETURN
                          TRANSID('HCVA')
                          IMMEDIATE
                END-EXEC
      * Inquire Visit
             WHEN '6'
                EXEC CICS RETURN
                          TRANSID('HCV1')
                          IMMEDIATE
                END-EXEC
      * Add Thresholds
             WHEN '7'
                EXEC CICS RETURN
                          TRANSID('HCTA')
                          IMMEDIATE
                END-EXEC
      * Inquire Thresholds
             WHEN '8'
                EXEC CICS RETURN
                          TRANSID('HCT1')
                          IMMEDIATE
                END-EXEC

             WHEN OTHER

                 Move 'Please enter a valid option, or PF3 to exit'
                   To  HCZMSGO
                 Move -1 To HCZINPUTL

                 EXEC CICS SEND MAP ('HCZMENU')
                           FROM(HCZMENUO)
                           MAPSET ('HCMAPS')
                           CURSOR
                 END-EXEC
                 GO TO ENDIT-STARTIT

           END-EVALUATE.


      *    Send message to terminal and return

           EXEC CICS RETURN
           END-EXEC.

       ENDIT-STARTIT.
           EXEC CICS RETURN
                TRANSID('HCAZ')
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

       CLEARIT.

           Initialize HCZMENUI.
           EXEC CICS SEND MAP ('HCZMENU')
                     MAPSET ('HCMAPS')
                     MAPONLY
           END-EXEC

           EXEC CICS RETURN
                TRANSID('HCAZ')
                COMMAREA(COMM-AREA)
                END-EXEC.