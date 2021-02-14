require 'rails_helper'

RSpec.describe 'Reservationモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { reservation.valid? }

    let(:patient) { create(:patient) }
    let!(:reservation) { build(:reservation, patient_id: patient.id) }

    context 'examination_countカラム' do
      it '空欄でないこと' do
        reservation.examination_count = ''
        is_expected.to eq false
      end
    end

    context 'symptomカラム' do
      it '空欄でないこと' do
        reservation.symptom = ''
        is_expected.to eq false
      end
    end
    
    context 'body_partsカラム' do
      it '空欄でないこと' do
        reservation.body_parts = ''
        is_expected.to eq false
      end
    end
    
    context 'starting_pointカラム' do
      it '空欄でないこと' do
        reservation.starting_point = ''
        is_expected.to eq false
      end
    end
    
    context 'treatmentカラム' do
      it '空欄でないこと' do
        reservation.treatment = ''
        is_expected.to eq false
      end
    end
    
    context 'side_effectカラム' do
      it '空欄でないこと' do
        reservation.side_effect = ''
        is_expected.to eq false
      end
    end
    
    context 'pregnancyカラム' do
      it '空欄でないこと' do
        reservation.pregnancy = ''
        is_expected.to eq false
      end
    end
    
    context 'purposeカラム' do
      it '空欄でないこと' do
        reservation.purpose = ''
        is_expected.to eq false
      end
    end
    
    context 'examination_statusカラム' do
      it '空欄であること' do
        reservation.examination_status = ''
        is_expected.to eq true
      end
    end
    
    context 'start_timeカラム' do
      it '空欄でないこと' do
        reservation.start_time = ''
        is_expected.to eq false
      end
    end
    
    context 'end_timeカラム' do
      it '空欄でないこと' do
        reservation.end_time = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'patientモデルとの関係' do
      it 'N:1となっている' do
        expect(Reservation.reflect_on_association(:patient).macro).to eq :belongs_to
      end
    end
  end
end
