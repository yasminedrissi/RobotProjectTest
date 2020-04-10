*** Settings ***
Library    SeleniumLibrary    
Library    OperatingSystem    

*** Test Cases ***
PrintPage
    Open Browser    https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_print  chrome
    Maximize Browser Window
    
    Select Frame    iframeResult
    
    Sleep   5
    Click Button    xpath://button[contains(text(),'Print this page')]    
    Sleep   2
    Get Window Handles    
    Switch Window  locator=NEW
    Click Element    class:cancel-button 
    #Click Element  
        #Click Button    xpath://button[contains(text(),'Print this page')]    
    #Sleep   10   
    #Select Window    MAIN
    #Get Window Names    
    #Get Window Titles    
    #Get Window Identifiers    
   
    #Select Window    new
   # Wait Until Element Is Visible    class:cancel-button
    #Click Element    class:cancel-button    
    #Sleep    3    
    #Select Window    locator=MAIN
    #Element Should Be Visible    id:"iframewrapper"        