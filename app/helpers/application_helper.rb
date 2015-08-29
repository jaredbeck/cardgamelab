module ApplicationHelper
  def nav_activity_class(path)
    path == request.path ? "active" : ""
  end
end
