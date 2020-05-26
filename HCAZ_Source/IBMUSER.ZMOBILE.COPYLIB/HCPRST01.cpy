      ******************************************************************
      * Copyright 2011,2014 IBM Corp. All Rights Reserved.
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