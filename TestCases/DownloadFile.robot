*** Settings ***
Library   SeleniumLibrary
Library   OperatingSystem    

*** Variables ***
${browserName}     chrome
${browserLocale}   fr


*** Test Cases ***
DownloadFile
    # create unique folder
    ${now}    Get Time    epoch
    ${download directory}    Join Path    ${OUTPUT DIR}    downloads_${now}
    Create Directory    ${download directory}
    ${chromeOptions} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${download directory}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chromeOptions}    add_argument    --lang\=${browserLocale}
    #Call Method    ${chromeOptions}    add_argument    --headless
    Call Method    ${chromeOptions}    add_argument    --window-size\=1024,768
    Call Method    ${chromeOptions}    add_argument    --disable-gpu
    Create Webdriver    Chrome    chrome_options=${chromeOptions}
    Go to    https://file-examples.com/index.php/sample-documents-download/sample-doc-download/
    Maximize Browser Window
    Scroll Element Into View    xpath://*[@id="table-files"]/tbody/tr[1]/td[5]/a[1]
    Click Link     Download sample DOC file    # downloads a file
    # wait for download to finish
   
    ${file}    Wait Until Keyword Succeeds    1 min    2 sec    Download should be done    ${download directory}

*** Keywords ***
Download should be done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}
   