class ContactMailer < ApplicationMailer

  default :from => 'redenewtimesac@gmail.com'

  def contact_message(contact)
    @contact = contact
    mail(:to => @contact["email"], :subject => @contact["subject"])
  end


end
