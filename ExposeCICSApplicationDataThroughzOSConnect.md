# 7. Expose CICS Application data through z/OS Connect

- ## IPIC Connection Configuration

  - Define a TCPIPService to listen for inbound IPIC requests in your CICS region. This scenario uses a port value of 1091. For more information about defining a TCPIPService for inbound IPIC requests, see [Configuring the IPIC connection](https://www.ibm.com/support/knowledgecenter/SSGMCP_5.4.0/applications/developing/java/dfhpj2_jca_remote_eci_ipicconfig.html) in the _CICS Transaction Server_ documentation.

  - Use the following command to create a server:

    - `zosconnect create catalogManager --template=zosconnect:sampleCicsIpicCatalogManager`

  - The following artifacts are created:

    - A catalog API service archive file, catalog.aar, in the directory \<WLP_USER_DIR>/servers/catalogManager/resources/zosconnect/apis.

    - Three services archive files, inquireCatalog.sar, inquireSingle.sar, and placeOrder.sar, in the directory \<WLP_USER_DIR>/servers/catalogManager/resources/zosconnect/services.

    - A server.xml configuration file in the directory \<WLP_USER_DIR>/servers/catalogManager with the zosconnect:cicsService-1.0 feature included.

  - Customize the z/OS Connect EE server configuration file.

    - Update the CICS connection element: \<zosconnect_cicsIpicConnection id="cicsConn" host="localhost" port="1091"/>

      - If your server and CICS region are on different LPARs, replace the host value localhost with the host name or IP address of the LPAR hosting your CICS region.

      - Replace the port value 1234 with the port that your CICS TCPIPService is configured to listen for inbound IPIC requests. This scenario uses port 1091.

    - Update the httpPort for inbound connections into z/OS Connect EE in the following element, if necessary: <br/>
      \<httpEndpoint id="defaultHttpEndpoint" host="\*" httpPort="9080" httpsPort="-1"/>

    - Enable security if required.
