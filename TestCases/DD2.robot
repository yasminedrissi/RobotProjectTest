*** Settings ***
Library    SeleniumLibrary       
Resource    ../Ressources/login_resources.robot  
Library           DataDriver    TestData/loginData.xlsx


Suite Setup    Open my browser 
Suite Teardown    Close browsers
Test Template    Invalid login



*** Test Cases ***
#LoginTest using  ${username}  ${password}   

*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input pwd    ${password}
    [Tags]    FLAT
    click login button
    Sleep    5    
    Error message should be visible