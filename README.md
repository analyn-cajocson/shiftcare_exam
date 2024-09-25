# ShiftCare Technical Challenge

## Pre-requisite
```
ruby 3.2.2
```
## How to setup this project
### Clone this repo
```
git@github.com:analyn-cajocson/shiftcare_exam.git
```

### Go to the Project directory
```
cd shiftcare_exam
```

## Run the test
```
bundle exec rspec
```

## Available Commands
### #search
Open the `lib/client.rb` file and add this code at the end of the file:
```
client = Client.new #this will use the default clients.json file
result = client.search("John Doe")  #this will use the default search field full_name
```
You can also specify the search field:
```
client = Client.new #this will use the default clients.json file
result = client.search("john.doe@gmail.com", "email")
```

Save your changes, then run the following command in the terminal:
```
ruby lib/client.rb
```

### #check_duplicates
Open the `lib/client.rb` file and add this code at the end of the file:
```
client = Client.new #this will use the default clients.json file
result = client.check_duplicates
```
Save your changes, then run the following command in the terminal:
```
ruby lib/client.rb
