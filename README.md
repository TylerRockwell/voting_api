# Voting API

## What it does

This program will allow voters to cast votes on candidates. Voters with be validated
via token authentication. All voter, vote, and candidate information will be
available in API form. Data output will be JSON.

## How it does this

This program utilizes the power of Rails to create data models, allow persistence
via a sqlite3 database, and validate users. All development is completed using
TDD.

## ERD
[Can be found here](https://www.lucidchart.com/documents/view/24d3f730-374c-41ba-83d0-1ff3168ee9e5)

## Known Issues
* Currently, only the framework and db association is in place.
