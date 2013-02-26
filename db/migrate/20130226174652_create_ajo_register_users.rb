class CreateAjoRegisterUsers < ActiveRecord::Migration
  def change
    create_table :ajo_register_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :mailing_address
      t.string :city
      t.string :province
      t.boolean :rules_and_regulations
      t.boolean :opt_in
      t.boolean :age_of_consent

      t.timestamps
    end
  end
end
