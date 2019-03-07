json.extract! question, :id, :title, :message, :image, :upvotes, :views, :belongs_to, :created_at, :updated_at
json.url question_url(question, format: :json)
