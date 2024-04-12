*** Settings ***
Library  RequestsLibrary

*** Variables ***
${url}  https://simple-books-api.glitch.me
# token valid 7 days
${AUTH_BEARER}  c11d95ed12e73a67b8cee2b4e711623badbb178ca4c8e8ec90c80163e4f2f4cd

*** Test Cases ***
API_GET_TEST1
    ${GET_response}  GET  ${url}
    Log To Console  ${get_response}

API_GET_TEST2
    ${GET_response}  GET  ${url}/books
    Log To Console  ${get_response}

API_GET_TEST3
    ${GET_response}  GET  ${url}/books/2
    Log To Console  ${get_response}

#API_POST_TOKEN
#    ${register_json}  Create Dictionary  clientName=darpta  clientEmail=darpta@example.com
#    # pobranie tokena z logow
#    ${POST_response}  POST  ${url}/api-clients  json=${register_json}

API_POST_TEST
    ${headers}  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${AUTH_BEARER}
    ${order_body}  Create Dictionary  bookId=5  customerName=darptarek

    # wyslanie zamowienia
    ${POST_order_response}  POST  ${url}/orders/  headers=${headers}  json=${order_body}

API_DELETE_TEST
    ${headers}  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${AUTH_BEARER}
    ${order_body}  Create Dictionary  bookId=5  customerName=darptarek

    ${GET_response}  GET  ${url}/status
    Status Should Be  200  ${GET_response}
    
#    # utworzenie nowego zamowienia
#    ${POST_order_response}  POST  ${url}/orders/  headers=${headers}  json=${order_body}

    ${GET1_response}  GET  ${url}/orders  headers=${headers}
    ${DELETE_response}  DELETE  ${url}/orders/2sD_bIG04BkCVNfgxNP2K  headers=${headers}
    ${GET1_response}  GET  ${url}/orders  headers=${headers}

API_PATCH_TEST
    ${headers}  Create Dictionary  Content-Type=application/json  Authorization=Bearer ${AUTH_BEARER}
    ${patch_body}  Create Dictionary  customerName=dolinaRoztoczy

    ${PATCH_response}  PATCH  ${url}/orders/0and1lmvOS855UnMe_NTc  headers=${headers}  json=${patch_body}
    ${GET1_response}  GET  ${url}/orders  headers=${headers}
