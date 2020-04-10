*** Settings ***
Library    SeleniumLibrary   
Variables    ../PageObjects/Repo.py


*** Variables ***
${LOGIN_URL}    https://yasmine.acollab.com/10626/home
${Browser}      chrome

*** Keywords ***

creer repertoire
    [Arguments]    ${nom_repo}
    Click element   ${button_repo}
    Input Text      ${nom_repository}    ${nom_repo}    
    Click Button    ${button_valider}    