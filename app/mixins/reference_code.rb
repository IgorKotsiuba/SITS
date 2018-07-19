module ReferenceCode
  LETTERS = ('A'..'Z').to_a.freeze
  NUMBERS = (0..9).to_a.freeze

  def self.generate
    "#{random_letters}-#{random_digits}-#{random_letters}-#{random_digits}-#{random_letters}"
  end

  def self.random_letters
    LETTERS.sample(3).join
  end

  def self.random_digits
    NUMBERS.sample(3).join.to_i
  end
end
