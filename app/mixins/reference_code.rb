module ReferenceCode
  LETTERS = ('A'..'Z').to_a.freeze

  def self.generate
    "#{random_letters}-#{random_digits}-#{random_letters}-#{random_digits}-#{random_letters}"
  end

  def self.random_letters
    LETTERS.sample(3).join
  end

  # rubocop:disable Style/RandomWithOffset
  def self.random_digits
    rand(0..99) + (rand(0..8) + 1) * 100
  end
  # rubocop:enable Style/RandomWithOffset
end
