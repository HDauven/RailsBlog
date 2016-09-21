module ApplicationHelper
  # Method that adds an 'active' class to the 'li' tag if the current page equals the menu item.
  # <%= link_to_active "Home", root_path, id: "home_link" %>
  def link_to_active(body, url, html_options = {})
    active = "active" if current_page?(url)
    content_tag :li, class: active do
      link_to body, url, html_options
    end
  end
end
