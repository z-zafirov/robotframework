*** Settings ***
Documentation   The Keywords Robot
Library     RPA.PDF
Library     RPA.HTTP
Library     RPA.Excel.Files
Library     RPA.Browser.Selenium
Library     ../data/data.py


*** Keywords ***
Download the excel file
    Download    https://robotsparebinindustries.com/SalesData.xlsx    overwrite=True    target_file=${CURDIR}${/}..${/}data${/}SalesData.xlsx

Open a website
    Open Browser   https://robotsparebinindustries.com/    Chrome
    # Open Available Browser   https://robotsparebinindustries.com/    headless=True

Log in
    ${username}=      data.getUsername
    ${password}=      data.getPassword
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Submit Form
    Wait Until Page Contains Element    id:sales-form

Verify the username
    [Arguments]    ${username}
    Page Should Contain    ${username}  

Fill And Submit The Form For One Person
    [Arguments]    ${sales_rep}
    Input Text                   firstname      ${sales_rep}[First Name]
    Input Text                   lastname       ${sales_rep}[Last Name]
    Input Text                   salesresult    ${sales_rep}[Sales]           #1st parameter is locator for id i.e. same as id:<name> shown above
    ${target_as_string}=    Convert To String   ${sales_rep}[Sales Target]    #Convert the 'Sales Target' data into string, so it can be used as such in the dropdown
    Select From List By Value    salestarget    ${target_as_string}           #2nd parameter is the 'value' element, probably there are another keywords for 'Text' and 'Index'
    Click Button                 Submit                                       #Only one parameter needed for the keyword - text of the button; there might be an option for locator too

Fill The Form Using The Data From The Excel File
    # Open the Excel file and read it
    Open Workbook    ${CURDIR}${/}..${/}data/SalesData.xlsx
    ${sales_reps}=    Read Worksheet As Table    header=True
    Close Workbook
    # Call the 'fill in' function with each record as a parameter i.e. enter data for every person in the sheet
    FOR    ${sales_rep}    IN    @{sales_reps}
        Fill And Submit The Form For One Person    ${sales_rep}
    END

Collect the results
    Screenshot    css:div.sales-summary    ${CURDIR}${/}..${/}output${/}sales_summary.png

Export The Table As A PDF
    Wait Until Page Contains Element    id:sales-results
    ${sales_results_html}=    Get Element Attribute    id:sales-results    outerHTML    # Get the HTML table data by locating the element that contains it
    Html To Pdf    ${sales_results_html}    ${CURDIR}${/}..${/}output${/}sales_results.pdf

Login with credentials
    [Arguments]    ${username}    ${password}
    Input Text        id:username    ${username}
    Input Password    id:password    ${password}
    Submit Form
    Sleep    3