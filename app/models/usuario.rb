class Usuario < ActiveRecord::Base
  belongs_to :cadastro


validates :email, :presence => { :message => 'é obrigatório.' }  
validates :senha, :presence => { :message => 'é obrigatório.' }  
validates :descconfirmasenha, :presence => { :message => 'é obrigatório.' }

#validate :busca_email_existente
validate :check_senha_and_confirmation


def descconfirmasenha
  @descconfirmasenha
end


# setter
def descconfirmasenha=(val)
  @descconfirmasenha = val
end 


def busca_email_existente
	errors.add(:email, "já está sendo utilizado.") if Usuario.find_by_email(self.email)
end		

def check_senha_and_confirmation
  	errors.add(:descconfirmasenha, "não foi digitado corretamente.") if self.senha != self.descconfirmasenha
end

end
