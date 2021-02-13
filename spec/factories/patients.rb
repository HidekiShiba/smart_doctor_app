FactoryBot.define do
  factory :patient do
    last_name { '田中' }
    first_name { '太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birth_date { '2000-01-01' }
    sex { '男性' }
    postal_code { '0123456' }
    address { '東京都八王子市明神町' }
    tel { '01234567890' }
    email { 'sample@gmail.com' }
    password { '012345' }
    password_confirmation { '012345' }
  end
end