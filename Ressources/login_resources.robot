*** Settings ***
Library    SeleniumLibrary   


*** Variables ***
${LOGIN_URL}    https://yasmine.acollab.com/faces/index.xhtml
${Browser}   chrome

*** Keywords ***
Open my browser
    open browser  ${LOGIN_URL}  ${Browser}

Close browsers
    close all browsers

Open login Page
    go to  ${LOGIN_URL}
    
Input username
    [Arguments]   ${username}
    Input Text    FormLogin:login    ${username}    
Input pwd
    [Arguments]   ${password}
    Input Text    FormLogin:password    ${password} 

Click login button
    Click Element    xpath://*[@id="FormLogin:submit"]/button
Click logout link
    Click Link    Logout   
Error message should be visible
    Page Should Contain    Identifiant et / ou Mot de passe incorrecte(s)
Dashboard should be visible
    Page Should Contain    Tableau de bord    