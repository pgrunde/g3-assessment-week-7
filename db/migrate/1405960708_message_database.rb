class MessageDatabase < ActiveRecord::Migration
  def up
    # add migration code here
    create_table :messages do |t|
      t.string :name
      t.string :message
    end
  end

  def down
    # add reverse migration code here
    drop_table :messages
  end
end
