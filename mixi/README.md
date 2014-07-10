# Mixi auto posting script.
## Spec
* login mixi by user(specify config/user.yml)
* post comment with image specific community topics.
must be _.jpeg_ not _.jpg_
* when topics filled with comment, create new topics(not yet!)

## initialize
```ruby
$ sudo yum install sqlite-devel
$ bundle install
$ bundle exec rake db:migrate
$ vim config/user.yml
```
