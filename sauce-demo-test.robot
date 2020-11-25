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
    Input Text                  id:user-name    ${USERNAME}
    Input Text                  id:password     ${PASSWORD}
    Click Element               id:login-button
    Wait Until Page Contains    Products

Add product to cart
    Open Browser To Login Page
    Input Text                  id:user-name    ${USERNAME}
    Input Text                  id:password     ${PASSWORD}
    Click Element               id:login-button
    Wait Until Page Contains    Products
    Click Element               xpath=(/html/body/div[1]/div[2]/div[2]/div/div[2]/div/div[1]/div[3]/button)

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${URL}  ${DRIVER}
    Title Should Be     Swag Labs