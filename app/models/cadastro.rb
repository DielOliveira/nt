#encoding: utf-8
class Cadastro < ActiveRecord::Base

	#mount_uploader :avatar, AvatarUploader
	
	belongs_to :operadora
	belongs_to :ciclo
	belongs_to :dadosfinanceiro
	has_many :dadosfinanceiros, dependent: :destroy
	has_many :usuarios, dependent: :destroy
	has_many :redes, dependent: :destroy

	has_many :primary_doacaos, :class_name => "Doacao", :foreign_key => "cadastro_doador_id"
	has_many :secondary_doacaos, :class_name => "Doacao", :foreign_key => "cadastro_recebedor_id" 
	has_many :tertiary_doacaos, :class_name => "Doacao", :foreign_key => "cadastro_principal_id" 

	has_many :primary_reentradas, :class_name => "Reentrada", :foreign_key => "cadastro_reentrando_id"
	has_many :secondary_reentradas, :class_name => "Reentrada", :foreign_key => "cadastro_adicionado_id" 
	has_many :tertiary_reentradas, :class_name => "Reentrada", :foreign_key => "cadastro_principal_id" 	

	has_many :primary_mensagems, :class_name => "Doacao", :foreign_key => "cadastro_1_id"
	has_many :secondary_mensagems, :class_name => "Doacao", :foreign_key => "cadastro_2_id"  	 


	validate :busca_email_existente, :on => :create
	#validate :validacpf, :on => :create
	validates_cpf :cpf, :on => :create
	validates :email, email_format: { message: "não é válido." }
	validates :descconfirmaemail, :presence => { :message => 'é obrigatório.' }

	validates :nomepessoa, :presence => { :message => 'é obrigatório.' }  
	validates :email, :presence => true, :uniqueness => true, :on => :create
	validate :check_email_and_confirmation


	validates :telefone, :presence => { :message => 'é obrigatório.' }  
	validates :operadora_id, :presence => { :message => 'é obrigatório.' } 

	def validacpf
		if self.flagreentrada == false
			errors.add(:cpf, "já está sendo utilizado.") if Cadastro.find_by_cpf(self.cpf)
		end
	end	

	def busca_email_existente
		if not Cadastro.all.empty?
			errors.add(:cpfpadrinho, "não existe no sistema.") if not Usuario.find_by_email(self.cpfpadrinho)
		end
	end		


	def cpfpadrinho
	  @cpfpadrinho
	end


	# setter
	def cpfpadrinho=(val)
	  @cpfpadrinho = val
	end 

	def descconfirmaemail
	  @descconfirmaemail
	end


	# setter
	def descconfirmaemail=(val)
	  @descconfirmaemail = val
	end 

	def check_email_and_confirmation
	  	errors.add(:descconfirmaemail, "não foi digitado corretamente.") if self.email != self.descconfirmaemail
	end	

end
