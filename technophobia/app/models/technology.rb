class Technology < ActiveRecord::Base
  has_one :technology_type
  has_one :language
end
