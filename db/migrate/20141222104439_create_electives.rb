class CreateElectives < ActiveRecord::Migration
  def change
    create_table :electives, :id => false do |t|
      t.string :elective_code, :null => false
      t.timestamps
    end
<<<<<<< HEAD
    execute "ALTER TABLE electives ADD PRIMARY KEY (elective_code);"
=======
    #execute "ALTER TABLE electives ADD PRIMARY KEY (elective_code);"
>>>>>>> 2639412c2fa7e13b337159a1feecb3346ecc7dfd
  end
end
