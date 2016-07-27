require 'Lib/lib_autentication'
require 'Lib/lib_utilities'
class ApplicationController < ActionController::Base
	include Auntentication
	include Utilities
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :usuario_logado, :user, :userfinan, :proximaentrada, :rede
end
