class AddQtdreentradasparareentradasToCiclos < ActiveRecord::Migration
  def change
    add_column :ciclos, :qtdreentradasparareentradas, :integer
  end
end
