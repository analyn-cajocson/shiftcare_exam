# ShiftCare Technical Challenge

## Getting Started
### Prerequisites
```
ruby 3.2.2
```
### Installation
1. Clone the repo
```bash
~ git clone git@github.com:analyn-cajocson/shiftcare_exam.git
```

2. Go to the Project directory
```bash
~ cd shiftcare_exam
```

### Usage
**Run the test**
```bash
~ bundle install
~ bundle exec rspec
```

<details>

<summary>Option 1: Using the gem</summary>

1. Install this gem:
```bash
~ gem install ./shiftcare_exam-1.0.0.gem 
```

2. Use Interactive Ruby:
```bash
~ irb
```

**#search**
```ruby
~ require "shiftcare_exam"
 
~ client = Client.new
~ client.search("John Doe")  #this will use the default search field full_name
```
You can also specify the search field:
```ruby
~ require "shiftcare_exam"

~ client = Client.new
~ client.search("john.doe@gmail.com", "email")
```

**#check_duplicates**
```ruby
~ require "shiftcare_exam"

~ client = Client.new
~ client.check_duplicates
```

**Using other JSON file**
```ruby
~ require "shiftcare_exam"
~ require "json"

~ json_file_path = File.expand_path("~/path/to/your/file.json")
~ client = Client.new(json_file_path)
```
</details>

<details>

<summary>Option 2: Using the command line</summary>

**#search**
```bash
~ bin/client_search -v "John Doe"  #this will use the default search field full_name
```
You can also specify the search field:
```bash
~ bin/client_search -v "john.doe@gmail.com" -f "email"
```

**#check_duplicates**
```bash
~ bin/client_duplicates
```

**Using other JSON file**

Use the -j options in running the command
```bash
~ bin/client_search -v "john.doe@gmail.com" -f "email" -j ~/path/to/your/file.json

~ bin/client_duplicates  -j ~/path/to/your/file.json
```
</details>
