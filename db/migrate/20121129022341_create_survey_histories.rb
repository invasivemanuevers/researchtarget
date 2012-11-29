class CreateSurveyHistories < ActiveRecord::Migration
  def change
    create_table :survey_histories do |t|
      t.integer :user_id
      t.integer :completed_by
      t.integer :score

      t.timestamps
    end
  end
end
