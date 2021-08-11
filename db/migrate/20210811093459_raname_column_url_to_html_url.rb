class RanameColumnUrlToHtmlUrl < ActiveRecord::Migration[6.1]
  def change
    rename_column :gists, :url, :html_url
  end
end
