module ArticlesHelper
  # Print last article per category in Home page.
  def last_articles_per_category

    # NEW APPROACH GRABBING ITEMS FROM CATEGORY
    @categories.length.times do |pos|
      concat content_tag(:div, link_to(@categories[pos].name, category_path(@categories[pos]),
                                         class: 'h5 text-white d-none d-lg-inline-block
                                                h5-underline font-weight-bold text-decoration-none') +
                          content_tag(:h4, link_to(@categories[pos].articles.last.title, article_path(@categories[pos].articles.last),
                                                   class: 'text-white text-decoration-none'),
                                      class: 'text-white article-title-h5 font-weight-bold secondary-articles-titles'),
                           class: 'col-12 col-sm-6 col-lg-3 p-3',
                           style: "background-image: url(#{if @categories[pos].articles.last.image.present?
                                                             url_for(@categories[pos].articles.last.image)
                                                           end}); background-size: cover;")
        break if pos == @categories.length - 1
    end

    # OLD APPROACH BELOW (BEWARE OF RUBOCOP COMMENTS)

    # rubocop:disable Style/GuardClause
    # if @last_articles.present?
    #   @last_articles.length.times do |pos|
    #     concat content_tag(:div, link_to(@last_articles[pos].category.name, category_path(@last_articles[pos].category),
    #                                      class: 'h5 text-white d-none d-lg-inline-block
    #                                             h5-underline font-weight-bold text-decoration-none') +
    #                       content_tag(:h4, link_to(@last_articles[pos].title, article_path(@last_articles[pos]),
    #                                                class: 'text-white text-decoration-none'),
    #                                   class: 'text-white article-title-h5 font-weight-bold secondary-articles-titles'),
    #                        class: 'col-12 col-sm-6 col-lg-3 p-3',
    #                        style: "background-image: url(#{if @last_articles[pos].image.present?
    #                                                          url_for(@last_articles[pos].image)
    #                                                        end}); background-size: cover;")
    #     break if pos == @last_articles.length - 1
    #   end
    # end
    # rubocop:enable Style/GuardClause
  end
end
