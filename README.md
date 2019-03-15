# README

## About

This is a StackOverflow-clone originally developed in Flask as a Codecool team project. It has been rewritten entirely in Rails as an individual project.

## Installation

To run the application, first install its dependencies by running ```bundle install```.

Next, run the database migrations with ```rake db:migrate```, and seed the database with the sample data by running ```rake db:seed```.

Finally, start the server in development mode with ```rails server -e development```.

To run the tests, type ```rspec```. Make sure to have the latest [geckodriver](https://github.com/mozilla/geckodriver) installed in order to execute tests using Selenium.

## Features implemented

* You can add and view questions.
* You can post answers to questions.
* You can view users and their questions and answers.
* Registration and login is implemented with sessions.
* You can upvote or downvote both questions and answers (if you are logged in).

## Features missing

* Currently you cannot edit questions, answers or user data.
* Up and down votes are being persisted, but they are not counted and shown in the view.
* Search is not implemented.

## Known issues

* Unit tests are missing.
* The views are not responsive and mobile-friendly.
* Due to the fact that most of the css, javascript and the templates have been copied over from the old project without serious modifications, the frontend code contains severe architectural flaws and enough spaghetti code to feed a family of four for a week. 
