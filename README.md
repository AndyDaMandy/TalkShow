# TalkShow
A social media site to talk about TV shows. This application uses the TMDB API via [themoviedb.org](https://themoviedb.org)

## Installation
You will need Ruby 3.2.2 installed and Rails 7.0.4.3 installed. In this example, we're using rbenv on Linux.

Please adjust if you're using Windows or MacOS accordingly.

I recommend using a Ruby manager such as [rbenv](https://github.com/rbenv/rbenv).

With rbenv installed you can install ruby 3.2.2 by running:

`rbenv install 3.2.2`

Once you've installed Ruby 3.2.2 you then need to install Ruby on Rails. Run the following in your ternimal:

`gem install rails`

You can check your Rails version by running the following:

`rails --version`

With these installed you can now run TalkShow locally.

## API
To use the application you will need to request an API key from Themoviedb: [developer.themoviedb.org](https://developer.themoviedb.org/docs)

I use the Figaro gem to hide secret keys, but use whichever tool you prefer and update the /app/services/tmdb_service.rb accordingly

## Bug Reporting
Please report all bugs via Pull Requests. I'll review accordingly.