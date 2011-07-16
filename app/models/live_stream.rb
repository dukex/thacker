class LiveStream < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :post

  def type
    self.class.name.tableize.split("_")[0]
  end
end
