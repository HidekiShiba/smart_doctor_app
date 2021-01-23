json.array! @reservations do |reservation|
  json.id reservation.id
  json.title reservation.title
  json.start reservation.start_time
  json.end reservation.end_time
end