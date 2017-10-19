class Response < ApplicationRecord
  belongs_to :answer_choice,
  foreign_key: :answer_choice_id,
  primary_key: :id,
  class_name: :AnswerChoice

  belongs_to :respondent,
  foreign_key: :respondent_id,
  primary_key: :id,
  class_name: :User

  has_one :question,
  through: :answer_choice,
  source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def not_duplicate_response

  end

end
