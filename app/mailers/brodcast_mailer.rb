class BrodcastMailer < ApplicationMailer
  def new_product(product, user)
    @product = product
    @user = user
    mail(
      subject: 'Spalah 2017',
      to: @user.email
    )
  end
end
