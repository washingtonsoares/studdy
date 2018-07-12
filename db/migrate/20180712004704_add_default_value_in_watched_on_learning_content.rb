class AddDefaultValueInWatchedOnLearningContent < ActiveRecord::Migration[5.1]
  def change
    change_column :learning_contents, :watched, :boolean, default: false
  end
end
