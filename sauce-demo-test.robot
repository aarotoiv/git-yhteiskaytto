*** Settings ***
Library           SeleniumLibrary     run_on_failure=Nothing


*** Variables ***
${URL}              https://www.saucedemo.com/
${DRIVER}           Chrome      

${USERNAME}         standard_user
${PASSWORD}         secret_sauce


*** Test Cases ***


*** Keywords ***
