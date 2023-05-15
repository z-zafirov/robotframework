*** Settings ***
Documentation  API Testing in Robot Framework
Library   SeleniumLibrary
Library   RequestsLibrary
Library   JSONLibrary
Library   Collections
Resource  ../keywords/api_calls.robot


*** Test Cases ***
Do a GET Request and validate the response code and response body
    [tags]  API
    # Execute the request and assign the response value to a variable
    ${response}=    GET from posts

    # Verify the response code is 200
    Status Should Be  200  ${response}

    # Verify the first record title
    ${title}=  Get Value From Json  ${response.json()}[0]  title
    ${titleFromList}=  Get From List   ${title}  0
    Should be equal  ${titleFromList}  sunt aut facere repellat provident occaecati excepturi optio reprehenderit

Do a POST Request and validate the response code, response body, and response headers
    [tags]  API
    # Execute the request and assign the response value to a variable
    ${response}=    POST to posts 

    # Verify the response code is 201
    Status Should Be  201  ${response}

    #Check id as 101 from Response Body
    ${userId}=  Get Value From Json  ${response.json()}  userId
    ${idFromList}=  Get From List   ${userId}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  11

    # Verify the new record title
    ${title}=  Get Value From Json  ${response.json()}  title
    ${titleFromList}=  Get From List   ${title}  0
    Should be equal  ${titleFromList}  Test Title here