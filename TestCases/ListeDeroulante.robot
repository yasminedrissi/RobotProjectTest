*** Settings ***
Library    SeleniumLibrary    


*** Test Cases ***
AfficherListe
    Open Browser    https://testautomationpractice.blogspot.com/  chrome
    Maximize Browser Window
    Scroll Element Into View    id:files
    Wait Until Element Is Visible    id:files  
    ${count} =  Get Element Count    //select[@id='files']/option
    ${list} =   Get List Items    id:files
    FOR    ${element}    IN    @{list}
        Select From List By Label    id:files        ${element}
        Sleep    5    
    END    
    
     
   
    