*** Settings ***
Library           Process
Library           Collections
Library           SeleniumLibrary

*** Variables ***
${testURL}        ${EMPTY}

*** Keywords ***
load_the_URL_path
    [Documentation]    Navigate: Go to https://www.britinsurance.com/
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --log-level\=3
    Call Method    ${chrome_options}    add_argument    --start-maximized
    #Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go to    ${testURL}
    Maximize Browser Window
    Wait Until Page Contains    Brit Insurance    5s

I have navigated brits insurance screen
    Load the URL path
    Page Should Contain Button    //button[@type='button']
    Page Should Contain Button    class:header--toggle
    Page should contain link    class:link-overlay

I navigated to contact page
    Sleep    5s
    Click Element    class:header--toggle
    Wait Until Element Is Enabled    //a[@href='/contact' and contains(text(),'contact')]    5s
    Execute JavaScript    window.document.evaluate("//a[@href='/contact' and contains(text(),'contact')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true)
    Wait Until Keyword Succeeds    5    5    Click Element    //a[@href='/contact' and contains(text(),'contact')]
    Wait Until Page Contains    Bermuda Office    5s

I extract the Bermuda office address from the Bermuda office section
    Wait Until Page Contains    Contact us    5s
    Execute JavaScript    window.document.evaluate("//p[@class='location__city' and contains(text(),'Pembroke')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true)
    ${print address}    Get Text    //p[@class='location__city' and contains(text(),'Pembroke')]/../address
    Log to console    ${print address}
    Set Test Variable    ${print address}

I see the address
    Log    ${print address}
    Should Be Equal As strings    ${print address}    Ground Floor, Chesney House\nThe Waterfront, 96 Pitts Bay Road,\nPembroke, Hamilton HM 08, Bermuda

I search for term <IFRS 17> in the search bar
    Sleep    5s
    Wait Until Element Is Enabled    //button[@type='button']    5s
    Click Element    //button[@type='button']
    Wait Until Element Is Enabled    //input[@type='search']    5s
    Wait Until Keyword Succeeds    3    5    Click Element    //input[@type='search']
    Clear Element Text    //input[@type='search']
    Input text    //input[@type='search']    IFRS 17
    Press Keys    //input[@type='search']    ENTER

I see three results with titles
    [Documentation]    ASSERT: Assert on the three result returned, confirm three results and assert on each results
    ...    title.
    ...
    ...    EXAMPLE: For example “Interim results for the six months ended 30 June 2022” etc.
    Wait Until Page Contains    results
    Capture Page Screenshot
    Page Should Contain    Interim results for the six months ended 30 June 2022
    Page Should Contain    Gavin Wilkinson
    Page Should Contain    John King
