*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           Dialogs
Library           BuiltIn
Resource          ../Resources/TestRes1.robot
Resource          ../Variables/GlobalVariables.robot
       

#Test Teardown
Default Tags    TestSuite1
Test Teardown    Close Browser
*** Test Cases ***
TC1_Test
    [Tags]    SmokeTest
    LaunchURL
    Login
    SearchFlight
    SelectFlight
    Personal Details
    Validate Itinerary
    
TC2_Test
    [Documentation]    This will show on Allure Report Description
    LaunchURL
    Login
    SearchFlight
    SelectFlight
    Personal Details
    Validate Itinerary

TC3_Test
    [Documentation]    This will register User
    LaunchURL
    RegisterUser