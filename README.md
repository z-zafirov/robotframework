<div id="top"></div>

## Project

### Description
This is a sample Robotframework project built with educational purpose. It automates the process of entering multiple users data into a processing web interface where then a PDF file is generated and downloaded as a result.
Except the mentioned PDF, another outcome are some screenshots of the web interface.

### Steps
that are being executed of the robot are:
* download a source excel file
* go to the demo web site [robotsparebinindustries.com](https://robotsparebinindustries.com/#/)
* login with the credentials user: "_maria_" and password: "_thoushallnotpass_"
* enter the xlsx data in the related web inputs
* take a screenshot
* generate table data and write it into a PDF file

### Structure

here it is shown only a basic one and it is consisted of:
* data - contains the input data
* |_ SalesData.xlsx - excel source file with users data to be entered
* output folder - contains the image and PDF generated during the robot's run
* ReadExcel.py - contains a dedicated Python module to read teh excel file
* tasks.robot - contains the robot 'keywords' and 'tasks'


<p align="right">(<a href="#top">back to top</a>)</p>