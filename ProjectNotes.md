# Project Notes

##### Error on api generation

Bundler error on rails api generation:

Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
extconf failed, exit code 1

An error occurred while installing pg (1.2.3), and Bundler cannot
continue.
Make sure that `gem install pg -v '1.2.3' --source 'https://rubygems.org/'`
succeeds before bundling.
In Gemfile:
  pg
         run  bundle binstubs bundler
Could not find gem 'pg (~> 1.1)' in rubygems repository https://rubygems.org/ or
installed locally.
The source does not contain any versions of 'pg'

**RESOLVE:**
1. brew install postgresql
2. removed versioning from pg gem in Gemfile
3. ran $ gem install pg -v '1.2.3' --source 'https://rubygems.org/' in terminal
4. ran $ bundle binstubs bundler
5. ran to confirm all dependencies:  $ bundle install
Everything worked :)

--------------------------------

## Set up git repository
* set up github repository: https://github.com/rosh-agahi/studyshare_backend.git

* in terminal, cd into folder and run
  * $ git init
  * $ git add .
  * $ git commit -m "initial commit rails api"

* add remote connection to github repository
  * $ git remote add origin https://github.com/rosh-agahi/studyshare_backend.git
  * $ git branch -M main
  * $ git push -u origin main

--------------
### branch for each of the models and features

#### **$ git co -b user_model**
rails g model User  
removed timestamps from migration
added username string to migration

#### **$ git checkout -b subject_model**
rails g model Subject  
removed timestamps from migration
added name string to migration

#### **$ git checkout -b flashcard_model**
rails g model Flashcard  
removed timestamps from migration

added to migration
t.string :term  
t.string :definition
t.integer :user_id
t.integer :subject_id

uncomment associations in user and subject models

-------------------------------------------------

## ActiveRecord Connection not established
**RESOLVE**
uninstalled pg and postgresql, then reinstalled. it worked:

in the studyshare_backend directory, in my terminal I ran the following:
* $ gem uninstall pg
* $ brew uninstall postgresql
* $ brew install postgresql
* $ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
* $ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
* $ gem install pg -- --with-pg-config=/usr/local/bin/pg_config

then I ran ```rails db:create``` and ```rails db:migrate``` and my migrations were successfully initiated.

checked associations. we're good.
-------------------------------------------------
## Routes, controllers and serializers

Namespacing our routes because our frontend application might be hosted on a specific domain. will want all of our backend routes to be namespaced to indicate they are routes associated with the API.

also for versioning (v1)

**/config/routes.rb**
```
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subjects, only: [:index]
    end
  end
end
```

generate SubjectsController
```
rails g controller api/v1/SubjectsController
```

define index method

```
def index
  subjects = Subject.all
  render json: subjects
end
```

when dealing with views, you need instance variables for the erb
but when it's json, you're rendering it directly, so this is easier than dealing with views.

define create method & added it to the routes file

generate FlashcardsController & populate with index and create

-----------------------------

gem 'fast_jsonapi'

```
rails g serializer Subject
rails g serializer Flashcard
```
we don't need serializers for the javascript project but we want one... because?
gives us a top level "data" object where the array is stored in the type.
add the attributes to the serializer file. 

need to update the controllers to use the serializers.
