class AddUrlToColleges < ActiveRecord::Migration[5.1]
  def change
    add_column :colleges, :url, :string
  end
end
