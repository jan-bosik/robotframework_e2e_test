*** Settings ***
Library    SeleniumLibrary
#Resource    ../Utilities/utilityVariables.py

*** Keywords ***
open my browser
    [Arguments]    ${url}       ${browser}      ${timeout}
    set selenium timeout     ${timeout}
    open browser    ${url}     ${browser}
    maximize browser window


close my browser
    close all browsers