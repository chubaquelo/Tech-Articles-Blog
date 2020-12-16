module ArticlesHelper
  # Print last article per category in Home page.
  def last_articles_per_category
    @last_articles.length.times do |pos|
      concat content_tag(:div, link_to(@last_articles[pos].category.name, category_path(@last_articles[pos].category),
                        class: 'h5 text-white d-inline-block h5-underline font-weight-bold') +
                        content_tag(:h4, link_to(@last_articles[pos].title, article_path(@last_articles[pos]), class: 'text-white text-decoration-none'), class: 'text-white article-title-h5 font-weight-bold'),
                         class: 'col-6 col-lg-3 p-3', style: "background-image: url(#{url_for(@last_articles[pos].image)}); background-position: center;")
      break if pos == @last_articles.length - 1

    end
  end
end
