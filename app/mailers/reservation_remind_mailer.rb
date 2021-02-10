class ReservationRemindMailer < ApplicationMailer
  default from: 'ReservationRemind@example.com'

  def reservation_email
    # @patient = params[:patient]
    @url  = 'http://18.179.221.53/sign_in'
    # mail(to: @patient.email, subject: '受診当日のお知らせ')
    require "date"
    patients_with_resevation_notices = Patient.all.select do |patient|
      patient.reservation.where(patient_id: patient.id, start_time: Date.today)
    end

    patients_with_resevation_notices_mails = patients_with_resevation_notices.pluck(:email)

    mail(subject: "受診当日のお知らせ", bcc: patients_with_resevation_notices_mails)
  end
end
