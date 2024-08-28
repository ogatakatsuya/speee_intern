# frozen_string_literal: true

class Normalizer
  def self.normalize(value, min, max)
    (value - min) / (max - min)
  end

  def self.denormalize(value, min, max)
    (value * (max - min)) + min
  end
end
