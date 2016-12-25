# Tournament Results

Tournament Results is a SQL project that the student completes to pass 10 different tests written by Udacity in the tournament_test.py file to simiulate the results of a Swiss-system tournament.

## How to Run
1. Install [Vagrant](https://www.vagrantup.com/) and [Virtual Box](https://www.virtualbox.org/).
2. Clone the [tournament-results](https://github.com/unusualkid/tournament-results.git) repo.
3. Initialize the Vagrant VM by navigating into the vagrant directory and typing in command line `vagrant up`.
4. Launch the Vagrant VM by typing in `vagrant ssh`.
5. Navigate into the tournament directory by typing in `cd /vagrant/tournament`.
6. Initialize PostgresQL environment by typing `psql`.
7. Initialize database `tournament` by typing `\i tournament.sql`.
8. To run the tests provided by Udacity, simply open a new command line window and navigate to the tournament directory by repeating steps 4 and 5. Then type in `python tournament_test.py`.
9. Voila! See all the passed tests!

## How to Query Database
In the Vagrant VM environment, type `psql` to enter the PostgresQL environment
- Type `\c tournament` to connect to the `tournament` database.
- Type `\i tournament.sql` to reinitialize database and all objects within.
- When connected to the tournament database, type `\d` to see all the schema.

### Author
* Kenneth Chen

This project is part of the [Udacity Full Stack Program](https://classroom.udacity.com/nanodegrees/nd004/syllabus)
