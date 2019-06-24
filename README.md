# **CODE PATTERN IN PROGRESS.<br/> DO NOT TRY TO COMPLETE!!!**

# z/OS Connect & API Connect Code Pattern for Summit Health

This code pattern shows you how to expose data from a DB2 database and a CICS application through z/OS Connect and then create APIs to access that data with API Connect.

This work was done as part of the Summit Health set of code patterns, which demonstrate how cloud technology can access data stored on z/OS Systems. We needed a way to access the large amounts of data stored on a DB2 database and a CICS application. We used z/OS Connect and API Connect to expose the data through REST APIs. z/OS Connect provides a single, common way to unleash your existing market-differentiating assets on IBM with RESTful APIs. API Connect allows automated API creation, simple discovery of assets, self-service access for developers, and built-in security and governance. z/OS Connect was used first to expose the data from DB2 and CICS as REST APIs. Then API Connect was used to create a way for developers to easily access the APIs through an intuitive portal.

**This code pattern is for people with an intermediate understanding and experience working with Z Systems, z/OS and Eclipse tools like IBM Explorer for z/OS.**

When the reader has completed this code pattern, they will understand how to:

- Use z/OS Connect to expose CICS and DB2 Data with REST APIs
- Use API Connect to manage your APIs and create a portal for developers to access them

### Pre-requisites

