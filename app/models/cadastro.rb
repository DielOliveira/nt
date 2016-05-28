class Cadastro < ActiveRecord::Base
  belongs_to :operadora
  belongs_to :dadosfinanceiro
end
