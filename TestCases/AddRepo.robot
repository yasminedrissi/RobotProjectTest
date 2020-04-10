*** Settings ***
Library    SeleniumLibrary    
Resource    ../Ressources/login_resources.robot
Resource    ../Ressources/ajoutrepo.robot


*** Variables ***
${browser}  chrome
${url}  http://newtours.demoaut.com/
${username}  ydrissielbouzaidi
${password}  i<3yasmine

*** Test Cases ***
AddRepo
    Open my browser
    Maximize Browser Window
    Input username    ${username}
    Input pwd    ${password}
    Click login button
    Dashboard should be visible
    Sleep    1  
    Click Element    xpath://*[@id="didacticiel"]/div[1]/a/span    
    Click Element     xpath://*[@id='menu_doc']/a
    Sleep    1   
    ${present}=  Run Keyword And Return Status    Page Should Contain   aucun fichier
    Run Keyword If    ${present}    creer repertoire    repo
    ${firstrow} =  Get Table Cell    xpath://*[@id="FormContent:docList"]/div/table    2    2 
    log  result: ${firstrow}
    
   
    