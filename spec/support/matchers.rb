def with_a_record(&block)
  describe "with a record" do
    before(:each) { Factory subject.class.to_s.underscore }

    instance_eval &block
  end
end

def should_be_soft_deleted
  it "should be soft deleted" do
    object = Factory subject.class.to_s.underscore
    object.destroy
    subject.class.only_deleted.find(object.id).should_not be_nil
  end
end

def should_be_delivered_on_creation_with(clazz)
  context "on creation" do
    it "should be send on an email" do
      mailer = mock(clazz)
      clazz.should_receive(subject.class.to_s.underscore).with(an_instance_of(subject.class)).and_return(mailer)
      mailer.should_receive :deliver
      Factory subject.class.to_s.underscore
    end
  end
end

def should_allow_only_email_values_for(name)
  should_allow_values_for name, "dc.rec1@gmail.com", "boss@mouseoverstudio.com.br"
  should_not_allow_values_for name, "dc.rec1@gmail.", "boss@mouseoverstudio", "mouseoverstudio"
end

def should_have_url_field(name)
  it "should have #{name} as an URL field"  do
    subject.should respond_to("clean_#{name}_url_field")
  end
end

def should_have_an_slugged_id(name)
  it "should be found by the slugged #{name} as an id" do
    clazz = subject.class
    object = Factory(clazz.to_s.underscore, name => "Hello World")
    clazz.find(object.id).should == clazz.find("hello-world")
  end
end

def should_have_an_id(name)
  it "should have the #{name} as an id" do
    clazz = subject.class
    clazz.find(Factory(clazz.to_s.underscore).send(name)).should_not be_nil
  end
end

def should_have_attached_file(name, opts = {})
  it "should have #{name} as an attached file" do
    (subject.class.attachment_definitions || {})[name].should_not be_nil
  end

  opts.fetch(:styles, {}).each do |style, size|
    it "should have #{name} as an attached file with the #{style} style as #{size}" do
      subject.class.attachment_definitions[name].fetch(:styles, {})[style].should == opts[:styles][style]
    end
  end
end

def should_be_a_tagger
  it "should be a tagger" do
    subject.class.should be_is_tagger
  end
end

def should_be_taggable
  it "should be taggable" do
    subject.class.should be_taggable
  end
end

def should_have_tags_on(*names)
  names.each do |name|
    it "should have #{name} as tags" do
      subject.class.tag_types.should include(name)
    end
  end
end

def should_be_a_state_machine
  it "should be a state machine" do
    subject.class.included_modules.should be_include(AASM)
  end
end

def should_have_default_state(state)
  it "should be #{state} by default" do
    Factory(subject.class.to_s.underscore).aasm_state.should eql(state.to_s)
  end
end

def should_be(state)
  it "should be #{state}" do
    subject.class.aasm_states.map(&:name).should be_include(state)
  end
end

def should_change(opts)
  it "should change from #{opts[:from]} to #{opts[:to]} on ##{opts[:on]}" do
    subject.aasm_state = opts[:from]
    subject.send "#{opts[:on]}"
    subject.aasm_state.should eql(opts[:to].to_s)
  end
end

def should_be_versioned
  it "should be versioned" do
    subject.class.should be_versioned
  end
end

def should_be_audited
  it "should be audited" do
    subject.paper_trail_active.should be_true
  end
end

def should_require_authentication_on_private_actions
  include Devise::TestHelpers

  context "without a logged user" do
    describe "GET index" do
      it "should return 200 as the status code" do
        get :index
        response.code.should eql("200")
      end
    end

    describe "GET new" do
      it "should return 302 as the status code"  do
        get :new
        response.code.should eql("302")
      end
    end

    describe "POST create" do
      it "should return 302 as the status code"  do
        post :create
        response.code.should eql("302")
      end
    end

    describe "GET edit" do
      it "should return 302 as the status code"  do
        get :edit, :id => 30
        response.code.should eql("302")
      end
    end

    describe "PUT update" do
      it "should return 302 as the status code"  do
        put :update, :id => 10
        response.code.should eql("302")
      end
    end

    describe "DELETE destroy" do
      it "should return 302 as the status code" do
        delete :destroy, :id => 20
        response.code.should eql("302")
      end
    end
  end
end

def should_require_authentication
  include Devise::TestHelpers

  context "without a logged user" do
    describe "GET index" do
      it "should return 302 as the status code"  do
        get :index
        response.code.should eql("302")
      end
    end
  end

  context "with a logged user" do
    before :each do
      sign_in Factory(:user)
    end

    describe "GET index" do
      it "should return 200 as the status code"  do
        get :index
        response.code.should eql("200")
      end
    end
  end
end

def should_require_admin_authentication
  include Devise::TestHelpers

  context "with a logged user" do
    before :each do
      sign_in Factory(:user)
    end

    describe "GET index" do
      it "should return 302 as the status code"  do
        get :index
        response.code.should eql("302")
      end
    end
  end

  context "with a logged admin" do
    before :each do
      sign_in Factory(:admin)
    end

    describe "GET index" do
      it "should return 200 as the status code"  do
        get :index
        response.code.should eql("200")
      end
    end
  end
end

def should_require_admin_authentication_on_private_actions
  include Devise::TestHelpers

  context "with a logged user" do
    before :each do
      sign_in Factory(:user)
    end

    describe "GET index" do
      it "should return 200 as the status code" do
        get :index
        response.code.should eql("200")
      end
    end

    describe "POST create" do
      it "should return 302 as the status code"  do
        post :create
        response.code.should eql("302")
      end
    end

    describe "PUT update" do
      it "should return 302 as the status code"  do
        put :update, :id => 10
        response.code.should eql("302")
      end
    end

    describe "DELETE destroy" do
      it "should return 302 as the status code" do
        delete :destroy, :id => 20
        response.code.should eql("302")
      end
    end

    describe "GET new" do
      it "should return 302 as the status code" do
        get :new
        response.code.should eql("302")
      end
    end

    describe "GET edit" do
      it "should return 302 as the status code" do
        get :edit, :id => 10
        response.code.should eql("302")
      end
    end
  end
end

def should_have_only_public_actions
  %w(index show).each do |action|
    it "should respond to GET #{action}" do
      subject.should respond_to(action)
    end
  end

  %w(edit update destroy).each do |action|
    it "should not respond to #{action}" do
      subject.should_not respond_to(action)
    end
  end
end

def without_a_logged_user(&block)
  context "without a logged user" do
    instance_eval &block
  end
end

def with_a_logged_user(&block)
  include Devise::TestHelpers

  context "with a logged user" do
    let(:user) { Factory :user }

    before :each do
      sign_in user
    end

    instance_eval &block
  end
end

def post_create_should_set_the_current_user_as_the_owner
  describe "POST create" do
    it "should set the current user as the owner" do
      model = described_class.to_s.gsub("Controller", "").underscore.singularize
      params = Factory.build(model, :user_id => Factory(:user).id).attributes
      post :create, model => params
      assigns(model.to_sym).user.should == user
    end
  end
end

def should_be_updated_without_confirming_the_password
  context "on update_with_password" do
    let(:user) { Factory :user }
    let(:name) { "Ronaldo" }

    it "should update the user without providing a password nor a password confirmation" do
      user.update_with_password(:password => '', :password_confirmation => '', :first_name => name)
      user.reload
      user.first_name.should eql(name)
    end

    it "should update the user without providing a password and providing a password confirmation" do
      user.update_with_password(:password => '', :password_confirmation => 'abc123', :first_name => name)
      user.reload
      user.first_name.should eql(name)
    end
  end
end
