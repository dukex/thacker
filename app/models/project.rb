class Project < ActiveRecord::Base
  belongs_to :author
  belongs_to :status
end
