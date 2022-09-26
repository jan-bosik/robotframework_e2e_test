*** Settings ***
Library    SeleniumLibrary      run_on_failure=Nothing

# Utility import
Resource    ../Utilities/utilities.robot
Resource   ../Utilities/utilityVariables.robot

# Registration page resources
Resource    ../Resources/regPageKeywords.robot
Resource    ../TestData/regDataVariables.robot

# Shop page resources
Resource    ../Resources/shopPageKeywords.robot
Resource    ../TestData/shopData.robot

# Checkout page resources
Resource    ../Resources/checkoutPageKeywords.robot

# Confirmation page resources
Resource    ../Resources/confirmPageKeywords.robot

Suite Setup    open my browser  ${url}       ${browser}      ${timeout}
Suite Teardown    close my browser

*** Test Cases ***


Registration Page Test
    enter my name       ${name}
    enter my email      ${email}
    enter my password   ${password}
    select ice cream checkbox
    select my gender    ${gender}
    enter my bday       ${bday}
    hit the submit button
    check if success mesage present
    click element    ${btn_shopButton}


Shop Page Test
    element should be visible   ${shop_page_shop_name}
    find products from shopping list    @{shopping_list}
    element should contain    ${checkout_button}     2     # Nefunguje s headless modeom
    click element    ${checkout_button}


Checkout Page Test
    element should be visible    ${table_head}
    table should be big enough
    prices should add up
    grand total should add up
    click element    ${checkout_btn}
    element should be visible    ${country_dropdown}

Confirm Page Test
    select country
    agree with terms
    click element    ${purchase_btn}
    page should contain    success
