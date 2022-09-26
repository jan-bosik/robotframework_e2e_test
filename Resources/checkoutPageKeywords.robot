*** Settings ***
Library    SeleniumLibrary
Library     String
Variables    ../PageObjects/checkoutPageLocators.py
Resource    ../TestData/shopData.robot

*** Keywords ***
table should be big enough
    ${ROWS}=        get element count    xpath: //table[@class='table table-hover']/tbody/tr
    set global variable    ${ROWS}
    ${expected_length}=     get length    ${shopping_list}
    should be equal as numbers  ${ROWS-2}    ${expected_length}

prices should add up
    FOR     ${tr_index}    IN RANGE     1       ${ROWS-1}

        ${quantity}=  get element attribute    xpath: //tbody/tr[${tr_index}]/td[2]/input[@id='exampleInputEmail1']     value

        ${price}=   get text    xpath: //tbody/tr[${tr_index}]/td[3]/strong
        ${price}=   String.split string    ${price}
        ${price}=   set variable    ${price}[1]

        ${total}=   get text    xpath: //tbody/tr[${tr_index}]/td[4]/strong
        ${total}=   String.split string    ${total}
        ${total}=   set variable    ${total}[1]

        ${sum}=     evaluate    ${quantity} * ${price}
        should be equal as numbers    ${sum}    ${total}

    END


grand total should add up
    ${sum}=    set variable    0

    ${grand_total}=   get text    xpath: //tbody/tr[3]/td[5]/h3/strong
    ${grand_total}=   String.split string    ${grand_total}
    ${grand_total}=   set variable    ${grand_total}[1]

    FOR     ${tr_index}    IN RANGE     1       ${ROWS-1}
        ${total}=   get text    xpath: //tbody/tr[${tr_index}]/td[4]/strong
        ${total}=   String.split string    ${total}
        ${total}=   set variable    ${total}[1]
        ${sum}=     evaluate    ${sum} + ${total}
    END

    should be equal as numbers    ${sum}    ${grand_total}
