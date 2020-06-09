# class ApplicationController < ActionController::Base
# 	include SessionsHelper
# end



class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_order




  #  def set_locale
  # locale = params[:locale].to_s.strip.to_sym
  # I18n.locale = I18n.available_locales.include?(locale) ?
  #   locale : I18n.default_locale
  # end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end









end
