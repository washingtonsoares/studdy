json.extract! learning_content, :id, :nome, :description, :url, :course_id, :created_at, :updated_at
json.url learning_content_url(learning_content, format: :json)
