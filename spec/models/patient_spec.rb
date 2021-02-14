require 'rails_helper'

RSpec.describe 'Patientモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { patient.valid? }

    let!(:other_patient) { create(:patient) }
    let(:patient) { build(:patient) }

    context 'last_nameカラム' do
      it '空欄でないこと' do
        patient.last_name = ''
        is_expected.to eq false
      end
    end

    context 'first_nameカラム' do
      it '空欄でないこと' do
        patient.first_name = ''
        is_expected.to eq false
      end
    end
    
    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        patient.last_name_kana = ''
        is_expected.to eq false
      end
    end
    
    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        patient.first_name_kana = ''
        is_expected.to eq false
      end
    end
    
    context 'birth_dateカラム' do
      it '空欄でないこと' do
        patient.birth_date = ''
        is_expected.to eq false
      end
    end
    
    context 'sexカラム' do
      it '空欄でないこと' do
        patient.sex = ''
        is_expected.to eq false
      end
    end
    
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        patient.postal_code = ''
        is_expected.to eq false
      end
    end
    
    context 'addressカラム' do
      it '空欄でないこと' do
        patient.address = ''
        is_expected.to eq false
      end
    end
    
    context 'telカラム' do
      it '空欄でないこと' do
        patient.tel = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        patient.tel = other_patient.tel
        is_expected.to eq false
      end
    end
    
    context 'emailカラム' do
      it '空欄でないこと' do
        patient.email = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        patient.email = other_patient.email
        is_expected.to eq false
      end
    end
    
    context 'passwordカラム' do
      it '空欄でないこと' do
        patient.password = ''
        is_expected.to eq false
      end
    end
    
    context 'password_confirmationカラム' do
      it '空欄でないこと' do
        patient.password_confirmation = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Reservationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Patient.reflect_on_association(:reservations).macro).to eq :has_many
      end
    end
    
    context 'Receptionモデルとの関係' do
      it '1:Nとなっている' do
        expect(Patient.reflect_on_association(:receptions).macro).to eq :has_many
      end
    end
  end
end