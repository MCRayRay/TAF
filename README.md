# [Test Automation Framework (TAF)](https://github.com/Aperrett/TAF)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT) [![Gem Version](https://badge.fury.io/rb/taf.svg)](https://badge.fury.io/rb/taf)

This is the Test Automation Framework (TAF)

Created in Ruby and using Watir to allow a user to Automate a website using an Excel file type.

Please see the Wiki for more details: https://github.com/Aperrett/TAF/wiki


<h2>TAF script help </h2>
To use the TAF Script, Navigate to the Code/ Folder.
Run the following script: 
./taf.sh help

<h2>Security Audit of Ruby Gems used </h2>
Run the following script: 
./taf.sh security_audit

<h1>TAF Builder</h1>

<h2>To build the TAF Docker image</h2>
Run the following script: 
./taf.sh build_taf_image

<h2>To build the TAF Ruby Gem</h2>
Run the following script: 
./taf.sh build_taf_gem {internal} or {external} {version} (i.e. 0.1.2)

<h1>TAF Runner - Docker</h1>
<h3>To run the TAF in Docker Container</h3>
Run following script in terminal:

docker run --rm --shm-size 2g

--env URL="http://url_blah.com"

--env USER="emailblah.com"

-v "$(pwd)"/target:/app/Results:cached taf taf {filename} [{browser}] - note: (browser is optional)


Please note the --env will need to be changed.

<h1>TAF Runner - Native</h1>
<h3>Pre-Requirements</h3>
Ruby 2.5.1 has to be installed on the system.

run bundle install - to install the required gems including the TAF Gem

<h2>To run a Test Suite using the TAF Gem:</h2>
taf {filename} [{browser}] - note: (browser is optional)

<h2>To run a Test Suite using the TAF Script:</h2>
./taf.sh run {filename} [{browser}] - note: (browser is optional)

<h2>Contributing</h2>

If you would like to get involved in supporting this project going forward please get in touch.

<h2>Author</h2>

Andy Perrett

https://github.com/Aperrett


<h2>Copyright and License</h2>

Copyright 2017 - 2019 Aperrett

Code released under the MIT License.
