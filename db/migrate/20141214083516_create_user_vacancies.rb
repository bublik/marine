class CreateUserVacancies < ActiveRecord::Migration
  def change
    create_table :user_vacancies do |t|
      t.references :user, index: true
      t.references :vacancy, index: true
      t.string :status

      t.timestamps
    end
  end
end
