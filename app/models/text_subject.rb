class TextSubject < ActiveRecord::Base
belongs_to :shout
belongs_to :user

  def body=(new_body)
    self[:body] = new_body.upcase
  end
end
