# Oddio



Oddio is a Audio touring app built in 10 days by [Alexandra Chakeres](https://github.com/chakeresa), [Patrick Duvall](https://github.com/Patrick-Duvall), [Martin Mercer](https://github.com/m-mrcr), [Logan Pile](https://github.com/lpile),  and [Mills Provosty](https://github.com/MillsProvosty).

In Oddio visitors can explore a map populated with Denver locations stored in our datase. These locations ate generated from a rake task that hits Google and TomTom Apis to make landmarks. Users can navigate to different points on a map and open show pages for locations they can listen to user uploaded audio for that location. Users can log in by making an account or using google OAuth to gain the ability to upload audio and vote on audio. Admins have CRUD funtionality to moderate adn delete inappropriate content.

[You can visit a working version of the project here](https://oddio.herokuapp.com/)

### Built Using
- Rails 5.2.x 
- Ruby 2.4.1
- Google OAuth for user authentication
- Javascript and Leaflet JS for map functionality
- PostgreSQL for Landmark, user, and authorization storage
- AWS for S3 buckets to store Audio Files
- Sinatra to host a voting microservice

[Checkout the Microservice Here](https://github.com/MillsProvosty/Votes)

