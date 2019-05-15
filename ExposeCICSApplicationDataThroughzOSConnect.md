# 7. Expose CICS Application data through z/OS Connect

- ## IPIC Connection Configuration

  - Define a TCPIPService to listen for inbound IPIC requests in your CICS region. This scenario uses a port value of 1091. For more information about defining a TCPIPService for inbound IPIC requests, see [Configuring the IPIC connection](https://www.ibm.com/support/knowledgecenter/SSGMCP_5.4.0/applications/developing/java/dfhpj2_jca_remote_eci_ipicconfig.html) in the _CICS Transaction Server_ documentation.

  - Use the following command to create a server:

```
zosconnect create catalogManager --template=zosconnect:sampleCicsIpicCatalogManager
```

    - The following artifacts are created:

      - A catalog API service archive file, catalog.aar, in the directory <WLP_USER_DIR>/servers/catalogManager/resources/zosconnect/apis.
