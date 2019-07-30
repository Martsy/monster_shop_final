class AddUserToLocales < ActiveRecord::Migration[5.1]
  def change
    add_reference :locales, :user, foreign_key: true
  end
end
