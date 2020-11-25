*** Settings ***
Library           SeleniumLibrary     run_on_failure=Nothing


*** Variables ***
${URL}              https://www.saucedemo.com/
${DRIVER}           Chrome      

${USERNAME}         standard_user
${PASSWORD}         secret_sauce


*** Test Cases ***
Login
    Open Browser To Login Page
    Input Text      id:user-name    ${USERNAME}
    Input Text      id:password     ${PASSWORD}


*** Keywords ***
Open Browser To Login Page
    Open Browser        ${URL}  ${DRIVER}
    Title Should Be     Swag Labs