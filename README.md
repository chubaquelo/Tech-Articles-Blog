# Tech Articles Blog

This is a blog application made with Ruby on Rails, where an user can sign up and post articles in the corresponding category.
A user can also register with a facebook account, and an image can be uploaded to each article.

![screenshot](https://i.imgur.com/WklOwjV.jpg)

## Built With

- Ruby v2.7.1
- Ruby on Rails v6.0.3.4
- Postgresql
- Testing: RSpec and Capybara
- Rails Gems: DEVISE, OMNIAUTH

## Live Demo

[Live Demo](https://peaceful-mesa-79930.herokuapp.com/)

### Setup

Clone the respository on your local machine using the command:

```
git clone https://github.com/chubaquelo/Tech-Articles-Blog
```

Go inside the created folder:
```
cd Tech-Articles-Blog
```

Instal Gems and dependencies:

```
bundle install
```
```
yarn install --check-files
```

Run database migration and seed:

```
   rails db:create
   rails db:migrate
   rails db:seed
```

Run server:
```
rails server
```

You can run Rspec tests with the command:
```
rspec spec
```

Open application in the browser through: http://localhost:3000

![#f03c15](https://via.placeholder.com/15/f03c15/000000?text=+) `Note: although rails db:seed will fill the database with some articles, these won't have any images attached to them. Make sure you upload new articles with images once you have the app running.`

## Acknowledgment

- Design of blog app was taken from [Nelson Sawka on Behance](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version)
- [Devise](https://github.com/heartcombo/devise) and [Omniauth](https://github.com/simi/omniauth-facebook) were used for Facebook Login API integration. API keys (public and secret) are saved as environment variables for security.
- Database model (ERD) first approach given for this work was:
![screenshot](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2f4dc4e4-d65d-4570-a4fc-1a0d2daef2c5%2FERD__articles.png?table=block&id=2a9e1547-2f96-423c-b39a-11ee04899979&width=1150&userId=1d1ccd2b-f0ed-44aa-8a39-a763326aee3f&cache=v2)

## Sergio Obolevich

- LinkedIn: [sergio-obolevich](https://www.linkedin.com/in/sergio-obolevich/)
- Github: [@chubaquelo](https://github.com/chubaquelo)
- Twitter: [@sergioObolevich](https://twitter.com/sergioObolevich)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/chubaquelo/Tech-Articles-Blog/issues).

## Show your support

Give a ⭐️ if you like this project!
