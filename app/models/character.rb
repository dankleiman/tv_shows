class Character < ActiveRecord::Base
  belongs_to :television_show

  validates :title,
    presence: true
end
