class AddWatchedToLearningContent < ActiveRecord::Migration[5.1]
  def change
    add_column :learning_contents, :watched, :boolean
  end
end
