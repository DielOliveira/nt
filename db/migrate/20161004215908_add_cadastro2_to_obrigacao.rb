class AddCadastro2ToObrigacao < ActiveRecord::Migration
  def change
    add_column :obrigacaos, :cadastro_adicionado_id, :integer
  end
end
