*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           Dialogs
Resource          ../Resources/TestRes1.robot
Resource          ../Variables/GlobalVariables.robot
       

#Test Teardown
Suite Teardown    Close Browser
Default Tags    TestSuite1
*** Test Cases ***
TC1_Test
    [Tags]    SmokeTest
    LaunchURL
    Login
    SearchFlight
    SelectFlight
    Personal Details
    Validate Itinerary
    [Teardown]    Close Browser
    
TC2_Test
    LaunchURL
    Login
    SearchFlight
    SelectFlight
    Personal Details
    Validate Itinerary
