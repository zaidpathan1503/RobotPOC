*** Settings ***
Resource          ../Variables/GlobalVariables.robot

*** Keywords ***
RegisterUser_App
    [Documentation]    feature: Register New user by providing details
    Set Tags    RegisterUser
    #Click Link    xpath: //a[@href="mercuryregister.php"]
    #Sleep    2s
    Click Link    ${LRRegister}
    Input Text    ${LRFirstName}    ${NewUser.FirstName}
    Input Text    ${LRLastName}    ${NewUser.LastName}
    Input Text    ${LRPhone}    ${NewUser.Phone}
    Input Text    ${LREmail}    ${NewUser.Email_ID}
    Input Text    ${LRAdd1}    ${NewUser.Address1}
    Input Text    ${LRAdd2}    ${NewUser.Address2}
    Input Text    ${LRCity}    ${NewUser.City}
    Input Text    ${LRState}    ${NewUser.State}
    Input Text    ${LRPCode}    ${NewUser.PostalCode}
    Select From List By Label    ${LRCountry}    ${NewUser.Country}
    Input Text    ${LRUserName1}    ${NewUser.UserName}
    Input Text    ${LRpwd}    ${NewUser.Password}
    Input Text    ${LRconpwd}    ${NewUser.Password}
    Click Element    ${LRRegSub}