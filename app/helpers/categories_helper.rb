module CategoriesHelper
  def show_categories_resume
    @categories.first(2).each do |cat|
      concat content_tag(:div, '' , class: 'col-6 col-md-3', 
                        style: "background-image: url(#{url_for(cat.articles.last.image)}); background-size: cover;")
      concat content_tag(:div, content_tag(:div, cat.name, class: 'mt-4 h5 text-dark d-inline-block h5-underline font-weight-bold text-decoration-none') +
                             content_tag(:div, content_tag(:h3, cat.articles.last.title, class: 'font-weigth-bold')) +
                             content_tag(:div, cat.articles.last.body) +
                             content_tag(:div, link_to('Read More', article_path(cat.articles.last))),
                        class: 'col-6 col-md-3 categories-resume-block')
    end
  end

  def show_categories_resume_two
    @categories.last(2).each do |cat|
      concat content_tag(:div, content_tag(:div, cat.name, class: 'mt-4 h5 text-dark d-inline-block h5-underline font-weight-bold text-decoration-none') +
      content_tag(:div, content_tag(:h3, cat.articles.last.title, class: 'font-weigth-bold')) +
      content_tag(:div, cat.articles.last.body) +
      content_tag(:div, link_to('Read More', article_path(cat.articles.last))),
      class: 'col-6 col-md-3 categories-resume-block')
      concat content_tag(:div, '' , class: 'col-6 col-md-3',
                        style: "background-image: url(#{url_for(cat.articles.last.image)}); background-size: cover;")
    end
  end
end
