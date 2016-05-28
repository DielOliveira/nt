class Dadosfinanceiro < ActiveRecord::Base
  belongs_to :banco
  belongs_to :contabancariatipo
end
