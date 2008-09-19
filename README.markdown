## Prerequisites
#
TinyMCE relies on aspell , so apt-get install aspell, or do whatever it takes on your platform to have that dependency installed.

## Getting Started

Start the server

	$ script/server

and go to http://localhost:3000/. 

To sign in as the pre-configured admin user, (unless you've changed it) use

		name: admin
		password: admin

You should change the admin user name and password after you log in.

## Deploy

Before you deploy to production, be sure to replace example values such as http://www.mydomain.com/ with your site information in the file:

	config/config.yml
	
For full security, change the REST\_AUTH\_SITE\_KEY in 

	config/initializers/site_keys.rb

## Running RSpec

RSpec is a framework for creating specifications and testing a Rails web application. 

You can run RSpec "stories" to see the specifications for the application's behavior. You can run RSpec "examples" to verify the application is behaving as intended at the object level.

You must prepare the test database before running RSpec:

	$ rake db:test:prepare
	
which takes a schema dump from the development database and uses it to create a test database. (If you're modifying the app, you'll need to do that after every migration.)

Be sure that you've prepared the app to send email:

* set your gmail login and password in config/config.yml
* or modify config/initializers/mail.rb
	
or you will get many failures when you run RSpec.

To see the RSpec stories:

	$ ruby stories/all.rb

To run the RSpec examples:

	$ rake spec

When you run RSpec stories or examples, real email messages are sent. You may get "mail undelivered" bounce messages unless you change email addresses throughout the RSpec code. Search and replace for "rspectest.com" if the bounce messages irritate you.
