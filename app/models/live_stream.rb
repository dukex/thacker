class LiveStream < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :post
  belongs_to :event

  validates_presence_of :user

  default_scope :order => "id DESC"

  def type
    self.class.name.tableize.split("_")[0]
  end
end
