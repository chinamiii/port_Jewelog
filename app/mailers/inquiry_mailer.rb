class InquiryMailer < ApplicationMailer
  default from: "chinami2amez@gmail.com"   # 送信元アドレス
  default to: "chinami2amez@gmail.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => 'お問い合わせを承りました')
  end
end
