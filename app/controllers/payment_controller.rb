class PaymentController < ApplicationController
  def checkout
    amount_to_charge = session[:amount].to_i
    if request.post?
       ActiveMerchant::Billing::Base.mode = :test

        credit_card = ActiveMerchant::Billing::CreditCard.new(
          :first_name => params[:first_name],
          :last_name => params[:last_name],
          :number => params[:credit_no].to_i,
          :month => params[:check][:month].to_i,
          :year => params[:check][:year].to_i,
          :verification_value => params[:verification_number].to_i)

        gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
          :login => 'TestMerchant',
          :password =>'password',
          :test => 'true')

        response = gateway.purchase(amount_to_charge, credit_card)
        puts response.inspect
        if response.success?
          gateway.capture(amount_to_charge, response.authorization)
          UserNotifierMailer.purchase_complete(current_user,current_cart).deliver
          session[:cart_id]=nil
          session[:amount]=nil
          render :action => "purchase_complete"
        else
          flash[:notice]= "Something went wrong.Try again"
          render :action => "checkout"
        end
    end
    if user_signed_in? 
      
    else 
      flash[:notice]= "Something went wrong."
      redirect_to root_path
    end 
  end
end
