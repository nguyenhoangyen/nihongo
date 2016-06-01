class User < ActiveRecord::Base
  has_many :decks, :dependent => :destroy
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "cannot be blank"}, :uniqueness => true, :format => {:with => VALID_EMAIL_REGEX }
  
  has_secure_password
  validates :password, presence: {message: "cannot be blank"}, :on => :create
  
  after_create :build_reg_hash
  
  def build_reg_hash
    update_attribute( :reg_hash, Digest::SHA256.hexdigest( self.email + self.id.to_s ) )
    # self.reg_hash = Digest::SHA256.hexdigest( self.email + self.id.to_s )
    # self.save
  end
end
