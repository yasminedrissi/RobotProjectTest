*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource  ../Ressources/LoginKeywords.robot
*** Variables ***
${browser}  chrome
${url}  http://newtours.demoaut.com/
${username}  tutorial
${password}  tutorial
*** Test Cases ***
LoginTest
   Open browser  ${url}  ${browser}
   Enter username  ${username}
   Enter password  ${password}
   Click signIn
   Verify Succesfull login
   Close mybrowser
   