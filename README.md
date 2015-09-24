# Voting API

## What it does

This program contains a database with candidate, voter, and vote information.
Users can cast votes (one vote per user), delete their vote, and update their information.
Users can also view the current election standings. All data is output in JSON for easy
integration into other software.

## How it does this

This program utilizes the power of Rails to create data models, allow persistence
via a sqlite3 database, and validate users. All development is completed using
TDD.

## ERD
[Can be found here](https://www.lucidchart.com/documents/view/24d3f730-374c-41ba-83d0-1ff3168ee9e5)

## Known Issues
* Authentication is easily defeated
* Access keys are stored in plain text
* Access keys are passed as parameters
* Posting data requires curl/postman (or similar software)
