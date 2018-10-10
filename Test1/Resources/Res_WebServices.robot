*** Settings ***
Resource          ../Variables/GlobalVariables.robot


*** Keywords ***
GetRequestXML
    [Arguments]    ${ReqParam}
    ${xmlData}=    Get Binary File    ${ReqParam.RequestXML}
    ${root}=    Parse Xml    ${xmlData}
    ${intASt}=    Convert To String    ${ReqParam.intA}
    ${intBSt}=    Convert To String    ${ReqParam.intB}
    Set Element Text    ${root}    ${intASt}    xpath=${ReqParam.ReqPath}/intA
    Set Element Text    ${root}    ${intBSt}    xpath=${ReqParam.ReqPath}/intB
    Save Xml    ${root}    ${TempXML}
    
Create WS Client
    ${test}    Create Soap Client    ${WSDL}
    log  ${test}
   
Execute WS Request 
    [Arguments]    ${ReqParam}
    ${xmlData}=    Get Binary File    ${TempXML}
    ${Response}=    Set Return Xml    True
    ${xmlData}=    Get Binary File    ${TempXML}
    ${message}=    Create Raw Soap Message    ${xmlData}
    ${Response}=    Call Soap Method     ${ReqParam.MethodName}    ${message}
    Log     ${Response}
    Set Global Variable    ${Response}
    ${message}=    Convert To String    ${Response}
    Log    ${message}
    ${root}=    Parse Xml    ${message}
    ${ResponseVal}=    Get Element Text    ${root}    ${ReqParam.ResPath}
    Log    ${ResponseVal}     


