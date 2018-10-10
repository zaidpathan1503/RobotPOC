*** Settings ***
Resource          ../Variables/GlobalVariables.robot

Documentation    WebService Test Suite. Testing Web Services for WSDL : http://www.dneonline.com/calculator.asmx?wsdl    
...    Services Tested: Add/Multiply/Subtract
Default Tags    SOAP_TestSuite
*** Test Cases ***
WebService_Add
    GetRequestXML    ${Add}
    Create WS Client
    Execute WS Request    ${Add}

WebService_Multiply
    GetRequestXML    ${Multiply}
    Create WS Client
    Execute WS Request    ${Multiply}

WebService_Subract
    GetRequestXML    ${Subtract}
    Create WS Client
    Execute WS Request    ${Subtract}
