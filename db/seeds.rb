# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |n|
  email = "test#{n + 1}@a"
  Customer.find_or_create_by!(email: email) do |customer|
    customer.last_name = "山田#{n + 1}"
    customer.first_name = "太郎#{n + 1}"
    customer.kana_last_name = "ヤマダ#{n + 1}"
    customer.kana_first_name = "タロウ#{n + 1}"
    customer.postal_code = "1112222"
    customer.address = "テスト県テスト市テスト"
    customer.phone_number = "11122223333"
    customer.password = "123456"
    customer.is_active = true
  end
end

Admin.find_or_create_by!(email: "admin@admin") do |admin|
  admin.password = "123456"
end

3.times do |n|
  Address.find_or_create_by!(customer_id: n+1, address: "テスト県テスト市テスト#{n + 1}", name: "令和#{n + 1} 礼子#{n + 1}") do |address|
    address.postal_code = "1111111"
  end
end

genres = ["ボルト", "小ねじ", "ナット", "ワッシャー", "蝶番"].map do |name|
  Genre.find_or_create_by!(name: name)
end

item_data = [
  ["SUS六角ボルト4X8(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 4, 8, 400, true, 10],
  ["SUS六角ボルト5X8(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 5, 8, 500, true, 10],
  ["SUS六角ボルト6X8(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 6, 8, 600, true, 10],

  ["SUS六角ボルト4X12(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 4, 12, 500, true, 10],
  ["SUS六角ボルト5X12(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 5, 12, 600, true, 10],
  ["SUS六角ボルト6X12(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 6, 12, 700, true, 10],

  ["SUS六角ボルト4X25(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 4, 25, 600, true, 10],
  ["SUS六角ボルト5X25(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 5, 25, 700, true, 10],
  ["SUS六角ボルト6X25(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 6, 25, 800, true, 10],

  ["SUS六角ボルト4X30(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 4, 30, 700, true, 10],
  ["SUS六角ボルト5X30(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 5, 30, 800, true, 10],
  ["SUS六角ボルト6X30(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 6, 30, 900, true, 10],

  ["SUS六角ボルト4X40(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 4, 40, 800, true, 10],
  ["SUS六角ボルト5X40(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 5, 40, 900, true, 10],
  ["SUS六角ボルト6X40(1パック70個)", "ボルト", "ステンレスSUS304・六角・十字穴付き", 6, 40, 1000, true, 10],

  ["SUSなべ小ねじ4X8(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 4, 8, 400, true, 10],
  ["SUSなべ小ねじ5X8(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 5, 8, 500, true, 10],
  ["SUSなべ小ねじ6X8(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 6, 8, 600, true, 10],

  ["SUSなべ小ねじ4X12(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 4, 12, 500, true, 10],
  ["SUSなべ小ねじ5X12(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 5, 12, 600, true, 10],
  ["SUSなべ小ねじ6X12(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 6, 12, 700, true, 10],

  ["SUSなべ小ねじ4X25(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 4, 25, 600, true, 10],
  ["SUSなべ小ねじ5X25(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 5, 25, 700, true, 10],
  ["SUSなべ小ねじ6X25(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 6, 25, 800, true, 10],

  ["SUSなべ小ねじ4X30(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 4, 30, 700, true, 10],
  ["SUSなべ小ねじ5X30(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 5, 30, 800, true, 10],
  ["SUSなべ小ねじ6X30(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 6, 30, 900, true, 10],

  ["SUSなべ小ねじ4X40(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 4, 40, 800, true, 10],
  ["SUSなべ小ねじ5X40(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 5, 40, 900, true, 10],
  ["SUSなべ小ねじ6X40(1パック70個)", "小ねじ", "ステンレスSUS304・小ねじ・十字穴", 6, 40, 1000, true, 10],

  ["SUS六角ナットM4(1パック70個)", "ナット", "ステンレスSUS304・六角ナット2種", 4, 0, 400, true, 10],
  ["SUS六角ナットM5(1パック70個)", "ナット", "ステンレスSUS304・六角ナット2種", 5, 0, 500, true, 10],
  ["SUS六角ナットM6(1パック70個)", "ナット", "ステンレスSUS304・六角ナット2種", 6, 0, 600, true, 10],

  ["SUS平ワッシャーM4 (4.5X10X1.0)(1パック70個)", "ワッシャー", "ステンレスSUS304・平ワッシャー", 4, 0, 400, true, 10],
  ["SUS平ワッシャーM5 (5.5X10X1.0)(1パック70個)", "ワッシャー", "ステンレスSUS304・平ワッシャー", 5, 0, 500, true, 10],
  ["SUS平ワッシャーM6 (6.5X10X1.0)(1パック70個)", "ワッシャー", "ステンレスSUS304・平ワッシャー", 6, 0, 600, true, 10],

  ["SUS蝶番 4mmビス対応 (2個セット)", "蝶番", "ステンレスSUS304 ・2個セット", 4, 0, 600, true, 10],
  ["SUS蝶番 5mmビス対応 (2個セット)", "蝶番", "ステンレスSUS304 ・2個セット", 5, 0, 700, true, 10],
  ["SUS蝶番 6mmビス対応 (2個セット)", "蝶番", "ステンレスSUS304 ・2個セット", 6, 0, 800, true, 10],

]

item_data.each do |name, genre_name, description, sutra, length, price, sale, stock|
  item = Item.find_or_create_by!(name: name) do |i|
    i.description = description
    i.size_sutra = sutra
    i.size_length = length
    i.price_tax_excluded = price
    i.is_on_sale = sale
    i.stock = stock
  end

  genre = genres.find { |g| g.name == genre_name }
  item.genres << genre unless item.genres.include?(genre)
end