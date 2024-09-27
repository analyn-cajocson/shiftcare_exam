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

## Run the application
### Using the GEM
Install this gem:
```
gem install ./shiftcare_exam-1.0.0.gem 

```

Use Interactive Ruby:
```
irb

```

### #search
```
require "shiftcare_exam"
 
client = Client.new
client.search("John Doe")  #this will use the default search field full_name
```
You can also specify the search field:
```
require "shiftcare_exam"

client = Client.new
client.search("john.doe@gmail.com", "email")
```

### #check_duplicates
```
require "shiftcare_exam"

client = Client.new
client.check_duplicates
```

### Using other JSON file
```
require "shiftcare_exam"
require "json"

json_file_path = File.expand_path("~/path/to/your/file.json")
client = Client.new(json_file_path)

```
# Using the command line
### --help
Check the available options
```
bin/client_search -h
```

### #search
```
bin/client_search -v "John Doe"  #this will use the default search field full_name
```
You can also specify the search field:
```
bin/client_search -v "john.doe@gmail.com" -f "email"
```

### #check_duplicates
```
bin/client_duplicates
```

### Using other JSON file
Use the -j options in running the command
```
bin/client_search -v "john.doe@gmail.com" -f "email" -j ~/Downloads/new_clients.json

bin/client_duplicates  -j ~/Downloads/new_clients.json
```
