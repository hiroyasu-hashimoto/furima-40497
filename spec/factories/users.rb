FactoryBot.define do
  factory :user do
    nickname       { Faker::Name.initials(number: 2) }
    email          { Faker::Internet.email }
    password       { '1a' + Faker::Internet.password(min_length: 6) }
    birthday       { Faker::Date.birthday(min_age: 18, max_age: 65) }

    # 漢字の名前用
    kanji_first_names  = %w[一郎 二郎 三郎 四郎 五郎]
    kanji_last_names   = %w[田中 鈴木 高橋 佐藤 伊藤]
    name_first  { kanji_first_names.sample }
    name_last   { kanji_last_names.sample }

    # カタカナの名前用
    kana_first_names  = %w[イチロウ ジロウ サブロウ シロウ ゴロウ]
    kana_last_names   = %w[タナカ スズキ タカハシ サトウ イトウ]
    katakana_first { kana_first_names.sample }
    katakana_last  { kana_last_names.sample }
  end
end
