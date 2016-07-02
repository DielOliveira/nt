class AddObservacaoToDoacao < ActiveRecord::Migration
  def change
    add_column :doacaos, :observacao, :string
  end
end
