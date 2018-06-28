class DropStudentClassesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :student_classes
  end
end
