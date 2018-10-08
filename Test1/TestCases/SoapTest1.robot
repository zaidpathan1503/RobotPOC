*** Settings ***
Library           SeleniumLibrary
Library           SudsLibrary
Library           XML
Library           String
Library           OperatingSystem
Library           Dialogs
Library           Collections

*** Test Cases ***
TestSoapWS
    ${xmlData}=    Get Binary File    ${EXECDIR}\\Test1\\Variables\\testws.xml
    ${root}=    Parse Xml    ${xmlData}
    Set Element Text    ${root}    240    xpath: Body/NumberToWords/ubiNum
    Save Xml    ${root}    ${EXECDIR}\\Test1\\Variables\\testws2.xml
    ${test}    Create Soap Client    http://www.dataaccess.com/webservicesserver/numberconversion.wso?WSDL
    ${Response}=    Set Return Xml    True
    ${xmlData}=    Get Binary File    ${EXECDIR}\\Test1\\Variables\\testws2.xml
    ${message}=    Create Raw Soap Message    ${xmlData}
    ${Response}=    Call Soap Method    NumberToWords    ${message}
    ${message}=    Convert To String    ${Response}
    ${root}=    Parse Xml    ${message}
    ${ResponseVal}=    Get Element Text    ${root}    Body/NumberToWordsResponse/NumberToWordsResult
    Log    ${ResponseVal}