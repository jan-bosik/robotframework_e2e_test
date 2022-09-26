# confirm page keywords
*** Settings ***
Library     SeleniumLibrary
Variables    ../PageObjects/confirmationPageLocators.py
Resource    ../TestData/shopData.robot

*** Keywords ***
select country
    input text    ${country_dropdown}   ${country}[0:3]
    ${country_option}=  set variable    xpath: //a[text()='${country}']
    wait until page contains element    ${country_option}
    #select from list by label    Slovakia
    click element    ${country_option}

agree with terms
    #wait until element is visible    ${terms_checkbox}
    #select checkbox    ${terms_checkbox}
    execute javascript      'arguments[0].click();'     ARGUMENTS       ${terms_checkbox}
    sleep   3