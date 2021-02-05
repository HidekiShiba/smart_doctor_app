json.array! @reservations do |reservation|
  json.start reservation.start_time
  json.end reservation.end_time
  json.id reservation.id
  json.title reservation.patient.last_name_kana + reservation.patient.first_name_kana
  json.url reservation_url(reservation, format: :html)
end