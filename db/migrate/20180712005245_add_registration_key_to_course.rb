class AddRegistrationKeyToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :registrationkey, :string
  end
end