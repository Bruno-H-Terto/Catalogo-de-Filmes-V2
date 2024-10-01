class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :gender
  has_one_attached :photo

  validates :name, :length, :synopsis, :year, presence: true

  validate :must_lenght
  validate :must_year


  enum status: { draft: 0, published: 5 }

  def must_lenght
    if self.length.nil? || self.length < 0
      errors.add(:length, "deve ter duração válida.")
    end
  end

  def must_year
    if self.year.nil? || self.year < 1900
      errros.add(:year, "deve ser uma data válida.")
    end
  end
end
