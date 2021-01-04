module CategoriesHelper
  def show_categories_resume
    @categories.first(2).each do |cat|
      concat content_tag(:div, content_tag(:div, nil, class: 'layer'),
                         class: 'col-6 col-md-3 px-0',
                         style: "background-image: url(#{if cat.articles.last.image.present?
                                                           url_for(cat.articles.last.image)
                                                         end}); background-size: cover;")
      concat content_tag(:div, content_tag(:div, link_to(cat.name, category_path(cat),
                                                         class: 'read-more-link text-decoration-none'),
                                           class: 'mt-4 h5 text-dark d-inline-block h5-underline
                                                    font-weight-bold text-decoration-none') +
                            content_tag(:div, content_tag(:h3, cat.articles.last.title, class: 'font-weigth-bold')) +
                            content_tag(:div, truncate(cat.articles.last.body, length: 100)) +
                            content_tag(:div, link_to('Read More', article_path(cat.articles.last),
                                                      class: 'read-more-link text-decoration-none'),
                                        class: ''),
                         class: 'col-6 col-md-3 categories-resume-block')
    end
  end

  def show_categories_resume_two
    @categories.last(2).each do |cat|
      concat content_tag(:div, content_tag(:div, link_to(cat.name, category_path(cat),
                                                         class: 'read-more-link text-decoration-none'),
                                           class: 'mt-4 h5 text-dark d-inline-block h5-underline font-weight-bold
                                                 text-decoration-none') +
      content_tag(:div, content_tag(:h3, cat.articles.last.title, class: 'font-weigth-bold')) +
      content_tag(:div, truncate(cat.articles.last.body, length: 100)) +
      content_tag(:div, link_to('Read More', article_path(cat.articles.last),
                                class: 'read-more-link text-decoration-none'), class: ''),
                         class: 'col-6 col-md-3 categories-resume-block')
      concat content_tag(:div, content_tag(:div, nil, class: 'layer'), class: 'col-6 col-md-3 px-0',
                                                                       style: "background-image:
                                                                            url(#{if cat.articles.last.image.present?
                                                                                    url_for(cat.articles.last.image)
                                                                                  end});
                                                                            background-size: cover;")
    end
  end

  # These below are for a single category
  def show_category_articles
    count = 0
    @articles.each do |article|
      option_one(article) if [1, 0].include?(count)
      option_two(article) if [2, 3].include?(count)
      count += 1
      count = 0 if count > 4
    end
  end

  private

  def option_one(article)
    concat content_tag(:div, content_tag(:div, nil, class: 'layer'), class: 'col-6 col-md-3 px-0',
                                                                     style: "background-image:
                                                                            url(#{if article.image.present?
                                                                                    url_for(article.image)
                                                                                  end});
                                                                            background-size: cover;")
    concat content_tag(:div, content_tag(:div, link_to(article.category.name, category_path(article.category),
                                                       class: 'read-more-link text-decoration-none'),
                                         class: 'mt-4 h5 text-dark d-inline-block h5-underline font-weight-bold
                                               text-decoration-none') +
                           content_tag(:div, content_tag(:h3, article.title, class: 'font-weigth-bold')) +
                           content_tag(:div, truncate(article.body, length: 100)) +
                           content_tag(:div, "Author: #{article.author.name}", class: 'mt-2 small font-weight-bold') +
                           content_tag(:div, link_to('Read More', article_path(article),
                                                     class: 'read-more-link text-decoration-none'), class: 'mt-5'),
                       #  if signed_in? && !current_user.votes.find_by(article_id: article.id)
                       #   content_tag(:div, vote_link(article.id), class: 'small')
                       #  end
                       class: 'col-6 col-md-3 categories-resume-block')
  end

  def option_two(article)
    concat content_tag(:div, content_tag(:div, link_to(article.category.name, category_path(article.category),
                                                       class: 'read-more-link text-decoration-none'),
                                         class: 'mt-4 h5 text-dark d-inline-block h5-underline
                                               font-weight-bold text-decoration-none') +
    content_tag(:div, content_tag(:h3, article.title, class: 'font-weigth-bold')) +
    content_tag(:div, truncate(article.body, length: 100)) +
    content_tag(:div, "Author: #{article.author.name}", class: 'mt-2 small font-weight-bold') +
    content_tag(:div, link_to('Read More', article_path(article), class: 'read-more-link text-decoration-none'),
                class: 'mt-5'),
                       class: 'col-6 col-md-3 categories-resume-block')

    concat content_tag(:div, content_tag(:div, nil, class: 'layer'), class: 'col-6 col-md-3 px-0',
                                                                     style: "background-image:
                                                                     url(#{if article.image.present?
                                                                             url_for(article.image)
                                                                           end});
                                                                     background-size: cover;")
  end

  def vote_link(article_id)
    form_with model: @vote, method: :post, url: votes_path do |f|
      f.hidden_field :article_id, value: article_id
      f.submit '⮬ Upvote this article', class: 'read-more-link text-decoration-none small'
    end
  end
end
