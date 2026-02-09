# 📚 THP Gossip News – Sinatra Project

This project was built as part of The Hacking Project curriculum.
The goal is to create a small web application using Sinatra, ERB, and a simple CSV file as a database.

The application allows users to:

create a gossip

list all gossips

display a specific gossip

edit a gossip

delete a gossip

The interface is lightweight, responsive, and focused on learning MVC architecture in Ruby.

# 🚀 1. Installation


❗ Requirements
```
Ruby (version ≥ 3.0)

Bundler (gem install bundler)

Git

WSL recommended (Ubuntu)
```
🔧 Setup

Clone the repository:
```
git clone https://github.com/ToXY0392/the_gossip_project_sinatra.git
cd the_gossip_project_sinatra
```

Install the required gems:
```
bundle install
```
# ▶️ 2. Start the Server

Run the application using Webrick:
```
bundle exec rackup -p 4567 -s webrick
```

The application will be available at:

http://localhost:4567

# 🏛️ 3. Project Architecture (MVC)
```
the_gossip_project_sinatra/
├── 📁 db
│   └── 📄 gossip.csv
├── 📁 lib
│   ├── 📁 views
│   │   ├── 📄 edit.erb
│   │   ├── 📄 index.erb
│   │   ├── 📄 new_gossip.erb
│   │   └── 📄 show.erb
│   ├── 💎 controller.rb
│   └── 💎 gossip.rb
├── 📄 Gemfile
├── 📝 README.md
└── 📄 config.ru
```
# 🧠 4. Features
✔️ Home page

Displays all gossips with a button to create a new one.

✔️ Create a gossip

Form allowing users to enter:

author

content

The gossip is stored in the CSV file.

✔️ Show a gossip

Dedicated page for each gossip (dynamic URL /gossips/:id).

✔️ Edit a gossip

Pre-filled form allowing users to update an existing gossip.

✔️ Delete a gossip

Removes the selected gossip from the CSV file.

# 🧪 5. How to Test the Application

From the project root, run:

bundle exec rackup -p 4567 -s webrick


Then test:

viewing all gossips

creating a new gossip

opening a gossip page

editing a gossip

deleting a gossip

Each action directly modifies gossip.csv.

# 🛠️ 6. Technologies Used

Ruby

Sinatra

Rack

Webrick

ERB

Ruby CSV Library



# 🎯 7. Learning Objectives

This project validates the following skills:

understand the MVC architecture

build a minimal Ruby web application

work with Sinatra routes

structure clean backend logic

use a CSV file as a small database

implement a basic CRUD system

correctly version a Ruby project with Git