class AddCadastroIdToRede < ActiveRecord::Migration
  def change
    add_reference :redes, :cadastro, index: true, foreign_key: true
  end
end
