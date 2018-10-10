*** Settings ***
Resource          ../Variables/GlobalVariables.robot       

#Test Teardown
Default Tags    UI_TestSuite
Test Teardown    Close Browser
Test Setup    LaunchURL
*** Test Cases ***
Book_Flight_Return
    [Tags]    SmokeTest
    Login
    SearchFlight    roundtrip
    SelectFlight
    Personal Details
    Validate Itinerary
    
Book_Flight_Oneway
    [Documentation]    This will show on Allure Report Description
    Login
    SearchFlight    oneway
    SelectFlight
    Personal Details
    Validate Itinerary

Register_User
    [Documentation]    This will register User
    RegisterUser