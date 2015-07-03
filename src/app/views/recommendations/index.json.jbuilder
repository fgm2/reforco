json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id, :rating, :descripition, :created_at
  json.url recommendation_url(recommendation, format: :json)
end
