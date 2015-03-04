class AddFinalDetailsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :course, :string
    add_column :students, :track, :string
    add_column :students, :specialization, :string
    add_column :students, :email_address, :string
    add_column :students, :contact_number, :string
    add_column :students, :advisement_accomplished, :boolean
  end
end
