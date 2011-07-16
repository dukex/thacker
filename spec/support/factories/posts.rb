Factory.define :post do |f|
  f.title "Lorem Ipsum"
  f.body "This is a Body"
  f.association :user
end
