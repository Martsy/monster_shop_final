class CreateLocales < ActiveRecord::Migration[5.1]
  def change
    create_table :locales do |t|
      t.string :nickname
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
