class AddThumbnailToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :thumbnail, :string
  end
end
