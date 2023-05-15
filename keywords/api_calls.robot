*** Settings ***
Documentation  API Testing in Robot Framework
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${url}     https://jsonplaceholder.typicode.com
${page}    /posts

*** Keywords ***
GET from posts
    [documentation]  This keyword is a GET method from /posts and returns the response
    Create Session  mysession  ${url}  verify=true
    ${response}=  GET On Session  mysession  ${page}
    [Return]    ${response}


POST to posts
    [documentation]  This keyword is a POST method to /posts and returns the response
    Create Session  mysession  ${url}  verify=true
    &{body}=  Create Dictionary  userId=11    title=Test Title here  body=This is an example text to post via API call made from Robotframework
    &{header}=  Create Dictionary  Accept=application/json
    ${response}=  POST On Session  mysession  ${page}  data=${body}  headers=${header}
    [Return]    ${response}