#encoding: utf-8
class Cadastro < ActiveRecord::Base
  belongs_to :operadora
  belongs_to :dadosfinanceiro



validates :nomepessoa, :presence => { :message => 'é obrigatorio.' }  
validates :email, :presence => { :message => 'é obrigatorio.' }  
validates :telefone, :presence => { :message => 'é obrigatorio.' }  
validates :operadora_id, :presence => { :message => 'é obrigatorio.' }  


end
