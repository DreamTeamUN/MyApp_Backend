class CreateProgresos < ActiveRecord::Migration[5.2]
  def change
    create_table :progresos do |t|
      t.integer :repeticion_completada

      t.timestamps
    end
  end
end
