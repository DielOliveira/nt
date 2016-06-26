require 'Lib/lib_autentication'
class ApplicationController < ActionController::Base
	include Auntentication
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :usuario_logado, :user
end
