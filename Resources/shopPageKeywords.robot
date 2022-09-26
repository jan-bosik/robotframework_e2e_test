*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/shopPageLocators.py

*** Keywords ***

find item cart button
    [Arguments]    ${product_name}
    click element    xpath: //a[text()='${product_name}']/parent::h4/parent::div/parent::div/div[@class='card-footer']/button

find products from shopping list
    [Arguments]    @{list}
    FOR    ${item}  IN   @{list}
        find item cart button    ${item}
    END