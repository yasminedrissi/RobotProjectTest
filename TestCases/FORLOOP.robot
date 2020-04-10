*** Variables ***
@{animaux} =  dog  cat 
@{list}  =  a  b  c
*** Test Cases ***
Example1
    FOR    ${animal}    IN    @{animaux}
       log  ${animal}   
    END
    
Manage index manually
    ${index} =    Set Variable    -1
    FOR    ${item}    IN    @{LIST}
        ${index} =    Evaluate    ${index} + 1
        log    ${index}
    END
For-in-enumerate
    FOR    ${index}    ${item}    IN ENUMERATE    @{LIST}
       log    ${index}    ${item}
    END
*** Keywords ***
Handle Table
    [Arguments]    @{table}
    FOR    ${row}    IN    @{table}
        Handle Row    @{row}
    END

Handle Row
    [Arguments]    @{row}
    FOR    ${cell}    IN    @{row}
        #Handle Cell    ${cell}
        log  ${cell}
    END

Start and end
    [Documentation]    Loops over values from 1 to 10
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END
    


