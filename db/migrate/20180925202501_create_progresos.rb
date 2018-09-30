class CreateProgresos < ActiveRecord::Migration[5.2]
  def change
    create_table :progresos do |t|

      t.integer :repeticion_completada, null: false, default: 0

      t.references :estudiante , foreign_key: true, null: false
      t.references :leccion , foreign_key: true, null: false

      t.timestamps

    end
  end
end
