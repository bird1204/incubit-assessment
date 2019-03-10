## Intro

> this project is made by Wei-Yi, Chiu only for incubit recruitment assessment.

## Getting Started

1. Pull project to `my_dir` then Change directory to `myapp`

        $ cd mydir
2. Install dependencies.

        $ bundle install
3. Migrate database

        $ rails db:migrate
4. start the web server.

        $ cd my_dir && rails s
4. open browser with [url](http://lvh.me:3000) and have a look.

## Additional gem I use
* For development
  * letter_opener
  * guard
  * guard-livereload
  * rack-livereload, 
* For front-end
  * slim-rails
  * bootstrap
  * jquery-rails
* For password encode
  * bcrypt-ruby


## Testing
> All testing focus on model / integration test

1. At command promt

        $ rails test
        

## Time Cost
All task takes me almost `4 hours`. Ideally, I want to finish this in 3 hours, but it takes too much time in ActiveSupport::TestCase, owning to I used to use Rspec


here is my acitive deitribution
* MVC development: `2 hours`
* test case development: `2 hours`


