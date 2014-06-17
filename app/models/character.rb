class Character < ActiveRecord::Base
  belongs_to :television_show
  belongs_to :actor

  validates :role,
    presence: true,
    uniqueness: true
end
