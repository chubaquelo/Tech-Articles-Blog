module ArticlesHelper
  # Print last article per category in Home page.
  def last_articles_per_category
    categories_names = @categories.map(&:name)
    categories_names.length.times do |i|
      concat content_tag(:div, content_tag(:h5, categories_names[i], 
                        class: "text-white d-inline-block h5-underline font-weight-bold") + 
                        content_tag(:h4, @categories[i].articles.last.title, class: "text-white article-title-h5 font-weight-bold"),
                        class: "col-3 p-3 bg-secondary", style: "<%= show_user_bg %>")
      break if i ==  @categories.length - 1
    end
  end
  
  private 

  def show_user_bg
    if user_signed_in?
      "background:transparent url(offer.image}) no-repeat fixed left top;"
    else
      "background:transparent url('/images/default_bg.png') no-repeat fixed left top;"
    end
   end 
  
end

