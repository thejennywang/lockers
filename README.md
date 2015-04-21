# lockers

## Run tests

Go to locker_concierge folder

$ rspec

## How to run

Go to locker_concierge folder

### To start up the concierge program

$ irb
$ require './lib/all'

$ concierge = Concierge.new

### To create a bag, size is a required argument

$ bag = Bag.new("medium")

### To check a bag in, run

$ concierge.check_in(bag) 
You will receive a ticket number. Remember this number.

### To check out a checked bag with your provided TICKET_NUMBER:

$ concierge.check_out(TICKET_NUMBER)