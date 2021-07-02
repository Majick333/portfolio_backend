class CreateContactRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :message
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
