*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/regPageLocators.py

*** Keywords ***

enter my name
    [Arguments]    ${name}
    input text    ${txt_nameField}  ${name}

enter my email
    [Arguments]    ${email}
    input text    ${txt_emailField}  ${email}

enter my password
    [Arguments]    ${password}
    input text    ${txt_passwordField}  ${password}

select ice cream checkbox
    select checkbox    ${checkbox_icecreamcheckbox}

select my gender
    [Arguments]    ${gender}
    select from list by label   ${drpdown_genderdropdown}   ${gender}

enter my bday
    [Arguments]    ${bday}
    input text    ${txt_bday}   ${bday}

hit the submit button
    click element    ${btn_submitbutton}

check if success mesage present
    page should contain    Success!