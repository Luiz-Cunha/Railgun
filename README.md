# Toaru Kagaku no Railgun Characters Webpage

## Description

This webpage displays all the characters from the anime series "Toaru Kagaku no Railgun" and allows logged-in users to rate and comment on them. It leverages the Jikan API to fetch character data and Cloudinary to store user-uploaded pictures.

## Features

- Display a list of characters from "Toaru Kagaku no Railgun"
- User authentication and authorization
- Rate and comment on characters (requires login)
- Store and display user profile pictures with Cloudinary
- Alerts and notifications using SweetAlert2

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Luiz-Cunha/Railgun.git
    cd Railgun
    ```

2. Install dependencies:
    ```sh
    bundle install
    ```

3. Set up the database:
    ```sh
    rails db:create
    rails db:migrate
    rails db:seed # To populate the DB
    ```

4. Configure environment variables:
    Create a `.env` file in the root directory and add the necessary API keys and secrets:
    ```env
    CLOUDINARY_URL=your_cloudinary_url
    ```

5. Start the server:
    ```sh
    rails server
    ```

## Usage

1. Visit `http://localhost:3000` in your web browser.
2. Sign up for an account or log in if you already have one.
3. Browse the list of characters, rate them, and leave comments.

## API Information

This project uses the [Jikan API](https://jikan.moe) to fetch character data. Jikan API is an unofficial MyAnimeList API that provides access to MyAnimeList data.

### Jikan API License

Jikan API is licensed under the MIT License. You can find more details in the [Jikan GitHub repository](https://github.com/jikan-me/jikan-rest/blob/master/LICENSE).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. Make sure to follow the coding style and include tests for any new features.

## Acknowledgements

- [Jikan API](https://jikan.moe) for providing character data
- [SweetAlert2](https://sweetalert2.github.io/) for beautiful alerts and notifications
- [Cloudinary](https://cloudinary.com) for image storage and management
- [Stimulus](https://stimulus.hotwired.dev) for adding interactivity to the Rails app
