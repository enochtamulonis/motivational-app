json.extract! goal, :id, :text, :created_at, :updated_at
json.url goal_url(goal, format: :json)
json.text goal.text.to_s
