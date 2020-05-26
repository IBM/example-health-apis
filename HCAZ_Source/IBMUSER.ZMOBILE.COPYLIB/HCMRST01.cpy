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