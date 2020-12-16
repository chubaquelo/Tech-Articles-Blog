module ApplicationHelper
  def display_flash_messages
    concat content_tag(:p, notice, class: 'notice') unless flash[:notice].nil?
    concat content_tag(:p, alert, class: 'alert') unless flash[:notice].nil?
  end

  def menu_categories
    @categories = Category.all

    @categories.each do |category|
      concat content_tag(:li, link_to(category.name, category_path(category),
                                      class: 'font-weight-bold text-uppercase orangify'), class: 'nav-item orangify')
    end
  end

  def user_nav_links
    unless signed_in?
      concat link_to('Login', new_user_session_path, class: 'mr-2 text-dark') + link_to('Register', new_user_registration_path, class: 'mx-2 text-dark')
    end
    concat link_to 'Sign Out', destroy_user_session_path, method: :delete, class: 'mr-3' if signed_in?
  end
end
