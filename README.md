# Oddio




Oddio is a Audio touring app built in 10 days by [Alexandra Chakeres](https://github.com/chakeresa), [Patrick Duvall](https://github.com/Patrick-Duvall), [Martin Mercer](https://github.com/m-mrcr), [Logan Pile](https://github.com/lpile), and [Mills Provosty](https://github.com/MillsProvosty).

In Oddio visitors can explore a map populated with Denver locations stored in our database. These locations are generated from a rake task that hits Google and TomTom APIs to make landmarks. Users can navigate to different points on a map and open show pages for locations. They also can listen to user uploaded audio for that location. Users can log in by making an account or using google OAuth to gain the ability to upload and vote on audio. Admins have CRUD functionality to moderate and delete inappropriate content.

[You can visit a working version of the project here](https://oddio.herokuapp.com/)

### Built Using
- Rails 5.2.x 
- Ruby 2.4.1
- Google OAuth for user authentication
- Javascript and Leaflet JS for map functionality
- PostgreSQL for Landmark, user, and authorization storage
- AWS for S3 buckets to store Audio Files
- Sinatra to host a voting microservice

[You can visit the Sinatra Mini-Service database here](https://github.com/MillsProvosty/Votes)
- connects through https://votes-app-1903.herokuapp.com/
- Sinatra 2.0.5
- Ruby 2.4.1

### Team:
    - Alexandra Chakeres
    - Logan Pile
    - Martin Mercer
    - Mills Provosty
    - Patrick Duvall

### Wireframes
  - Location Index: https://oddio1903.s3.us-east-2.amazonaws.com/Wireframes/Paper.Project.2019.07.15.pdf
    -- This is more or less what we landed on.
  - Recording New: https://oddio1903.s3.us-east-2.amazonaws.com/Wireframes/Paper.Project.2019.07.15+3.pdf
    -- This was a mock up when we were thinking it would be text, but then realized we really wanted to shoot for uploading / recording of audio. This page looks similar, though with upload features
  - Location Show: https://oddio1903.s3.us-east-2.amazonaws.com/Wireframes/Paper.Project.2019.07.15+2.pdf
    -- This is more or less what we landed on.
