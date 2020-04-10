*** Settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/Locators.py

*** Keywords ***
Open my Browser
   [Arguments]  ${SiteUrl}  ${Browser}
   open browser  ${SiteUrl}   ${Browser}
   Maximize Browser Window
Enter username
   [Arguments]  ${username}
   Input Text  ${txt_loginUserName}   ${username}

Enter password
   [Arguments]  ${password}
   Input Text  ${txt_loginPassword}   ${password}

Click signIn
   click button  ${btn_signIn}
Verify Succesfull login
   title should be  Find a Flight: Mercury Tours:
Close mybrowser
   close all browsers