class GiftAlertMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def gift_alert(gift_accession)
    @user = gift_accession.giver
    @child = gift_accession.giftee
    @parent = @child.parents.first.user
    @gift = gift_accession.gift
    @page = requests_url(@parent)
    mail :to => @parent.email, :subject => "Gift purchase: #{@user.first_name} just purchased a gift for #{@child.first_name}'s birthday"
  end
end
