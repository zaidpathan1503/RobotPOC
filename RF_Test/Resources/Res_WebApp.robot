*** Settings ***
Resource          ../Variables/GlobalVariables.robot

*** Keywords ***
Login
    [Documentation]    feature: Login to Mercury Travels application with correct user
    Set Tags    Smoke    Story: Login to Mercury Travels with user mercury/mercury
    Input Text    name: userName    ${UserName}
    Input Text    name: password    ${Password}
    Click Element    name: login

LaunchURL
    [Documentation]    feature: Navigate to the application URL
    Open Browser    ${URL}    ${Browser}
SearchFlight
    [Documentation]    feature: Search Flights from desired from and to location
    [Arguments]    ${Trip}
    Set Tags    Smoke    Story: Given a search page when from and to destination are available Then User should be able to search for flights.
    SeleniumLibrary.Select Radio Button    tripType    ${Trip}
    Select From List By Value    fromPort    Frankfurt
    Select From List By Value    fromMonth    10
    Select From List By Value    fromDay    10
    Select From List By Value    toPort    London
    Select From List By Value    toMonth    10
    Select From List By Value    toDay    12
    # Select Radio Button    servClass    Economy class
    Click Element    findFlights

SelectFlight
    [Documentation]    feature: Select Flights from available results
    #Select Radio Button    outFlight
    Click Element    reserveFlights

Personal Details
    [Documentation]    feature: Enter personal details to confirm booking
    Input Text    name: passFirst0    ${FirstName}
    Input Text    name: passLast0    ${LastName}
    Select From List By Label    pass.0.meal    Diabetic
    Select From List By Label    creditCard    Visa
    Input Text    creditnumber    4343456765432123
    Select From List By Label    cc_exp_dt_mn    07
    Select From List By Label    cc_exp_dt_yr    2010
    Input Text    cc_frst_name    TestFName
    Input Text    cc_last_name    TestLName
    Input Text    billAddress1    1325 Borregas Ave
    Input Text    billCity    Sunnyvale
    Input Text    billState    CA
    Input Text    billZip    94089
    Select From List By Label    billCountry    UNITED STATES
    Select Checkbox    checkbox
    Click Element    buyFlights

Validate Itinerary
    [Documentation]    feature: Validate valid Itinerary is displayed
    Element Should Be Visible    xpath: //*[@src="/images/masts/mast_confirmation.gif"]

RegisterUser
    [Documentation]    feature: Register New user by providing details
    Set Tags    RegisterUser
    #Click Link    xpath: //a[@href="mercuryregister.php"]
    #Sleep    2s
    Click Link    xpath: //a[contains(text(),'REGISTER')]
    Input Text    firstName    ${NewUser.FirstName}
    Input Text    lastName    ${NewUser.LastName}
    Input Text    phone    ${NewUser.Phone}
    Input Text    userName    ${NewUser.Email_ID}
    Input Text    address1    ${NewUser.Address1}
    Input Text    address2    ${NewUser.Address2}
    Input Text    city    ${NewUser.City}
    Input Text    state    ${NewUser.State}
    Input Text    postalCode    ${NewUser.PostalCode}
    Select From List By Label    country    ${NewUser.Country}
    Input Text    email    ${NewUser.UserName}
    Input Text    password    ${NewUser.Password}
    Input Text    confirmPassword    ${NewUser.Password}
    Click Element    register
