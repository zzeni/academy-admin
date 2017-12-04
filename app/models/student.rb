class Student < ApplicationRecord
  has_and_belongs_to_many :courses

  has_attached_file :picture,
                    styles: { medium: "300x300#", thumb: "100x100#" },
                    default_url: ":style/missing.png"

  validates_attachment :picture,
                       content_type: { content_type: "image/jpeg" },
                       size: { in: 0..2.megabytes }

  validates :first_name, presence: true, length: { in: 3..15 }
  validates :last_name, presence: true, length: { in: 3..15 }
  validates :email, presence: true

  before_save :validate_courses_count


  rails_admin do
    edit do
      field :first_name
      field :last_name
      field :email

    end

  end

  private
  def validate_courses_count
    errors.add("sjrgbv") if askjr
  end
end
