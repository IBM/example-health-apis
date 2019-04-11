# z/OS Connect & API Connect Code Pattern for Summit Health

This code pattern shows you how to expose data from a DB2 database and a CICS application through z/OS Connect and then create APIs to access that data with API Connect.

This work was done as part of the Summit Health set of code patterns, which demonstrate how cloud technology can access data stored on z/OS Systems. We needed a way to access the large amounts of data stored on a DB2 database and a CICS application. We used z/OS Connect and API Connect to expose the data through REST APIs. z/OS Connect provides a single, common way to unleash your existing market-differentiating assets on IBM with RESTful APIs. API Connect allows automated API creation, simple discovery of assets, self-service access for developers, and built-in security and governance. z/OS Connect was used first to expose the data from DB2 and CICS as REST APIs. Then API Connect was used to create a way for developers to easily access the APIs through an intuitive portal.

This code pattern is for people with an intermediate understand and experience working with Z Systems, z/OS and tools like z/OS Explorer.

When the reader has completed this code pattern, they will understand how to:

- Use z/OS Connect to expose CICS and DB2 Data with REST APIs
- Use API Connect to manage your APIs and create a portal for developers to access them

## Flow

This is how your APIs will be routed from your backend systems to a developer friendly portal.

![Flow Diagram](doc/source/images/FlowDiagram.png)

1. z/OS Connect exposes the DB2 data through REST APIs
2. z/OS Connect exposes the CICS application data through REST APIs
3. API Connect connects to z/OS Connect and establishes a portal for developers to gain access to the APIs

# Steps

1. Install z/OS Connect

   - Please refer to this [PDF](doc/source/zOSConnectEEV3GettingStarted.pdf) on how to install z/OS Connect. Go to page 8 for information on installation.

2. Create a z/OS Connect Project

   - Open the Eclipse tool (IBM® Explorer for z/OS Aqua) in which you installed the z/OS Connect EE API Editor.

   - Switch to the z/OS Connect Enterprise Edition perspective.

     - From menu bar, select **Window > Open Perspective > Other**

     - In the list of perspectives, select **z/OS Connect Enterprise Edition** and click **OK**.

     You are now in the **z/OS Connect Enterprise Edition** perspective, with related views and resources readily available.

   - Create an API project.

   - From the menu bar, select **File > New > z/OS Connect EE API Project**. The z/OS Connect EE API Project wizard opens.

     - Enter the project properties below, then click **Finish**.

   | **Project property** |                                                                           **Description**                                                                            |                 **Sample Value to specify**                 |
   | :------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------: |
   |     Project name     |                                        Unique alphanumeric name for your project. This is the name of the project in Eclipse.                                        | SummitHealth <span style="color:red"> Ask Kenishia </span>. |
   |       API name       |                                   The name of your API. This is the name by which the z/OS Connect EE server knows about this API.                                   |       <span style="color:red"> Ask Kenishia </span>.        |
   |      Base path       | The unique basePath attribute that specifies the root of all the resources in this API. This path is used by REST clients in the URI they send in to invoke the API. |        <span style="color:red"> Ask Kenishia </span>        |
   |     Description      |                                           Optional field to provide a description of this API for documentation purposes.                                            |        <span style="color:red"> Ask Kenishia </span>        |

   - [Source](https://www.ibm.com/support/knowledgecenter/en/SS4SVW_2.0.0/com.ibm.zosconnect.doc/scenarios/ims_create_api.html)

3. Create the DB2 database and tables

   - Assumptions/Prerequisites

     - You have DB2 v12 on z/OS (or DB2 v11 with REST enablement PTFs)

     - You have administrative authority to create database elements

     - You have knowledge of database and table creation commands

   - Pre-work:

     - Create a database and table space within the DB2 z/OS subsystem

   - DB2 Tables:

     - A. There are 12 tables that are used in the entire Summit Application (CICS native and Web):

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
     |   ALLERGIES   |                                                   List of any allergies a patient has and when they were                                                   |
     | OBSERVATIONS  | Log of patient measurements (such as height and weight), lab results (like cholesterol and blood sugar) and questionnaire answers (such as smoking status) |

4. Populate DB2 database with Synthea data

   - Visit this [code pattern](https://developer.ibm.com/patterns/transform-load-big-data-csv-files-db2-zos-database/) for the instructions on populating your DB2 database with data from the Synthea tool

5. Expose DB2 data through z/OS Connect

6. Create CICS Application

7. Expose CICS Application data through z/OS Connect

8. Create API Connect Instance

   - Create an IBM Cloud Account

     - [Click here](https://cloud.ibm.com/registration) to go to the IBM Cloud registration page.

     - Enter your email, first name, last name, Country or Region, and the password you would like to use.

       ![IBM Cloud Create Account](doc/source/images/IBMCloudCreateAccount.gif)

   - Create an API Connect Instance

     - From the IBM Cloud Dashboard, click on **Catalog**.

     - In the search bar tyep **"API Connect"** and hit **enter**.

     - Click on the API Connect card.

     - Name the service. Choose a location to deploy in (Choose the locatino closest to you). Leave the organization and space at the defaults. Scroll down and select the **"Lite"** plan. The click the **Create** button.

     ![Creating an API Connect Instance](doc/source/images/CreatAPIConnectInstance.gif)

9. Connect z/OS Connect REST APIs to API Connect
