# 8. Importing and Managing an API from z/OS Connect in API Connect

## Pre-requisites

This part assumes that an API has been created using z/OS Connect. The requirements for managing the API using API Connect are:

1. An IBM Cloud Account
2. The API Connect Feature enabled on the IBM Cloud Account
3. Access to the API description file (swagger.json) associated with the API or the URL and credentials to reach the API description document online.

## Background

The screen shots used in this part are based on a IBM Cloud hosted instance of API Connect and will be calling a previously created API (that was created with z/OS Connect).

Below is a pictorial view of z/OS Connect and API Connect working together. The green boxes represent Open API Specification (aka Swagger) documents.

![API Connect Diagram](doc/source/images/APIConnetDiagram.png)

## Steps

- Login to you IBM Cloud account if you are not already logged in.

- Navigate to API Connect

  - Under "Resource List", click the icon next to "Cloud Foundry" Services

  - Choose your API Connect Service

  <img src="doc/source/images/DashboardAPIConnect.png" alt="Dashboard API Connect" width="40%">

- Create an API Connect Product

  - A screen should appear with a large blue box in the middle.

  - Click the ">>" icon next to the word Dashboard (near the top right)

    <img src="doc/source/images/>>Icon.png" alt=">> Icon" width="40%">

  - Choose "Drafts"

  <img src="doc/source/images/DraftMenu.png" alt="Draft Menu" width="40%">

  - Click "Products"

  <img src="doc/source/images/ProductsButton.png" alt="Products Button" width="40%">

  - Add a new product by clicking the "Add" button

  <img src="doc/source/images/AddButton.png" alt="Add Button" width="30%">

  - A "New Product" menu screen should appear. Enter a title and click "Create Product"

   <img src="doc/source/images/NewProductMenu.png" alt="New Product Menu" width="80%">

- Import the z/OS Connect API

  - You should be in the Drafts section again. If not, then return to it by clicking the ">>" near the top left corner and choosing "Drafts".

  - Click "APIs"

  <img src="doc/source/images/APIsButton.png" alt="APIs Button" width="40%">

  - Add the API by choosing "Add" and "Import API from a file or URL"

  <img src="doc/source/images/APIAddButton.png" alt="API Add Button" width="40%">

  - Enter the URI for the API document API you want to manage. </br> Ex: https://<span></span>host:port/basepath/api-docs

    - Include credentials that have permission to view this document

    <img src="doc/source/images/ImportMenu.png" alt="Import Menu" width="60%">

  - Click "Import"

    - _You will now be taken to a screen to provide additional details about the API and add additional security._

- Refine the Imported API

  - _You should see a screen similar to the one below. The default Title of the API is equivalent to the base path of the imported API._

  <img src="doc/source/images/RefineAPI.png" alt="Refine API" width="70%">

  - Provide the Title and Name of your choice or keep the defaults

  - In the "Host" section, enter **\$(catalog.host)**

  - Scroll down to the "Schemes" section and un-check "http"

  <img src="doc/source/images/HostCheck.png" alt="HostCheck" width="70%">

  - Near the top of the screen, click the word "Assemble"

  <img src="doc/source/images/AssembleButton.png" alt="Assemble Button" width="70%">

  - Click "Create Assembly"

  <img src="doc/source/images/CreateAssembleButton.png" alt="Create Assembly Buttonn" width="40%">

* There will be a scroll bar near the middle of the screen. Scroll down to the Policies section and click and hold "Invoke". <br>
  <img src="doc/source/images/InvokeButton.png" alt="Invoke Button" width="60%">

- Drag the invoke action to a place between the circles. A dotted box will appear where you can drop it.

<img src="doc/source/images/DragInvoke.png" alt="Drag Invoke" width="60%">

- _After you drop it, the area will look like this picture below:_

![Invoke In Place](doc/source/images/InvokeInPlace.png)

