# README

A React front end with a Rails backend serving up assets through webpacker for the state of california CWDS project.

## System
Ruby version: `2.3.1`

Rails version: `5.0.1`

## Configuration
Make sure homebrew is up to date and xcode is installed.
`Brew update`

Make sure XCode is installed.
`xcode-select --install`

## initialization

run the command:
`npm run dev-build`

from the root folder. This will perform the following actions:
 - `bundle install`
 - `yarn install packages`
 - `compiles webpack assets`
 - `starts assets`
 - `starts rails server`

The App is running on
`localhost:5000`.

to view the facilities demo webapp, go to
`localhost:5000/facilities` .

assets compiled via webpack live on:
`localhost:8080`

## REDIS
NOTE: it is also important to also have redis server running. Start server with 
`redis-server`

if redis is not installed, enter the following command from terminal:
`brew install redis `

this command will install all necessary redis files. 


## Testing

to run linting on the project:

`npm run lint`

### run all tests instructions
to run all tests and output code coverage:

`npm run all-tests`

### Karma tests instructions
To run the karma tests, from the root folder run:
`npm run karma`

this command will run the automated tests and open a browser with the results.

### Rspec tests instructions
 rspec tests live in the root spec/ folder. you can run all tests with either of the following commands

 `npm run spec`
 `rspec spec`


## Deployment
see docker wiki
