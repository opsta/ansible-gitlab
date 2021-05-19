*** Settings ***
Documentation       Test on scenario login
Library             SeleniumLibrary
*** Variables ***
${delay}               0.5
${URL_LOGIN}           http://localhost/users/sign_in
${URL_WELCOME_PAGE}    http://localhost/
${TITLE}               Sign in · GitLab
${username}            root
${password}            password
*** Keywords ***
Set Chrome Options
    [Documentation]        Set Chrome options for headless mode
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    [Return]               ${chrome_options}

Open Headless Chrome Browser to Page
    [Arguments]            ${URL}
    ${chrome_options}=     Set Chrome Options
    Create Webdriver       Chrome  chrome_options=${chrome_options}
    Go To                  ${URL_LOGIN}
Open Loginpage
    Open Headless Chrome Browser to Page  ${URL_LOGIN}
    Maximize Browser Window
    Title Should Be                     ${TITLE}
    Set Selenium Speed                  ${DELAY}
Input Username and Password
    Input Text                          xpath=//*[@id="user_login"]   ${username}
    Input Text                          xpath=//*[@id="user_password"]   ${password}
    Set Selenium Speed                  ${DELAY}
Submit Credentials
    Click Button                        xpath=//input[@value='Sign in']
    Set Selenium Speed                  ${DELAY}
Verify Welcome Page
    Location Should Be                  ${URL_WELCOME_PAGE}                  
*** Test Cases ***
Open Webpage
    Open Loginpage
    Capture Page Screenshot
Login
    Input Username And Password
    Capture Page Screenshot
    Submit Credentials
Open Welcome Page
    Verify Welcome Page
    Capture Page Screenshot
Close Browser
    Close Browser