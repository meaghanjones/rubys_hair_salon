and delete stylists and also add, edit and delete clients specific to each stylist.


## Technologies used
  - Application: Ruby
  - Database: postgres

## Support and contact details

Contact me at meaghan.m.jones@gmail.com if you have any questions.

## Installation

You can install Ruby's Hair Salon by cloning the repository from github and installing the gems:

```sh
$ git clone https://github.com/meaghanjones/rubys_hair_salon.git
```
```sh
$ cd rubys_hair_salon
$ bundle
```

To set up the data base run postgres and in psql enter the following commands:

CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

In order to view the application you can launch Sinatra by entering in
```ruby
ruby app.rb
```
in the terminal and then navigating to [http://localhost:4567/]

## Known Bugs
No known bugs at this time

License
----

MIT
