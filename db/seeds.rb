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

["ボルト", "ねじ", "ナット", "ワッシャー", "その他"].each do |name|
  Genre.find_or_create_by!(name: name)
end

Item.find_or_create_by!(name: "SUS六角ボルト4X8(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 4
  item.size_length = 8
  item.price_tax_excluded = 400
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト5X8(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 5
  item.size_length = 8
  item.price_tax_excluded = 500
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト6X8(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 6
  item.size_length = 8
  item.price_tax_excluded = 600
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト4X12(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 4
  item.size_length = 12
  item.price_tax_excluded = 500
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト5X12(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 5
  item.size_length = 12
  item.price_tax_excluded = 600
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト6X12(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 6
  item.size_length = 12
  item.price_tax_excluded = 700
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト4X25(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 4
  item.size_length = 25
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト5X25(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 5
  item.size_length = 25
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト6X25(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角・十字穴付き"
  item.size_sutra = 6
  item.size_length = 25
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end


Item.find_or_create_by!(name: "SUS六角ボルト4X30(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角"
  item.size_sutra = 4
  item.size_length = 30
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト5X30(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角"
  item.size_sutra = 5
  item.size_length = 30
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト6X30(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角"
  item.size_sutra = 6
  item.size_length = 30
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト4X40(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角"
  item.size_sutra = 4
  item.size_length = 40
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト5X40(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角"
  item.size_sutra = 5
  item.size_length = 40
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ボルト6X40(1パック70個)") do |item|
  item.genre_id = 1
  item.description = "ステンレスSUS304・六角"
  item.size_sutra = 6
  item.size_length = 40
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ4X8(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 4
  item.size_length = 8
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ5X8(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 5
  item.size_length = 8
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ6X8(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 6
  item.size_length = 8
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ4X12(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 4
  item.size_length = 12
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ5X12(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 5
  item.size_length = 12
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ6X12(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 6
  item.size_length = 12
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ4X25(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 4
  item.size_length = 25
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ5X25(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 5
  item.size_length = 25
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ6X25(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 6
  item.size_length = 25
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ4X30(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 4
  item.size_length = 30
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ5X30(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 5
  item.size_length = 30
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ6X30(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ・十字穴"
  item.size_sutra = 6
  item.size_length = 30
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ4X40(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ"
  item.size_sutra = 4
  item.size_length = 40
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ5X40(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ"
  item.size_sutra = 5
  item.size_length = 40
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUSなべ小ねじ6X40(1パック70個)") do |item|
  item.genre_id = 2
  item.description = "ステンレスSUS304・小ねじ"
  item.size_sutra = 6
  item.size_length = 40
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ナットM4(1パック70個)") do |item|
  item.genre_id = 3
  item.description = "ステンレスSUS304・六角ナット2種"
  item.size_sutra = 4
  item.size_length = 0
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ナットM5(1パック70個)") do |item|
  item.genre_id = 3
  item.description = "ステンレスSUS304・六角ナット2種"
  item.size_sutra = 5
  item.size_length = 0
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS六角ナットM6(1パック70個)") do |item|
  item.genre_id = 3
  item.description = "ステンレスSUS304・六角ナット2種"
  item.size_sutra = 6
  item.size_length = 0
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS平ワッシャーM4 (4.5X10X1.0)(1パック70個)") do |item|
  item.genre_id = 4
  item.description = "ステンレスSUS304・平ワッシャー"
  item.size_sutra = 4
  item.size_length = 0
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS平ワッシャーM5 (5.5X10X1.0)(1パック70個)") do |item|
  item.genre_id = 4
  item.description = "ステンレスSUS304・平ワッシャー"
  item.size_sutra = 5
  item.size_length = 0
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS平ワッシャーM6 (6.5X10X1.0)(1パック70個)") do |item|
  item.genre_id = 4
  item.description = "ステンレスSUS304・平ワッシャー"
  item.size_sutra = 6
  item.size_length = 0
  item.price_tax_excluded = 900
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS蝶番 4mmビス対応 (2個セット)") do |item|
  item.genre_id = 5
  item.description = "ステンレスSUS304 ・2個セット"
  item.size_sutra = 4
  item.size_length = 0
  item.price_tax_excluded = 600
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS蝶番 5mmビス対応 (2個セット)") do |item|
  item.genre_id = 5
  item.description = "ステンレスSUS304 ・2個セット"
  item.size_sutra = 5
  item.size_length = 0
  item.price_tax_excluded = 600
  item.is_on_sale = true
  item.stock = 100
end

Item.find_or_create_by!(name: "SUS蝶番 6mmビス対応 (2個セット)") do |item|
  item.genre_id = 5
  item.description = "ステンレスSUS304 ・2個セット"
  item.size_sutra = 6
  item.size_length = 0
  item.price_tax_excluded = 600
  item.is_on_sale = true
  item.stock = 100
end