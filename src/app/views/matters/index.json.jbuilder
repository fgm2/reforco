json.array!(@matters) do |matter|
  json.extract! matter, :id, :name, :descripition, :created_at, :areaOfKnowledge_id
  json.url matter_url(matter, format: :json)
end
