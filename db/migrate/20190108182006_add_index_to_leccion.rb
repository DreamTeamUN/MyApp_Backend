class AddIndexToLeccion < ActiveRecord::Migration[5.2]
  def change
    change_table(:leccions) do |t|
      t.index [:semana, :programa_id], unique: true
    end
  end
end
