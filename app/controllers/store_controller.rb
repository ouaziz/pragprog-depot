class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @counter = increment_count
    end
  end
  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end
  
  def sendmail
    OrderNotifier.test.deliver 
    rescue  Exception => e
    logger.warn "email delivery error = #{e}"
  end
end
