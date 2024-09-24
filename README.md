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

## Available Commands
### #search
Open first the `lib/client.rb` file and put this code at the end of the file:
```
client = Client.new #this will use the default client.js file
result = client.search("John Doe")  #this will use the default search field full_name
```
You can also specify the search field
```
client = Client.new #this will use the default client.js file
result = client.search("john.doe@gmail.com", "email")
```

Save the file then run:
```
ruby lib/client.rb
```

### #check_duplicates
Open first the `lib/client.rb` file and put this code at the end of the file:
```
client = Client.new #this will use the default client.js file
result = client.check_duplicates
```
Save the file then run:
```
ruby lib/client.rb
