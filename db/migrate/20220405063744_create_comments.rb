class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :message

      t.references :account
      t.references :post
      t.timestamps
    end
  end
end
