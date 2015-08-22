module ApplicationHelper
  def nav_activity_class(nav_item)
    controller_class = "#{nav_item.camelize}Controller".constantize
    controller == controller_class ? "active" : ""
  end
end
