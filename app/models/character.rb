class Character < ActiveRecord::Base
  belongs_to :television_show

  validates :role,
    presence: true
end
