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

   -

2. Create a z/OS Connect Project

3. Create the DB2 database and tables

4. Populate DB2 database with Synthea data

5. Expose DB2 data through z/OS Connect

6. Create CICS Application

7. Expose CICS Application data through z/OS Connect

8. Create API Connect Instance

9. Connect z/OS Connect REST APIs to API Connect
