class Card < ActiveRecord::Base
  belongs_to :deck

  attr_accessor :content
  
  acts_as_list :scope => :deck
  
  validates :content, presence: {message: "of a card cannot be blank"}
  validates :content, uniqueness: {scope: :deck_id, message: "for that card is already in this deck"}
end
