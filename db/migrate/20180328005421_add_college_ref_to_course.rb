class AddCollegeRefToCourse < ActiveRecord::Migration[5.1]
  def change
    add_reference :courses, :college, foreign_key: true
  end
end
