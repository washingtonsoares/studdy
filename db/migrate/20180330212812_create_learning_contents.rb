class CreateLearningContents < ActiveRecord::Migration[5.1]
  def change
    create_table :learning_contents do |t|
      t.string :nome
      t.text :description
      t.text :url
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
