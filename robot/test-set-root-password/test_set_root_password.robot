*** Settings ***
Documentation       Test on scenario set new password
Library             SeleniumLibrary
*** Variables ***
${DELAY}               2
${URL_WELCOME_PAGE}    http://localhost/
${TITLE_SET_PASSWORD}  GitLab 
${password}            password
*** Keywords ***
Set Chrome Options
    [Documentation]        Set Chrome options for headless mode
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    [Return]       ${chrome_options}

Open Headless Chrome Browser to Page
    [Arguments]                         ${URL}
    ${chrome_options}=                  Set Chrome Options
    Create Webdriver                    Chrome  chrome_options=${chrome_options}
    Go To                               ${URL_WELCOME_PAGE}
    Set Selenium Speed                  ${DELAY}
    Capture Page Screenshot
Open Set root Password Page
    Open Headless Chrome Browser to Page        ${URL_WELCOME_PAGE} 
    Title Should Be                             ${TITLE_SET_PASSWORD}
    Capture Page Screenshot
    Set Selenium Speed                          ${DELAY}
Input New root Password
    Input Text                          xpath=//*[@id="user_password"]   ${password}
    Input Text                          xpath=//*[@id="user_password_confirmation"]   ${password}
    Capture Page Screenshot
    Set Selenium Speed                  ${DELAY}
Submit New root Password
    Click Button                        xpath=//input[@value='Change your password']
    Capture Page Screenshot
    Set Selenium Speed                  ${DELAY}
Open Loginpage
    Go to                               ${URL_LOGIN}
    Title Should Be                     ${TITLE_LOGIN}
    Capture Page Screenshot
    Set Selenium Speed                  ${DELAY}
*** Test Cases ***
Open Set root Password Page
    Open Set root Password Page
    Capture Page Screenshot
Submit New root Password
    Input New root Password
    Capture Page Screenshot
    Submit New root Password
Open Webpage
    Open Loginpage
    Capture Page Screenshot