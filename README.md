This test is composed on python3 with robotframework and selenium package and BDD (Beheviour Driven Development)

E2E tests:

	Scenario 1
	Scenario 2

How to run this test:

	Install Python3 from: https://www.python.org/downloads/windows/

Install all Robot Framework packages:

	-- Go to project Floder --
		$ cd Britsproject
		$ pip3 install -r requirements.txt


To run the project:

	-- Open cmd command --
		$ cd Britsproject
		$ robot -v testURL:https://www.britinsurance.com/ britinsurance.robot

To view the logs:

	$ cd Britsproject
		Open: log.html
		Open: output.xml
		Open report.html


NOTES:
	I have left the hoption to run with visuality.
	If you want to run the test *headless*
	Go to common folder > load_the_URL_path
	and remove the # from the --headless line
