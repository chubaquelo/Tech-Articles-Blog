module ArticlesHelper
  # Print last article per category in Home page.
  def last_articles_per_category
    
    @last_articles.length.times do |pos|
    concat content_tag(:div, content_tag(:h5, @last_articles[pos].category.name, 
                      class: "text-white d-inline-block h5-underline font-weight-bold") + 
                      content_tag(:h4, link_to(@last_articles[pos].title, article_path(@last_articles[pos]), class: "text-white text-decoration-none"), class: "text-white article-title-h5 font-weight-bold"),
                      class: "col-3 p-3", style: "background-image: url(#{url_for(@last_articles[pos].image)})")
    break if pos ==  @last_articles.length - 1
    
    
    # categories_names = @categories.map(&:name)
    # categories_names.length.times do |i|
    #   concat content_tag(:div, content_tag(:h5, categories_names[i], 
    #                     class: "text-white d-inline-block h5-underline font-weight-bold") + 
    #                     content_tag(:h4, link_to(@categories[i].articles.last.title, article_path(@categories[i].articles.last), class: "text-white text-decoration-none"), class: "text-white article-title-h5 font-weight-bold"),
    #                     class: "col-3 p-3 background-article-main")
    #   break if i ==  @categories.length - 1
    end
  end
    
end

