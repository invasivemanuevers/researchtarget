class CreateSurveyAssignments < ActiveRecord::Migration
  def change
    create_table :survey_assignments do |t|
      t.integer :survey_id
      t.integer :user_id
      t.integer :assigned_to

      t.timestamps
    end
  end
end
