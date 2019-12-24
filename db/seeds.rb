30.times do
  name = FFaker::Bank.name
  detail = FFaker::Lorem.sentences(2)
  keyword = FFaker::Lorem.sentences(1)
  Category.create!(name: name, detail: detail, keyword: keyword)
end

30.times do
  name = FFaker::Company.name
  content = FFaker::Lorem.sentences(2)
  address = FFaker::Address
  Brand.create!(name: name, content: content, address: address)
end

categories = Category.order(:created_at).take(6)
brands = Brand.order(:created_at).take(6)
30.times do |n|
  name = FFaker::Product.name
  decription = FFaker::Lorem.sentences(2)
  quantity = FFaker::SSN
  if n != 0 
    Product.create!(name: name, decription: decription, quantity: quantity, brand_id: n, category_id: n) 
  end
end
