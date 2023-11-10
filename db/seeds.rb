# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do |n|
  Customer.create!(
    last_name: "山田#{n + 1}",
    first_name: "太郎#{n + 1}",
    kana_last_name: "ヤマダ#{n + 1}",
    kana_first_name: "タロウ#{n + 1}",
    postal_code: "1112222",
    address: "テスト県テスト市テスト",
    phone_numbre: "11122223333",
    email: "#{n + 1}@a",
    password: "123456",
    is_active: true
  )
end

Admin.create!(
  email: "a@a",
  password: "123456"
  )

3.times do |n|
 Address.create!(
  customer_id: n+1,
  postal_code: "1111111",
  address: "テスト県テスト市テスト#{n + 1}",
  name: "テストマンション#{n + 1}号室"
   )
  end

Genre.create!(
  name: "ボルト"
  )
Genre.create!(
  name: "ねじ"
  )
Genre.create!(
  name: "ナット"
  )
Genre.create!(
  name: "ワッシャー"
  )

Item.create!(
  genre_id: 1,
  name: "SUSナベコネジ4X25(1パック150個)",
  description: "ステンレスSUSXM7・十字穴",
  size_sutra: 4,
  size_length:25,
  price_tax_excluded: 1000,
  is_on_sale: true
  )

Item.create!(
  genre_id: 2,
  name: "SUS六角ボルト4X8(1パック70個)",
  description: "ステンレスSUS304・六角",
  size_sutra: 4,
  size_length:25,
  price_tax_excluded: 900,
  is_on_sale: true
  )

Item.create!(
  genre_id: 3,
  name: "ユニクロ六角ナットM6(1パック200個)",
  description: "ユニクロ加工",
  size_sutra: 4,
  size_length:25,
  price_tax_excluded: 600,
  is_on_sale: true
  )

Item.create!(
  genre_id: 4,
  name: "SUS平ワッシャーM5X10X1.0(1パック20個)",
  description: "ステンレスSUSXM7・内径5.5mm,外径10mm,厚さ1.0mm",
  size_sutra: 4,
  size_length:25,
  price_tax_excluded: 150,
  is_on_sale: true
  )