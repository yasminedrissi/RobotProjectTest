*** Settings ***
Resource    ../Ressources/login_resources.robot

Suite Setup    Open my Browser
Suite Teardown    Close Browsers
Test Setup      Open Login Page
Test Template    Invalid login


*** Test Cases ***       User        Password
Right user empty pass    demo        ${EMPTY}
Right user wrong pass    demo        FooBar

Empty user right pass    ${EMPTY}    mode
Empty user empty pass    ${EMPTY}    ${EMPTY}
Empty user wrong pass    ${EMPTY}    FooBar

Wrong user right pass    FooBar      mode
Wrong user empty pass    FooBar      ${EMPTY}
Wrong user wrong pass    FooBar      FooBar

*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input pwd    ${password}
    click login button
    Error message should be visible