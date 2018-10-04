*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           Dialogs
Variables         ../Variables/Variables1.yaml   
Variables         ../Variables/Variables2.yaml

*** Keywords ***
Login
    Input Text    name: userName    ${UserName}
    Input Text    name: password    ${password}
    Click Element    name: login

LaunchURL
    Open Browser    ${URL}    ${Browser}

SearchFlight
    Select Radio Button    tripType    oneway
    Select From List By Value    fromPort    Frankfurt
    Select From List By Value    fromMonth    10
    Select From List By Value    fromDay    10
    Select From List By Value    toPort    London
    Select From List By Value    toMonth    10
    Select From List By Value    toDay    12
    # Select Radio Button    servClass    Economy class
    Click Element    findFlights

SelectFlight
    #Select Radio Button    outFlight
    Click Element    reserveFlights
    
Personal Details
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
    Element Should Be Visible    xpath: //*[@src="/images/masts/mast_confirmation.gif"]