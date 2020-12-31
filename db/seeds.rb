# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Sergio', username: 'chubaquelo', email: 'sergio@email.com', password: '123123123', password_confirmation: '123123123')
Category.create(name: 'Windows')
Category.create(name: 'Linux')
Category.create(name: 'Cryptos')
Category.create(name: 'Tools')

User.last.articles.create(category_id: Category.first.id, title: 'Article 1 Title', body: 'Article 1 body')
User.last.articles.create(category_id: Category.second.id, title: 'Article 2 Title', body: 'Article 2 body')
User.last.articles.create(category_id: Category.third.id, title: 'Article 3 Title', body: 'Article 3 body')
User.last.articles.create(category_id: Category.last.id, title: 'Article 4 Title', body: 'Article 4 body')

Vote.create(user_id: User.first.id, article_id: Article.first.id)
