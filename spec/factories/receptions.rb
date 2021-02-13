FactoryBot.define do
  factory :reception do
    number { congestion.count + 1 }
    start_time { (DateTime.current + Rational(1 * congestion.time, 24 * 60)).strftime("%Y/%m/%d %H:%M") }
    examination_status { '発行済' }
    patient
    congestion
  end
end