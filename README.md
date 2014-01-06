# alchemy-oauth

OAuth 2.0 provider that integrates with [Alchemy](https://github.com/magiclabs/alchemy_cms) and provides a user's details via JSON once they logged in.

## Installation

Add the gem to your application's `Gemfile` and run `bundle` afterwards:

```ruby
gem 'alchemy-oauth'
```

Mount the engine in your main application's `config/routes.rb`:

```ruby
mount Alchemy::Oauth::Engine => '/oauth'
```

Add the doorkeeper migrations to your app:

```
bundle exec rails g dorkeeper:migrations
bundle exec rake db:migrate
```

## Usage

You should now see a new OAuth navigation item in Alchemy's admin interface. In that interface you can configure which applications may access the user's details. Once the user logged in and the client obtained a valid access_token, the user's details can be accessed at `/<oauth_mount>/user`. In the example that would be `/oauth/user`. A request will return the user's attributes as JSON:

```JSON
{
	"cached_tag_list":"",
	"created_at":"2013-11-06T11:30:19Z",
	"creator_id":null,
	"email":"mail@example.com",
	"firstname":"Firtname",
	"gender":"",
	"id":1,
	"language":"de",
	"last_request_at":"2013-12-03T15:00:46Z",
	"lastname":"Lastname",
	"login":"foobar",
	"roles":["admin"],
	"updated_at":"2013-12-03T15:00:46Z",
	"updater_id":1
}
```

**Note:** regardless of the mountpoint [doorkeeper](https://github.com/applicake/doorkeeper) will *always* prepent it's routes to the main app in the `/oauth` namespace. So even if the engine is mounted at `/api`, the relevant OAuth routes will still only be available at `/oauth`. At the moment the mountpoint changes the `/user` path only.

## Resources

* Homepage: <http://alchemy-cms.com>
* Live-Demo: <http://demo.alchemy-cms.com> (user: demo, password: demo)
* API Documentation: <http://rubydoc.info/github/magiclabs/alchemy_cms>
* Issue-Tracker: <https://github.com/magiclabs/alchemy_cms/issues>
* Sourcecode: <https://github.com/magiclabs/alchemy_cms>
* User Group: <http://groups.google.com/group/alchemy-cms>
* IRC Channel: #alchemy_cms on irc.freenode.net
* Discussion Board: <https://trello.com/alchemycms>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* BSD: <https://github.com/magiclabs/alchemy-oauth/blob/master/LICENSE>