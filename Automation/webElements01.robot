*** Settings ***
Library  SeleniumLibrary
Library  Collections
Test Teardown  Close Browser
Resource  resource.robot

*** Variables ***
${empikbestsellers_url}  https://www.empik.com/bestsellery

*** Keywords ***
Open Empik Bestseller
    Open Browser  ${empikbestsellers_url}  Chrome  executable_path=c:/chromedriver/chromedriver.exe
    Click Button  xpath://div[@class='css-vtjrpu-buttonsMobile-buttonsMobile']//button[@type='button'][normalize-space()='Zaakceptuj zgody']

*** Test Cases ***
Empik Test Case
    Open Empik Bestseller

    ${empikbestsellers_list}  Get Webelements  class:ta-product-title
    Log List  ${empikbestsellers_list}

    FOR  ${element}  IN  @{empikbestsellers_list}
        log  ${element.text}
    END
