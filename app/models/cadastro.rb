#encoding: utf-8
class Cadastro < ActiveRecord::Base
  belongs_to :operadora
  belongs_to :dadosfinanceiro
  has_many :dadosfinanceiros, dependent: :destroy
  has_many :usuarios, dependent: :destroy
  has_many :redes, dependent: :destroy

  has_many :primary_doacaos, :class_name => "Doacao", :foreign_key => "cadastro_1_id"
  has_many :secondary_doacaos, :class_name => "Doacao", :foreign_key => "cadastro_2_id"  


validates :nomepessoa, :presence => { :message => 'é obrigatório.' }  
validates :email, :presence => { :message => 'é obrigatório.' }  
validates :telefone, :presence => { :message => 'é obrigatório.' }  
validates :operadora_id, :presence => { :message => 'é obrigatório.' }  

def cpfpadrinho
  @cpfpadrinho
end


# setter
def cpfpadrinho=(val)
  @cpfpadrinho = val
end 


end
