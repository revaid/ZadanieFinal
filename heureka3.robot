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
    Input Text    price-range-min    ${PriceLowerLimit}
    Input Text    price-range-max    ${PriceUpperLimit}
    Click Element    xpath=//*[@id="cena"]/div/div/div[1]/form/fieldset/div/button/span
    Wait Until Page Contains    Grily od ${PriceLowerLimit} do ${PriceUpperLimit} €
    Click Element    xpath=//h3/a[@href="https://grily.heureka.sk/tefal-gc305012/"]
    Wait Until Page Contains    Tefal GC305012
    Click Element    xpath=//button[@class='c-top-offer__cart-button e-button e-button--highlight']
    Sleep    2 s
    Click Element    xpath=//button[@class='c-cart-confirm__button--continue c-offscreen__close e-link']
    Wait Until Page Contains    Tefal GC305012
    Click Element    xpath=//a[@class='c-breadcrumbs__link'][normalize-space()='Grily']

Add Item Orava Orava EG-1900 To The Shopping Baket And Return To Grill Section
    Input Text    price-range-min    ${PriceLowerLimit}
    Input Text    price-range-max    ${PriceUpperLimit}
    Click Element    xpath=//*[@id="cena"]/div/div/div[1]/form/fieldset/div/button/span
    Wait Until Page Contains    Grily od ${PriceLowerLimit} do ${PriceUpperLimit} €
    Click Element    xpath=//a[@class='c-product__link'][normalize-space()='Orava EG-1900']
    Wait Until Page Contains    Orava EG-1900
    Click Element    xpath=//span[@class='c-top-offer__buy-text']
    Wait Until Page Contains    Tovar sme pridali do košíka
    Sleep    2 s
    Click Element    xpath=//button[@class='c-cart-confirm__button--continue c-offscreen__close e-link']
    Wait Until Page Contains    Orava EG-1900
    Click Element    xpath=//a[@class='c-breadcrumbs__link'][normalize-space()='Grily']

Add Item Eta Vital 1162 90000 To The Shopping Baket And Return To Grill Section
    Input Text    price-range-min    ${PriceLowerLimit}
    Input Text    price-range-max    ${PriceUpperLimit}
    Click Element    xpath=//*[@id="cena"]/div/div/div[1]/form/fieldset/div/button/span
    Wait Until Page Contains    Grily od ${PriceLowerLimit} do ${PriceUpperLimit} €
    Click Element    xpath=//a[@class='c-product__link'][normalize-space()='Eta Vital 1162 90000']
    Wait Until Page Contains    Eta Vital 1162 90000
    Click Element    xpath=//span[@class='c-top-offer__buy-text']
    Wait Until Page Contains    Tovar sme pridali do košíka
    Sleep    2 s
    Click Element    xpath=//button[@class='c-cart-confirm__button--continue c-offscreen__close e-link']
    Wait Until Page Contains    Eta Vital 1162 90000
    Click Element    xpath=//a[@class='c-breadcrumbs__link'][normalize-space()='Grily']

Delete One Product

    Click Element    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/a
    Wait Until Page Contains    Naozaj chcete tento produkt odstrániť z košíka?
    Click Element    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/section/div/footer/a

Verify Empty Basket
    Wait Until Page Contains    Váš košík zíva prázdnotou
    ${price}    Get Text    //*[@id="rootHead"]/ul/li[3]/a
    Should Be Equal    ${price}    0,00 €


*** Test Cases ***
Buy A Grill
    Open Heureka Landing Page
    Navigate To Grill Section
    Add Item Tefal GC305012 To The Shopping Baket And Return To Grill Section
    Add Item Orava Orava EG-1900 To The Shopping Baket And Return To Grill Section
    Add Item Eta Vital 1162 90000 To The Shopping Baket And Return To Grill Section
    Click Element    xpath=//*[@id="rootHead"]/ul/li[3]/a
    Wait Until Page Contains    Košík
    ${Count}    Get Element Count    xpath=//*[@id="snippet--cart-content-data"]//div[contains(@class, 'step1__product-card')]
    Should Be Equal As Integers    ${Count}    3
    Wait Until Page Contains    Košík
    Delete One Product
    Wait Until Page Contains    Košík
    Page Should Not Contain    Tefal GC305012
    Delete One Product
    Wait Until Page Contains    Košík
    Delete One Product
    Verify Empty Basket
