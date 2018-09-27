class CreateEstudianteAulas < ActiveRecord::Migration[5.2]
  def change
    create_table :estudiante_aulas do |t|

      t.references :aula , foreign_key: true, null: false
      t.references :estudiante , foreign_key: true, null: false

      t.timestamps
    end
  end
end
