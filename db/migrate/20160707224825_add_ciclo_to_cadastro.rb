class AddCicloToCadastro < ActiveRecord::Migration
  def change
    add_reference :cadastros, :ciclo, index: true, foreign_key: true
  end
end
