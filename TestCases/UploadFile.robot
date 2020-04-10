*** Settings ***
Library    SeleniumLibrary    


*** Test Cases ***
UploadFile
    open browser   https://ps.uci.edu/~franklin/doc/file_upload.html    chrome
    Choose File    userfile    C://Users/bouza/Downloads/nature.jpg
    
