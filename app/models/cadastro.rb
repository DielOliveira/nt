#encoding: utf-8
class Cadastro < ActiveRecord::Base
  belongs_to :operadora
  belongs_to :dadosfinanceiro
  has_many :dadosfinanceiros, dependent: :destroy
  has_many :usuarios, dependent: :destroy


validates :nomepessoa, :presence => { :message => 'é obrigatório.' }  
validates :email, :presence => { :message => 'é obrigatório.' }  
validates :telefone, :presence => { :message => 'é obrigatório.' }  
validates :operadora_id, :presence => { :message => 'é obrigatório.' }  


end
