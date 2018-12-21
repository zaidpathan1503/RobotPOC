*** Settings ***
Resource          ../Variables/GlobalVariables.robot

*** Keywords ***
GetRequestXML
    [Documentation]    Parse the Request XML
    [Arguments]    ${ReqParam}
    ${xmlData}=    Get Binary File    ${ReqParam.RequestXML}
    ${root}=    Parse Xml    ${xmlData}
    ${intASt}=    Convert To String    ${ReqParam.IntA}
    ${intBSt}=    Convert To String    ${ReqParam.IntB}
    Set Element Text    ${root}    ${intASt}    xpath=${ReqParam.ReqPath}/intA
    Set Element Text    ${root}    ${intBSt}    xpath=${ReqParam.ReqPath}/intB
    Save Xml    ${root}    ${TempXML}
    
Create WS Client
    [Documentation]    Create WS Client
    ${test}    Create Soap Client    ${WSDL}
    log  ${test}
   
Execute WS Request
    [Documentation]    Execute WS Request
    [Arguments]    ${ReqParam}
    ${xmlData}=    Get Binary File    ${TempXML}
    ${response}=    Set Return Xml    True
    ${xmlData}=    Get Binary File    ${TempXML}
    ${message}=    Create Raw Soap Message    ${xmlData}
    ${response}=    Call Soap Method     ${ReqParam.MethodName}    ${message}
    Log     ${response}
    Set Global Variable    ${response}
    ${message}=    Convert To String    ${response}
    Log    ${message}
    ${root}=    Parse Xml    ${message}
    ${responseVal}=    Get Element Text    ${root}    ${ReqParam.ResPath}
    Log    ${responseVal}