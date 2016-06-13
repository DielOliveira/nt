class RemoveDadosfinanceirosIdFromCadastro < ActiveRecord::Migration
  def change
    remove_reference :cadastros, :dadosfinanceiro, index: true, foreign_key: true
  end
end
