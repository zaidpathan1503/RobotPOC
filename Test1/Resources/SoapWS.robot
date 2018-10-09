*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           Dialogs
Library           BuiltIn
Library           SudsLibrary
Library           String
Library           XML
Variables         ../Variables/Variables1.yaml
Variables         ../Variables/Variables2.yaml
Variables         ../Variables/WS.yaml

*** Keywords ***
GetRequestXML
    ${xmlData}=    Get Binary File    ${RequestXML}
    ${root}=    Parse Xml    ${xmlData}
    ${NumtoWordSt}=    Convert To String    ${NumtoWord}
    Set Element Text    ${root}    ${NumtoWordSt}    xpath=${ReqPath}
    Save Xml    ${root}    ${RequestXML2}
    
Create WS Client
    ${test}    Create Soap Client    ${WSDL}
    log  ${test}
   
Send WS request 
     ${xmlData}=    Get Binary File    ${RequestXML2}
     ${Response}=    Set Return Xml    True
     ${xmlData}=    Get Binary File    ${RequestXML2}
     ${message}=    Create Raw Soap Message    ${xmlData}
     ${Response}=    Call Soap Method    NumberToWords    ${message}
     Log     ${Response}
     Set Global Variable    ${Response}
     
Validate Response
    ${message}=    Convert To String    ${Response}
    Log    ${message}
    ${root}=    Parse Xml    ${message}
    ${ResponseVal}=    Get Element Text    ${root}    ${ResPath}
    Log    ${ResponseVal}