- In order to create a DB2 RESTful service, the system pre-requisite is to have DB2 v11 or v12 with associated PTFs for REST API support. (Info on APARs here:<br/> http://www-01.ibm.com/support/docview.wss?uid=isg1II14827 )

- You must have a supported version of CICS Transaction Server.

- The Service and API Creator will need the z/OS Connect API Toolkit for service (.sar) file generation of CICS services and API (.aar) file generation for CICS and DB2 APIs.

- The API Creator will also need to have some sort of REST client tool. That can be in the form of a browser plug-in (such as Rest Client for Firefox or Advanced Rest Client for Chrome) or a desktop tool such as Postman or CuRL.

- The service creator will need the **z/OS Connect Build Toolkit** for the .sar file generation for Db2 services. This tool can be run either on the mainframe (omvs) or in a Windows command interface. These instructions do so on Windows. <br/> The build toolkit is packaged as a zip file and can be obtained from your z/OS Connect product installation directory or here: <br/> https://developer.ibm.com/mainframe/zos-connect-ee-build-toolkit/

- The API Connect environment used in this code pattern is hosted on IBM Cloud.  An IBM Cloud account will be required.

## Flow

This is how your APIs will be routed from your backend systems to a developer friendly portal.

![Flow Diagram](doc/source/images/FlowDiagram.png)

1. z/OS Connect exposes the DB2 data through REST APIs
2. z/OS Connect exposes the CICS application programs/data through REST APIs
3. API Connect serves as a gateway to z/OS Connect, manages the z/OS Connect APIs and establishes a portal for developers to gain access to the APIs

# Steps

1. [Create CICS Application](#1-create-cics-application)
2. [Create the DB2 database and tables](#2-create-the-db2-database-and-tables)
3. [Populate DB2 database with Synthea data](#3-populate-db2-database-with-synthea-data)
4. [Install z/OS Connect](#4-install-zos-connect)
5. [Expose DB2 data through z/OS Connect](#5-expose-db2-data-through-zos-connect)
6. [Expose CICS Application through z/OS Connect](#6-expose-cics-application-data-through-zos-connect)
7. [Create API Connect Instance](#7-create-api-connect-instance)
8. [Importing and Managing an API from z/OS Connect in API Connect](#8-importing-and-managing-an-api-from-zos-connect-in-api-connect)


## 1. Create CICS Application

- A sample CICS application is included in this code pattern. The application is known as HCAZ. It is a simple CICS application for inputting and retrieving healthcare information.

- The source code is included in the [HCAZ_Source](HCAZ_Source) folder.

- The source code includes JCL files to install the application. Some changes may need to be made to the JCL depending on your installation. If you have any questions ask your organization's z/OS System Programmer or a z/OS System Administrator.

## 2. Create the DB2 database and tables

- Assumptions/Prerequisites

  - You have DB2 v12 on z/OS (or DB2 v11 with REST enablement PTFs)

  - You have administrative authority to create database elements

  - You have knowledge of database and table creation commands

- Pre-work:

  - Create a database and table space within the DB2 z/OS subsystem

- DB2 Tables:

  - There are 12 tables that are used in the entire Summit Healthcare Application (CICS native and Web):

  |   **Table**   |                                                                      **Description**                                                                       |
  | :-----------: | :--------------------------------------------------------------------------------------------------------------------------------------------------------: |
  |    PATIENT    |                                     Holds basic patient information (name, contact information, insurance card number)                                     |
  |     USER      |                                                      Holds patient credentials for login into system                                                       |
  |  MEDICATION   |                                                     General registry of medications and valid dosages                                                      |
  |  MEDITATION   |                                                   Record of any meditation sessions held with a patient                                                    |
  | PRESCRIPTION  |                                     Record of medications prescribed to a patient, with prescription period and dosage                                     |
  |   THRESHOLD   |                                      Most recent heart rate and blood pressure for a patient. One entry per patient.                                       |
  |   HEARTRATE   |                                                Log of patient heart rate when measured at a doctor's visit                                                 |
  | BLOODPRESSURE |                                              Log of patient blood pressure when measured at a doctor's visit                                               |
  |    SESSION    |                                                  Log of brain activity measurements taken during analysis                                                  |
  | APPOINTMENTS  |                                  Record of appointments for each patient (including doctor's name, specialty and reason)                                   |
  |   ALLERGIES   |                                                   List of any allergies a patient has and when they were diagnosed                                                   |
  | OBSERVATIONS  | Log of patient measurements (such as height and weight), lab results (like cholesterol and blood sugar) and questionnaire answers (such as smoking status) |

- Seven (7) of the tables are used in the Web Interface:

  - PATIENT

  - USER

  - MEDICATION

  - PRESCRIPTION

  - APPOINTMENTS

  - ALLERGIES

  - OBSERVATIONS

- Create the tables for the functions that will be implemented in the Healthcare system.

  - The tables should be created in the table space that was defined to contain the Healthcare tables

  - Once the database and tables are created, a BIND needs to take place to connect the CICS application and the database.

- The commands for creating the database tables are listed in this [PDF](doc/source/CreateTableStatements.pdf)

## 3. Populate DB2 database with Synthea data

- Visit this [code pattern](https://developer.ibm.com/patterns/transform-load-big-data-csv-files-db2-zos-database/) for the instructions on populating your DB2 database with data from the Synthea tool

## 4. Install z/OS Connect

- Please refer to the **Installation and Initial Setup** section of this handy [Getting Started Guide](https://www-03.ibm.com/support/techdocs/atsmastr.nsf/WebIndex/WP102724) on how to install z/OS Connect. 

  -This guide is also available on this site as a [PDF](doc/source/zOSConnectEEV3GettingStarted.pdf).  Go to page 8 for information on installation.

## 5. Expose DB2 data through z/OS Connect

- [Click this link to go to the steps for exposing DB2 data through z/OS Connect](ExposeDB2DataThroughzOSConnect.md)


## 6. Expose CICS Application through z/OS Connect

- [Click this link to go to the steps for exposing CICS data through z/OS Connect](ExposeCICSApplicationDataThroughzOSConnect.md)

## 7. Create API Connect Instance

- Create an IBM Cloud Account

  - [Click here](https://cloud.ibm.com/registration) to go to the IBM Cloud registration page.

  - Enter your email, first name, last name, Country or Region, and the password you would like to use.

  ![IBM Cloud Create Account](doc/source/images/IBMCloudCreateAccount.gif)

- Create an API Connect Instance on IBM Cloud

  - From the IBM Cloud Dashboard, click on **Catalog**.

  - In the search bar type **"API Connect"** and hit **enter**.

  - Click on the API Connect card.

  - Name the service. Choose a location to deploy in (Choose the location closest to you). Leave the organization and space at the defaults. Scroll down and select the **"Lite"** plan. The click the **Create** button.

  ![Creating an API Connect Instance](doc/source/images/CreatAPIConnectInstance.gif)

## 8. Importing and Managing an API from z/OS Connect in API Connect

- [Click this link to go to the steps for Importing and Managing an API from z/OS Connect in API Connect](ImportingAndManagingAnAPIFromzOSConnectInAPIConnect.md)
