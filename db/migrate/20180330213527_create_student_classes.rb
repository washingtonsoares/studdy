class CreateStudentClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :student_classes do |t|
      t.string :nome
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
