json.company do
  json.name @company.name
  json.location @company.location
  json.service @company.service
  json.categories @company.categories
  json.subcategories @company.categories
  json.total_inventory @total
  json.count @count
  json.featured @featured
  json.attention @attention
end 