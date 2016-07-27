class Reentrada < ActiveRecord::Base

  belongs_to :cadastro_reentrando, :class_name => "Cadastro"
  belongs_to :cadastro_adicionado, :class_name => "Cadastro"
  belongs_to :cadastro_principal, :class_name => "Cadastro"
  
end
