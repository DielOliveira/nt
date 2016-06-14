class Dadosfinanceiro < ActiveRecord::Base
  belongs_to :banco
  belongs_to :contabancariatipo
  belongs_to :cadastro


  validates :nometitular, :presence => { :message => 'é obrigatório.' }  
  validates :cpftitular, :presence => { :message => 'é obrigatório.' }  
  validates :banco_id, :presence => { :message => 'é obrigatório.' }  
  validates :banco_id, :presence => { :message => 'é obrigatório.' }  
  validates :agencia, :presence => { :message => 'é obrigatório.' }  
  validates :operacao, :presence => { :message => 'é obrigatório.' }  
  validates :contabancariatipo_id, :presence => { :message => 'é obrigatório.' }  


end
