*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${PriceUpperLimit}   90
${PriceLowerLimit}   50


*** Keywords ***
Open Heureka Landing Page
    Open Browser      https:\\www.heureka.sk     chrome
    Set Window Size    1920    1080
    Wait Until Page Contains    Tipy na grilovanie a piknik

Navigate To Grill Section
    Click Element    xpath=//h2[.="Tipy na grilovanie a piknik"]
    Wait Until Page Contains    Tipy na grilovanie a piknik
    Click Element    xpath=//h3/a[@href="https://grily.heureka.sk/"]
    Wait Until Page Contains    Grily
    
Add Item Tefal GC305012 To The Shopping Baket And Return To Grill Section
    Click Element    xpath=//h3/a[@href="https://grily.heureka.sk/tefal-gc305012/"]
    Wait Until Page Contains    Tefal GC305012
    Click Element    xpath=//button[@class='c-top-offer__cart-button e-button e-button--highlight']
    Click Element    xpath=//button[@class='c-cart-confirm__button--continue c-offscreen__close e-link']
    Wait Until Page Contains    Tefal GC305012
    Click Element    xpath=//a[@class='c-breadcrumbs__link'][normalize-space()='Grily']

Add Item Orava Orava EG-1900 To The Shopping Baket And Return To Grill Section
    Click Element    xpath=//a[@class='c-product__link'][normalize-space()='Orava EG-1900']
    Wait Until Page Contains    Orava EG-1900
    Click Element    xpath=//span[@class='c-top-offer__buy-text']
    Wait Until Page Contains    Tovar sme pridali do košíka
    Click Element    xpath=/html[1]/body[1]/div[3]/div[1]/div[1]/main[1]/div[2]/div[1]/div[1]/div[3]/aside[1]/div[1]/div[1]/div[2]/div[2]/button[1]
    Wait Until Page Contains    Orava EG-1900
    Click Element    xpath=//a[@class='c-breadcrumbs__link'][normalize-space()='Grily']

Add Item Eta Vital 1162 90000 To The Shopping Baket And Return To Grill Section
    Click Element    xpath=//a[@class='c-product__link'][normalize-space()='Eta Vital 1162 90000']
    Wait Until Page Contains    Eta Vital 1162 90000
    Click Element    xpath=//span[@class='c-top-offer__buy-text']
    Wait Until Page Contains    Tovar sme pridali do košíka
    Click Element    xpath=/html[1]/body[1]/div[3]/div[1]/div[1]/main[1]/div[2]/div[1]/div[1]/div[3]/aside[1]/div[1]/div[1]/div[2]/div[2]/button[1]
    Wait Until Page Contains    Eta Vital 1162 90000
    Click Element    xpath=//a[@class='c-breadcrumbs__link'][normalize-space()='Grily']

Delete the product from the list
    Click Element    xpath=
    Sleep    1s
    Click Element    xpath=

Verify empty basket
    Wait Until Page Contains Element
    ${price}    Get Text    ${locator_basket_price}
    Should Be Equal    ${price}    0,00 €


*** Test Cases ***
Buy A Grill
    Open Heureka Landing Page
    Navigate To Grill Section
    Input Text    price-range-min    ${PriceLowerLimit}
    Input Text    price-range-max    ${PriceUpperLimit}
    Click Element    xpath=//*[@id="cena"]/div/div/div[1]/form/fieldset/div/button/span
    Wait Until Page Contains    Grily od ${PriceLowerLimit} do ${PriceUpperLimit} €
    Add Item Tefal GC305012 To The Shopping Baket And Return To Grill Section
    Add Item Orava Orava EG-1900 To The Shopping Baket And Return To Grill Section
    Add Item Eta Vital 1162 90000 To The Shopping Baket And Return To Grill Section
    Click Element    xpath=//*[@id="rootHead"]/ul/li[3]/a
    Wait Until Page Contains    Košík
    ${Count}    Get Element Count    /a[@=href="class="c-cart-confirm__button--continue c-offscreen__close e-link"]
    Should Be Equal As Integers    ${Count}    3
