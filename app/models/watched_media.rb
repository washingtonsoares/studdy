class WatchedMedia < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :learning_content
end
