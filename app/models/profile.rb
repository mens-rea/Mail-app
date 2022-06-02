class Profile < ApplicationRecord
include Visible

    has_many :comments, dependent: :destroy

    validates :name, presence: true
    validates :age, presence: true, length: { maximum: 3}
end
