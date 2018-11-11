class ChangeTableEntrada < ActiveRecord::Migration[5.2]
  def change

    change_column_default :entradas, :resumen, ""

    change_table(:entradas) do |t|
      t.string :texto, default: ""
      t.boolean :oculta, default: false

      t.remove_references :archivo

      t.index [:created_at]
      t.index [:updated_at]
    end
  end
end
