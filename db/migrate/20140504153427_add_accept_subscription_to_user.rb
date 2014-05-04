class AddAcceptSubscriptionToUser < ActiveRecord::Migration
  def up
    add_column :users, :accept_subscription, :boolean, default: true
  end

  def down
    remove_column :users, :accept_subscription
  end
end
