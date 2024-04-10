*** Keywords ***
Search Wikipedia
    [Arguments]  ${text}
    Input Text  class:cdx-text-input__input  ${text}
    Click Button  class:cdx-button.cdx-search-input__end-button

*** Variables ***
${wikipedia_login}  RobotTests
${wikipedia_password}  RobotFramework