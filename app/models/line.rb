# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :user
  belongs_to :place
end
