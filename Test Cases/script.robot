*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resource.robot
Suite Setup    Login
Suite Teardown    Close All Browsers
Test Template    L'utilisateur est informé lorsque les produits avec les noms invalides ne sont pas disponibles

*** Variables ***
${val_messageNoAvailable}    There is no product that matches the search criteria.

*** Test Cases ***
produit invalide 1    samsungwww
produit invalide 2    888
produit invalide 3    iPodgfdsa

*** Keywords ***
L'utilisateur est informé lorsque les produits avec les noms invalides ne sont pas disponibles
    [Arguments]    ${val_search_Invalide}
    [Documentation]    Test case pour verifier que l'utilisateur est informé lorsque le produit avec le nom invalide n'est pas disponible
    Saisir le produit avec le nom invalide sur le champ de recherche    ${val_search_Invalide}
    Cliquer sur le bouton recherche
    Critère de succès: le message d'indisponibilité s'affiche    ${val_messageNoAvailable}