*** Settings ***
Resource    ../Library/Import.resource
Test Setup    Open Herokuapp browser
Test Teardown    Close browser

*** Test Cases ***
TC01_Verify that user can login to the herokuapp website with using username and password success.
    Login Herokuapp with username and password
    ...    ${login_TestData}[username]
    ...    ${login_TestData}[password]
    Click Login Button
    Check message after click button    ${message}[login]
    Click logout button
    Check message after click button    ${message}[logout]

TC02_Verify that user can't login to the herokuapp website with using invalid password
    Login Herokuapp with username and password
    ...    ${login_TestData}[username]
    ...    ${login_TestData}[passwordIncorrect]
    Click Login Button
    Check message after click button    ${message}[passwordInvalid]

TC03_Verify that user can't login to the herokuapp website with using invalid username
    Login Herokuapp with username and password
    ...    ${login_TestData}[usernameNotFound]
    ...    ${login_TestData}[passwordIncorrect]
    Click Login Button
    Check message after click button    ${message}[usernameInvalid]