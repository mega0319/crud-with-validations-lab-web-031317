class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { :scope  => [:release_year, :artist_name] }
  validates :released, inclusion: { in:[true, false] }
  validates :artist_name, presence: true
  with_options if: :released do |x|
    x.validates  :release_year, presence: true
    x.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end

end
