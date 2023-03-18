*** Settings ***
Library    SeleniumLibrary
Variables    ../page_object/locators.py

*** Variables ***
${URL}        http://tutorialsninja.com/demo/index.php?route=common/home
${BROWSER}    chrome
${TIMEOUT}    60

*** Keywords ***
Login
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${URL}    ${Browser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
Saisir le produit avec le nom invalide sur le champ de recherche    
    [Arguments]    ${val_search_Invalide}
    Input Text    ${txt_Search}    ${val_search_Invalide}
Cliquer sur le bouton recherche
    Wait Until Element Is Visible    ${btn_Search}
    Click Button    ${btn_Search}
Critère de succès: le message d'indisponibilité s'affiche
    [Arguments]    ${val_messageNoAvailable}
    Wait Until Element Is Visible    ${lbl_NoProductAvailable}
    Page Should Contain    ${val_messageNoAvailable}