- Click the new "invoke" action. A list of options should appear on the right

  - Modify the URL to be: **https://<span></span>host:port\$(request.path)**

  - Scroll down to the HTTP method and select "Keep"

  ![Keep Method](doc/source/images/KeepMethod.png)

- Add the API to a product 
  </br> Click “Design” at the top left.  
  ![Design](doc/source/images/Design.png)</br> 
  Click the three vertical dots (![Three Dots](doc/source/images/ThreeDots.png)) near the top right and a pop-up menu will appear. Choose "Add to existing products"

  <img src="doc/source/images/AddExistingProducts.png" alt="Add Existing Products" width="40%">

- A new menu will appear entitled "Add to existing products". Click the check box next to the product name you created in earlier steps. The click "Add" (blue button at the bottom)

  <img src="doc/source/images/SelectProduct.png" alt="Select Product" width="40%">

- Validate the API by clicking the circle with a checkbox (<img src="doc/source/images/CircleCheckBox.png" alt="Circle Checkbox" width="4%">) near the top right of the screen. </br> A message should appear that says "Validation Complete"

![Validation Complete](doc/source/images/ValidationComplete.png)

- Save the API by clicking the save icon (<img src="doc/source/images/SaveIcon.png" alt="Save Icon" width="3%">)

- Test the API Internally before Publishing

  - Click the triangle above the Invoke box

  ![PlayButton](doc/source/images/PlayButton.png)

  - A menu will appear on the left. Under **Setup**, it specifies the name of the Catalog (_default in the example with value Test Catalog_) and the name of the Product that contains the API.

  - For safety, click "Republish Product" if it is recommended.

  <img src="doc/source/images/Republish.png" alt="Republish Product" width="50%">

  - Further down in the same menu, click the triangle next to the word Operation to choose the part of the API to test.

  <img src="doc/source/images/OperationBlank.png" alt="Operation Blank" width="50%">

  <img src="doc/source/images/OperationFilled.png" alt="Operation Blank" width="50%">

  - Enter the authorization credentials and test parameters and click "Invoke".

  <img src="doc/source/images/TestForm.png" alt="Test Form" width="50%">

  - Scroll down to see the results of the test.

  <img src="doc/source/images/TestResponse1.png" alt="Test Response 1" width="50%">

  <img src="doc/source/images/TestResponse2.png" alt="Test Response 2" width="50%">

- Publish the Newly Created API to the Developer Portal

  - Click the ">>" icon near the top left of the screen

  <img src="doc/source/images/>>Icon2.png" alt=">>Icon2" width="50%">

  - Choose "Dashboard"

  - Click the picture that appears in the middle of the screen

  <img src="doc/source/images/OpenBookIcon.png" alt="OpenBookIcon" width="50%">

  - View the newly published product in the catalog

  - To get to the portal, click the gear icon (<img src="doc/source/images/GearIcon.png" alt="Gear Icon" width="4%">) then choose "Portal" on the left.

    - If you have not created one yet, you can do so now.

  - Open your instance of the Developer Portal (click the URL)

  <img src="doc/source/images/PortalURL.png" alt="Portal URL" width="40%">

  - Login to the portal

  - Select "API Products" at the top of the page.

  <img src="doc/source/images/APIProducts.png" alt="API Products" width="40%">

  - A list of products similar to the list of products in your previous view should appear

  ![Product List](doc/source/images/ProductList.png)

- Testing the API within the Developer Portal

  - Click on the Product to which the API belongs

  - A list of the APIs that belong to the product should appear on the left.

  <img src="doc/source/images/APIList.png" alt="API List" width="40%">

  - Select the API you created (and would like to test)

    - A testing screen should appear. Details about the API will be in the middle and the testing area will be on the right.

  ![Testing Screen](doc/source/images/TestingScreen.png)

  - Scroll on the right to the area to enter credentials and test values

  ![Test Example Input](doc/source/images/TestExampleInput.png)

  - Click "Call operation"

  - Results should appear below the Call Operation button

  ![Test Example Result](doc/source/images/TestExampleResutl.png)
