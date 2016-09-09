class Dadosfinanceiro < ActiveRecord::Base
  belongs_to :banco
  belongs_to :contabancariatipo
  belongs_to :cadastro


  #validates :nometitular, :presence => { :message => 'é obrigatório.' }  
  #validates :contapicpay, :presence => { :message => 'é obrigatório.' }  
  #validates :cpftitular, :presence => { :message => 'é obrigatório.' }  
  #validates :banco_id, :presence => { :message => 'é obrigatório.' }  
  #validates :banco_id, :presence => { :message => 'é obrigatório.' }  
  #validates :agencia, :presence => { :message => 'é obrigatório.' }  
  #validates :operacao, :presence => { :message => 'é obrigatório.' }  
  #validates :contabancariatipo_id, :presence => { :message => 'é obrigatório.' }

  #validates :agencia, :numericality => {:only_integer => true}  
  #validates :operacao, :numericality => {:only_integer => true}  
  #validates :codigo, :numericality => {:only_integer => true}  
  #validates :emailsuperconta, :allow_blank => true, email_format: { message: "não é válido." }
  #validates_cpf :cpftitular


end
