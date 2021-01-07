User.create(name: 'Sergio', username: 'chubaquelo', email: 'sergio@email.com', password: '123123123', password_confirmation: '123123123')

Category.create(name: 'Windows')
Category.create(name: 'Linux')
Category.create(name: 'Cryptos')
Category.create(name: 'Tools')

User.first.articles.create(title: 'Article 1 Title', body: 'Article 1 body')
User.first.articles.create(title: 'Article 2 Title', body: 'Article 2 body')
User.first.articles.create(title: 'Article 3 Title', body: 'Article 3 body')
User.first.articles.create(title: 'Article 4 Title', body: 'Article 4 body')

ArticlesCategory.create(category_id: 1, article_id: 1)
ArticlesCategory.create(category_id: 2, article_id: 2)
ArticlesCategory.create(category_id: 3, article_id: 3)
ArticlesCategory.create(category_id: 4, article_id: 4)

Vote.create(user_id: 1, article_id: 1)
