class AddCadastroToDadosfinanceiro < ActiveRecord::Migration
  def change
    add_reference :dadosfinanceiros, :cadastro, index: true, foreign_key: true
  end
end
