class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :set_locale, :set_currency

	def set_locale
		if(params[:locale].present? && !session[:locale].present?)
			I18n.locale = params[:locale] || I18n.default_locale
			session[:locale] = params[:locale]
		end

		if(!params[:locale].present? && session[:locale].present?)
			I18n.locale = session[:locale]
		end

		if(params[:locale].present? && session[:locale].present?)
			I18n.locale = params[:locale] || I18n.default_locale
			session[:locale] = params[:locale]
		end
	end

	def set_currency
		if session[:locale] == 'es'
			session[:currency] = '&euro;'
		else
			session[:currency] = '$'
		end
	end
end
