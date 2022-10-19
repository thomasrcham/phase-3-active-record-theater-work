class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map { |a| a.actor }
  end

  def locations
    self.auditions.map { |a| a.location }
  end

  def lead
    if self.auditions.find_by(hired: true)
    else
      "no actor has been hired for this role"
    end
  end
end
