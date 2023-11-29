class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.belongs_to :group, index: true
      t.bigint :author_id
      t.string :name
      t.decimal :amount
      t.timestamps
    end

    add_foreign_key :entities, :groups, column: :group_id
    add_foreign_key :entities, :users, column: :author_id
  end
end