class CreateMasks < ActiveRecord::Migration[5.1]
  def change
    create_table :masks do |t|
      t.string :areaId
      t.numeric :amount

      t.timestamps
    end
  end
end
