class Member < ApplicationRecord
  belongs_to :campaign
  after_create :set_campaign_pending
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  def set_pixel
    self.open = false
    self.token = loop do
                   random_token = SecureRandom.urlsafe_base64(nil, false)
                   break random_token unless Member.exists?(token: random_token)
                 end
    self.save!
  end
  
  protected
  
  def set_campaign_pending
    self.campaign.update(status: :pending)
  end
end
