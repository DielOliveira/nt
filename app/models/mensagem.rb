class Mensagem < ActiveRecord::Base

	belongs_to :cadastro_1, :class_name => "Cadastro"
	belongs_to :cadastro_2, :class_name => "Cadastro"
end
