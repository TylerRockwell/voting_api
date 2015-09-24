class Voter < ActiveRecord::Base
  before_create :generate_token
  has_one :vote

  validates :name, presence: :true
  validates :party, presence: :true

  private

  def generate_token
    self.access_token=ApiKey.create.access_token
  end
end
