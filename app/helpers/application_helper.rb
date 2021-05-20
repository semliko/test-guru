module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to(author, repo, _blank: true)
  end
end
