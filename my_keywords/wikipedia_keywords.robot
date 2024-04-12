*** Keywords ***
Search Wikipedia
    [Arguments]  ${text}
    Input Text  class:cdx-text-input__input  ${text}
    Click Button  class:cdx-button.cdx-search-input__end-button

Open Wikipedia
    Open Browser  https://pl.wikipedia.org  Chrome  executable_path=c:/chromedriver/chromedriver.exe

Log In Wikipedia
    [Arguments]  ${login}  ${password}
    Click Element  id:pt-login-2
    ${my_value}=  Get Text  id:wpName1
    Should Be Empty   ${my_value}
    Checkbox Should Not Be Selected  name:wpRemember
    Input Text  id:wpName1  ${login}
    Input Password  id:wpPassword1  ${password}
    Select Checkbox  name:wpRemember
    Click Button  id:wpLoginAttempt

Incorrect Log In Wikipedia
    [Documentation]  Check the error message - incorrect password
    [Arguments]  ${login}
    Click Element  id:pt-login-2
    ${my_value}=  Get Text  id:wpName1
    Should Be Empty   ${my_value}
    Checkbox Should Not Be Selected  name:wpRemember
    Input Text  id:wpName1  ${login}
    Input Password  id:wpPassword1  123123
    Select Checkbox  name:wpRemember
    Click Button  id:wpLoginAttempt
    Wait Until Element Is Visible  class:cdx-message__content  timeout=7
    ${my_error_message}  Get Text  class:cdx-message__content
    Should Be Equal As Strings  ${my_error_message}  ${error_message}