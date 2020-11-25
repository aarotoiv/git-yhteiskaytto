*** Settings ***
Library            SeleniumLibrary     run_on_failure=Nothing
Suite Setup        Open Browser        ${URL}       ${DRIVER}
Suite Teardown     Close Browser


*** Variables ***
${URL}              https://www.saucedemo.com
${DRIVER}           Chrome      

${USERNAME}         standard_user
${PASSWORD}         secret_sauce

${FIRST NAME}       Matti
${LAST NAME}        Meikäläinen
${POSTAL CODE}      60100


*** Test Cases ***
Login
    Go To Login Page
    Input Text                  id:user-name    ${USERNAME}
    Input Text                  id:password     ${PASSWORD}
    Click Element               id:login-button
    Wait Until Page Contains    Products

Checkout
    Go To Checkout
    Input First Name    ${FIRST NAME}
    Input Last Name     ${LAST NAME}
    Input Postal Code   ${POSTAL CODE}
    Go To Overview
    Confirm Order
    Order Should Be Successful


*** Keywords ***
Go To Login Page
    Go To               ${URL}
    Title Should Be     Swag Labs

Go To Checkout
    Go To           ${URL}/checkout-step-one.html

Go To Overview
    Go To           ${URL}/checkout-step-two.html

Confirm Order
    Click Element   //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

Order Should Be Successful
    Element Text Should Be      class:subheader     Finish
    Page Should Contain         THANK YOU FOR YOUR ORDER

Input First Name
    [Arguments]     ${FIRST NAME}
    Input Text      id:first-name       ${FIRST NAME}

Input Last Name
    [Arguments]     ${LAST NAME}
    Input Text      id:last-name        ${LAST NAME}

Input Postal Code
    [Arguments]     ${POSTAL CODE}
    Input Text      id:postal-code      ${POSTAL CODE}
