*** Settings ***
Variables    ../PageObjects/randomTest.py
*** Test Cases ***
Example
    ${result}=  evaluate  randomTest.getRandomNameRepo()  modules=randomTest
    log  result: ${result}