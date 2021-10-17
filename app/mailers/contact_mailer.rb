class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to:   ENV[], subject: '【お問い合わせ】' + @contact.subject_i18n
    # subject_i18n subjectカラム日本語化
  end
end
