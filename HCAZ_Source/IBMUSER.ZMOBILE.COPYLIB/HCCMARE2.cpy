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