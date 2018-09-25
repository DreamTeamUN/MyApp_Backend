class CreateDocenteProgramas < ActiveRecord::Migration[5.2]
  def change
    create_table :docente_programas do |t|

      t.timestamps
    end
  end
end
