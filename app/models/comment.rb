class Comment < ApplicationRecord
include Visible

  belongs_to :profile
end
