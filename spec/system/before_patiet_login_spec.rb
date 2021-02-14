require 'rails_helper'

describe '会員ログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      @congestion = create(:congestion)
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe '受診方法画面のテスト' do
    before do
      @congestion = create(:congestion)
      visit '/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_patient_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/patients/sign_up'
      end
      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end
      it 'last_nameフォームが表示される' do
        expect(page).to have_field 'patient[last_name]'
      end
      it 'first_nameフォームが表示される' do
        expect(page).to have_field 'patient[first_name]'
      end
      it 'last_name_kanaフォームが表示される' do
        expect(page).to have_field 'patient[last_name_kana]'
      end
      it 'first_name_kanaフォームが表示される' do
        expect(page).to have_field 'patient[first_name_kana]'
      end
      it 'birth_dateフォームが表示される' do
        expect(page).to have_select 'patient[birth_date]'
      end
      it 'sexフォームが表示される' do
        expect(page).to have_field 'patient[sex]'
      end
      it 'postal_codeフォームが表示される' do
        expect(page).to have_field 'patient[postal_code]'
      end
      it 'addressフォームが表示される' do
        expect(page).to have_field 'patient[address]'
      end
      it 'telフォームが表示される' do
        expect(page).to have_field 'patient[tel]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'patient[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'patient[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'patient[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        @congestion = create(:congestion)
        fill_in 'patient[last_name]', with: Faker::Lorem.characters(number: 1)
        fill_in 'patient[first_name]', with: Faker::Lorem.characters(number: 1)
        fill_in 'patient[last_name_kana]', with: Faker::Lorem.characters(number: 1)
        fill_in 'patient[first_name_kana]', with: Faker::Lorem.characters(number: 1)
        fill_in 'patient[birth_date]', with: '2000-01-01'
        fill_in 'patient[sex]', with: '男性'
        fill_in 'patient[postal_code]', with: '0123456'
        fill_in 'patient[address]', with: '東京都八王子市明神町'
        fill_in 'patient[tel]', with: '01234567890'
        fill_in 'patient[email]', with: Faker::Internet.email
        fill_in 'patient[password]', with: 'password'
        fill_in 'patient[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(patient.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、ホーム画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:patient) { create(:patient) }

    before do
      visit new_patient_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/patients/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'patient[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'patient[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        @congestion = create(:congestion)
        fill_in 'patient[email]', with: patient.email
        fill_in 'patient[password]', with: patient.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、ホーム画面になっている' do
        expect(current_path).to eq '/'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'patient[email]', with: ''
        fill_in 'patient[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/patients/sign_in'
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:patient) { create(:patient) }

    before do
      @congestion = create(:congestion)
      visit new_patient_session_path
      fill_in 'patient[email]', with: patient.email
      fill_in 'patient[password]', with: patient.password
      click_button 'ログイン'
      click_link 'ログアウト'
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/about'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
