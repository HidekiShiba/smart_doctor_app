class ReservationRemindMailer < ApplicationMailer
  default from: 'ReservationRemind@example.com'

  def reservation_email
    @url  = 'http://18.179.221.53/patients/sign_insign_in'
    
    today_start = Time.now.strftime("%Y-%m-%d") + " 00:00:00"
    today_end = Time.now.strftime("%Y-%m-%d") + " 23:59:59"
    
    patients_with_resevation_notices = Patient.all.select do |patient|
      patient.reservation.where("patient_id = ? and start_time >= ? and start_time <= ?", self.patient_id, today_start, today_end)
    end

    patients_with_resevation_notices_mails = patients_with_resevation_notices.pluck(:email)

    mail(subject: "受診当日のお知らせ", bcc: patients_with_resevation_notices_mails)
  end
end
