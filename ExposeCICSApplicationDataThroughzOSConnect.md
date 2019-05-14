# 7. Expose CICS Application data through z/OS Connect

- Connectivity between the z/OS Connect EE (zCEE) server and a CICS region is provided by CICS _IP Interconnectivity_ (IPIC). Further CICS configuration may be required. <br/>
  In the sample application that will be shown, the CICS region is running on TCP/IP host
  _wg31.washington.ibm.com_ and has an IPIC TCPIPService listening on port _1491_. The z/OS Connect EEserver is running on the same TCP/IP host and is listening on port _9443_ for HTTPS requests.

- ## Adding IPIC support to a z/OS Connect server

  - Go to the server.xml directory, e.g. /var/zosconnect/servers/\<serverName>

  - Edit server.xml and add the lines highlighted here in bold as shown, see the notes below:
    ![Edit z/OS Connect CICS server.xml](doc/source/images/EditZOSConnectCICSServerXML.png)

    - _Notes:_

      1. This value must match the value that is specified for the _connectionRef_ property when a _service_ is developed in the API Toolkit.

      2. The TCP/IP host name or IP address of the host on which the CICS region is running.

      3. The port assigned to the IPIC TCPIPService defined in the CICS region.

    - Save the file.

- ## Install the Catalog Manager Sample in the CICS region

  - For this document we are using the CICS "catalog manager" sample application. This application simulates an office supplies store application. It is useful for illustrating z/OS Connect EE because it is plausibly "real world" while not being overly-complex. <br/> The details of this CICS sample application are provided here: <br/> https://www.ibm.com/support/knowledgecenter/SSGMCP_5.4.0/applications/example-application/dfhxa_t100.html <br/> Work with the CICS administrator and do the following:
