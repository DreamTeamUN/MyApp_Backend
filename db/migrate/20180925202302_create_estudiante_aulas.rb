class CreateEstudianteAulas < ActiveRecord::Migration[5.2]
  def change
    create_table :estudiante_aulas do |t|

      t.timestamps
    end
  end
end
