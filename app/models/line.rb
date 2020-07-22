# frozen_string_literal: true

class Line < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place
end
