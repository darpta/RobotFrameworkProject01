*** Settings ***
Library  RequestsLibrary

*** Variables ***
${url}  https://simple-books-api.glitch.me
# token valid 7 days
${AUTH_BEARER}  c11d95ed12e73a67b8cee2b4e711623badbb178ca4c8e8ec90c80163e4f2f4cd
${createdBy1}  1b274d0f54432bdd9fd470d04f569e4b7f3873f2932f03d2e5f1bf8fff2bcec8


*** Test Cases ***
API_TEST
    ${headers}  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${AUTH_BEARER}

    ${GET_response}  GET  ${url}/status
    Status Should Be  200  ${GET_response}

    ${GET1_response}  GET  ${url}/orders  headers=${headers}
    # logujemy body do consoli
    #Log To Console  ${GET1_response.json()}[0][id]
    Log To Console  ${GET1_response.json()}
    Should Be Equal As Strings  ${createdBy1}  ${GET1_response.json()}[0][createdBy]
    Should Be Equal As Strings  ${createdBy1}  ${GET1_response.json()}[1][createdBy]
    Should Be Equal As Integers  5  ${GET1_response.json()}[0][bookId]
    Should Be Equal As Strings  5  ${GET1_response.json()}[1][bookId]
