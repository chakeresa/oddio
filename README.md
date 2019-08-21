# Oddio
Oddio is an audio walking tour app built in 10 days by [Alexandra Chakeres](https://github.com/chakeresa), [Patrick Duvall](https://github.com/Patrick-Duvall), [Martin Mercer](https://github.com/m-mrcr), [Logan Pile](https://github.com/lpile), and [Mills Provosty](https://github.com/MillsProvosty).

In Oddio, visitors can explore a map populated with Denver locations stored in our database. These locations are generated from a rake task that hits the Google and TomTom APIs. Users can navigate to different points on the map and open a page with details for the landmark. They also can listen to user-uploaded audio for that location. Users can log in by making an account (or by using google OAuth) to gain the ability to upload and vote on recordings, tours, and landmarks. Admins have CRUD functionality to moderate and delete inappropriate content.

[See the deployed app here](https://oddio.herokuapp.com/)

## Built using
- Rails 5.2.x 
- Ruby 2.4.1
- Google OAuth for user authentication
- Javascript and Leaflet JS for map functionality
- PostgreSQL database
- AWS S3 bucket to store audio files
- Sinatra to host a microservice (API) that manages upvotes & downvotes

[View the Sinatra microservice's repo here](https://github.com/MillsProvosty/Votes)
- deployed at https://votes-app-1903.herokuapp.com/
- Sinatra 2.0.5
- Ruby 2.4.1

## Selected Screenshots
### Landmarks Index
![Landmarks Index Screenshot](/app/assets/images/screenshots/landmarks_index.png)
### Landmark Show Page
![Landmark Show Page Screenshot](/app/assets/images/screenshots/landmark_show.png)
### Tours Index
![Tours Index Screenshot](/app/assets/images/screenshots/tour_index.png)
### Tour Show Page
![Tour Show Page Screenshot](/app/assets/images/screenshots/tour_show.png)
### Welcome Page 
![Welcome Page Screenshot](/app/assets/images/screenshots/welcome_page.png)

## Schema
![Schema](/app/assets/images/schema.png)

## Running on your local machine
1. `$ git clone git@github.com:chakeresa/oddio.git`
1. `$ bundle`
1. `$ bundle exec figaro install` -- add your API keys to `config/application.yml`: 
```yml
TOMTOM_API_KEY: <your TomTom API key>
AWS_ACCESS_KEY: <your AWS access key>
AWS_SECRET_ACCESS_KEY: <your AWS secret access key>
AWS_BUCKET: <your AWS bucket name>
AWS_REGION: <your AWS region>
GOOGLE_CLIENT_ID: <your Google client ID>
GOOGLE_CLIENT_SECRET: <your Google client secret>
GOOGLE_INDIV_UID: <your individual Google UID>
GOOGLE_INDIV_TOKEN: <your individual Google token>
MAPBOX_API_KEY: <your Mapbox API key>
GOOGLE_PLACES_API_KEY: <your Google Places API key>
VOTES_API_KEY: <your API key for the Sinatra Votes app>
```
1. `$ rails db:{create,migrate}`
1. `$ rake landmarks:all`
1. `$ rails db:seed`
1. Run the test suite with `$ bundle exec rspec`
1. Start a local server with `$ rails s` -- access in your browser or Postman at `localhost:3000`
