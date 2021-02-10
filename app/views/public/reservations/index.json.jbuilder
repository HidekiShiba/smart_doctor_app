json.array! @reservations do |reservation|
  json.start reservation.start_time
  json.end reservation.end_time
  json.id reservation.id
  json.title "×"
end