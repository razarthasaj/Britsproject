*** Settings ***
Resource          common/keywords/keywords.robot

*** Test Cases ***
Scenario_1
    [Documentation]    *As a USER I* want to be able to confirm *three title results*
    GIVEN I have navigated brits insurance screen
    WHEN I search for term <IFRS 17> in the search bar
    THEN I see three results with titles

Scenario_2
    [Documentation]    *AS A USER I* want to *Extract the Bermuda office address*
    GIVEN I have navigated brits insurance screen
    WHEN I navigated to contact page
    AND I extract the Bermuda office address from the Bermuda office section
    THEN I see the address
