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

User.last.articles.create(title: 'Article 1 Title', body: 'Article 1 body')
User.last.articles.create(title: 'Article 2 Title', body: 'Article 2 body')
User.last.articles.create(title: 'Article 3 Title', body: 'Article 3 body')
User.last.articles.create(itle: 'Article 4 Title', body: 'Article 4 body')

ArticlesCategory.create(category_id: Category.first.id, article_id: Article.first.id)
ArticlesCategory.create(category_id: Category.second.id, article_id: Article.second.id)
ArticlesCategory.create(category_id: Category.third.id, article_id: Article.third.id)
ArticlesCategory.create(category_id: Category.last.id, article_id: Article.last.id)

Vote.create(user_id: User.first.id, article_id: Article.first.id)
