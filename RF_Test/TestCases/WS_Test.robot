*** Settings ***
Documentation     WebService Test Suite. Testing Web Services for WSDL : http://www.dneonline.com/calculator.asmx?wsdl
...               Services Tested: Add/Multiply/Subtract
Default Tags      SOAP_TestSuite
Resource          ../Variables/GlobalVariables.robot

*** Test Cases ***
WebService_Add
    [Documentation]    Test to validate Add webservice
    [Tags]    WS_Test    Critical
    GetRequestXML    ${Add}
    Create WS Client
    Execute WS Request    ${Add}

WebService_Multiply
    [Documentation]    Test to validate Multiply webservice
    [Tags]    WS_Test    Major
    GetRequestXML    ${Multiply}
    Create WS Client
    Execute WS Request    ${Multiply}

WebService_Subract
    [Documentation]    Test to validate Subtract webservice
    [Tags]    WS_Test    Minor
    GetRequestXML    ${Subtract}
    Create WS Client
    Execute WS Request    ${Subtract}
    

