namespace :db do
  desc "Bootstraps the database with demo data"
  task :bootstrap => %w(db:setup) do
    I18n.locale = :en
    i = 0
    10.times.each do
      i = i+1
      name = Faker::Name.name
      User.create! :email => "user#{i}@thacker.com", :password => "abc123", :name => name
    end

    30.times.each do
      Post.create! :title => Faker::Lorem.sentence, :body => Faker::Lorem.paragraph(5), :user => User.all.shuffle!.first
    end

    30.times.each do
      Event.create! :name => Faker::Lorem.sentence, :author => User.all.shuffle!.first, :about =>  Faker::Lorem.paragraph(5)
    end
  end
end
