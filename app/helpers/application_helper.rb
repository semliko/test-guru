module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "<a href='#{repo}' target='_blank'>#{author}</a>".html_safe
  end
end
