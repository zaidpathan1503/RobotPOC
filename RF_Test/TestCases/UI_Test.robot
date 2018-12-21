*** Settings ***
Documentation     UI Test Suite. Sample Flight booking website    #Test Teardown
Test Setup        LaunchURL
Test Teardown     Close Browser    #Test Setup    LaunchURL
Default Tags      UI_TestSuite
Resource          ../Variables/GlobalVariables.robot    #Library    REST    https://api.publicapis.org    ssl_verify=false

*** Test Cases ***
Book_Flight_Return
    [Documentation]    Test to validate booking of round trip Itinerary
    [Tags]    SmokeTest    Critical
    Login
    SearchFlight    roundtrip
    SelectFlight
    Personal Details
    Validate Itinerary

Book_Flight_Oneway
    [Documentation]    Test to validate booking of one way trip Itinerary
    [Tags]    SmokeTest    Major
    Login
    SearchFlight    oneway
    SelectFlight
    Personal Details
    Validate Itinerary

Register_User
    [Documentation]    Test to validate new user registeration
    [Tags]    Critical    Regression Test
    RegisterUser_App
