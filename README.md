### Requirements

* Ruby 2.5.1
* Rails 5.2.0

### System dependencies

### Configuration

  ```sh
    $ cp .ruby-version.template .ruby-version
    $ cp .ruby-gemset.template .ruby-gemset
    $ gem install bundler
    $ bundle install
  ```

### Database initialization
  ```sh
    $ cp databse.yml.template database.yml
  ```

### Database creation
  ```sh
    $ bundle exec rails db:setup
  ```

### How to run tests
  ```sh
    bundle exec rspec spec
  ```

