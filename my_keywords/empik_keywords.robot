*** Keywords ***
Open Empik Bestseller
    Open Browser  ${empikbestsellers_url}  Chrome  executable_path=c:/chromedriver/chromedriver.exe
    Click Button  xpath://div[@class='css-vtjrpu-buttonsMobile-buttonsMobile']//button[@type='button'][normalize-space()='Zaakceptuj zgody']

Enter Element
    [Arguments]  ${book}
    ${index}  Set Variable  1
    ${empikbestsellers_list}  Get Webelements  class:ta-product-title
    FOR  ${element}  IN  @{empikbestsellers_list}
        Exit For Loop If  '${element.text}' == '10 Venom'
        ${index}  Evaluate  ${index} + 1
    END
    Click Element  xpath:(//*[@class='search-list-item-hover'])[${index}]/a

RETURN_FIRST_ELEMENT
    [Arguments]  ${my_id}  ${my_separator}
    ${elements}  Get Text  id:${my_id}
    @{elements_list}  Split String  ${elements}  ${my_separator}
    ${first}  Get From List  ${elements_list}  0
    [Return]  ${first}