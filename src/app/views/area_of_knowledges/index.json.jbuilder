json.array!(@area_of_knowledges) do |area_of_knowledge|
  json.extract! area_of_knowledge, :id, :name, :created_at
  json.url area_of_knowledge_url(area_of_knowledge, format: :json)
end
