FactoryBot.define do
  factory :reservation do
    examination_count { '初診' }
    symptom { '頭痛' }
    body_parts { '頭部' }
    starting_point { '2000-01-01' }
    treatment { 'あり' }
    prescription { '' }
    side_effect { 'あり' }
    other_diseases { '' }
    hospital_name { '' }
    pregnancy { 'なし' }
    purpose { '診察＋処方箋' }
    request { '' }
    examination_status { '受診前' }
    start_time { "2021-02-15 00:00:00" }
    end_time { "2021-02-15 00:30:00" }
    patient
  end
end