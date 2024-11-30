*** Settings ***
Resource    ../../Library/Import.resource

*** Variables ***
${url}      https://the-internet.herokuapp.com/login
${userName.TextField}   //input[@id='username']
${password.TextField}   //input[@id='password']
${login.Button}        //button[@type='submit']
&{message}    login=xpath://div[@id='flash' and contains(text(),'into')]      logout=xpath://div[@id='flash' and contains(text(),'out')]
...     usernameInvalid=xpath://div[contains(text(),'username is invalid')]     passwordInvalid=xpath://div[contains(text(),'password is invalid')]
${logout.Button}    //a[@href='/logout']

*** Keywords ***
Open Herokuapp browser
    Open Browser    ${url}  chrome
    maximize browser window
    wait until element is visible    ${userName.TextField}

Login Herokuapp with username and password
    [Arguments]    ${username}      ${password}
    input text    ${userName.TextField}     ${username}
    input text    ${password.TextField}     ${password}

Click login button
    click button    ${login.Button}

Check message after click button
    [Arguments]    ${message}
    wait until element is visible    ${message}
    ${check_Message}=     get text    ${message}
    element should be visible    ${message}     ${check_Message}

Click logout button
    click element    ${logout.Button}