module ArticlesHelper
  # Print last article per category in Home page.
  # rubocop:disable Style/GuardClause
  def last_articles_per_category
    if @categories.length > 3
      4.times do |pos|
        concat content_tag(:div, link_to(@categories[pos].name, category_path(@categories[pos]),
                                         class: 'h5 text-white d-none d-lg-inline-block
                                                  h5-underline font-weight-bold text-decoration-none') +
                            content_tag(:h4, link_to(@categories[pos].articles.last.title,
                                                     article_path(@categories[pos].articles.last),
                                                     class: 'text-white text-decoration-none'),
                                        class: 'text-white article-title-h5 font-weight-bold
                                                secondary-articles-titles'),
                           class: 'col-12 col-sm-6 col-lg-3 p-3',
                           style: "background-image: url(#{if @categories[pos].articles.last.image.present?
                                                             url_for(@categories[pos].articles.last.image)
                                                           end}); background-size: cover;")
        break if pos == 3
      end
    end
  end
  # rubocop:enable Style/GuardClause

  def show_article_image
    concat image_tag @article.image, class: 'img-fluid' if @article.image.attached?
  end

  def show_votes_info
    categories = @article.categories.map(&:name).join(' ')

    # rubocop:disable Style/IdenticalConditionalBranches
    if signed_in? && !current_user.votes.find_by(article_id: @article.id)
      concat content_tag(:p, "Categories: #{categories} | Votes: #{@article.votes.count}")
      concat render 'vote_button'
    else
      concat content_tag(:p, "Categories: #{categories} | Votes: #{@article.votes.count}")
      concat content_tag(:br)
    end
    # rubocop:enable Style/IdenticalConditionalBranches
  end

  def article_content_info; end
end
