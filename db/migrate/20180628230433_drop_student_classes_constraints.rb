class DropStudentClassesConstraints < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :enrollments, :student_classes
  end
end
