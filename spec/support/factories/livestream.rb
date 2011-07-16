Factory.define :live_stream do |f|
end


Factory.define :user_live_stream, :parent => :live_stream, :class => "UserLiveStream" do |f|
  f.association :user
end

Factory.define :post_live_stream, :parent => :live_stream, :class => "PostLiveStream" do |f|
  f.association :user
  f.association :post
end

Factory.define :project_live_stream, :parent => :live_stream, :class => "ProjectLiveStream" do |f|
end

