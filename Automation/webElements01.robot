# POBIERANIE WEBELEMENTS
# DYNAMICZNE LOKALIZOWANIE ELEMENTOW NA STRONIE

*** Settings ***
Library  SeleniumLibrary
Library  Collections
Test Teardown  Close Browser
Resource  ../my_keywords/empik_keywords.robot
Resource  ../my_variables/empik_variables.robot

*** Test Cases ***
Empik Test Case
    Open Empik Bestseller

    @{empikbestsellers_text}  Create List
    ${empikbestsellers_list}  Get Webelements  class:ta-product-title
    Log List  ${empikbestsellers_list}

    FOR  ${element}  IN  @{empikbestsellers_list}
        Append To List  ${empikbestsellers_text}  ${element.text}
    END

    Log List  ${empikbestsellers_text}

    List Should Contain Value  ${empikbestsellers_text}  10 Venom
    #Click Element  xpath:(//*[@class='search-list-item-hover'])[5]/a

    Enter Element  10 Venom

#    # dynamiczne wyszukanie elementu na stronie - zamienione na metode Enter Element
#    ${index}  Set Variable  1
#    FOR  ${element}  IN  @{empikbestsellers_list}
#        Exit For Loop If  '${element.text}' == '10 Venom'
#        ${index}  Evaluate  ${index} + 1
#    END
#    Click Element  xpath:(//*[@class='search-list-item-hover'])[${index}]/a
