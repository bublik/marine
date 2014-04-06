require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MaritalsController do

  # This should return the minimal set of attributes required to create a valid
  # Marital. As you add validations to Marital, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MaritalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all maritals as @maritals" do
      marital = Marital.create! valid_attributes
      get :index, {}, valid_session
      assigns(:maritals).should eq([marital])
    end
  end

  describe "GET show" do
    it "assigns the requested marital as @marital" do
      marital = Marital.create! valid_attributes
      get :show, {:id => marital.to_param}, valid_session
      assigns(:marital).should eq(marital)
    end
  end

  describe "GET new" do
    it "assigns a new marital as @marital" do
      get :new, {}, valid_session
      assigns(:marital).should be_a_new(Marital)
    end
  end

  describe "GET edit" do
    it "assigns the requested marital as @marital" do
      marital = Marital.create! valid_attributes
      get :edit, {:id => marital.to_param}, valid_session
      assigns(:marital).should eq(marital)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Marital" do
        expect {
          post :create, {:marital => valid_attributes}, valid_session
        }.to change(Marital, :count).by(1)
      end

      it "assigns a newly created marital as @marital" do
        post :create, {:marital => valid_attributes}, valid_session
        assigns(:marital).should be_a(Marital)
        assigns(:marital).should be_persisted
      end

      it "redirects to the created marital" do
        post :create, {:marital => valid_attributes}, valid_session
        response.should redirect_to(Marital.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved marital as @marital" do
        # Trigger the behavior that occurs when invalid params are submitted
        Marital.any_instance.stub(:save).and_return(false)
        post :create, {:marital => { "name" => "invalid value" }}, valid_session
        assigns(:marital).should be_a_new(Marital)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Marital.any_instance.stub(:save).and_return(false)
        post :create, {:marital => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested marital" do
        marital = Marital.create! valid_attributes
        # Assuming there are no other maritals in the database, this
        # specifies that the Marital created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Marital.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => marital.to_param, :marital => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested marital as @marital" do
        marital = Marital.create! valid_attributes
        put :update, {:id => marital.to_param, :marital => valid_attributes}, valid_session
        assigns(:marital).should eq(marital)
      end

      it "redirects to the marital" do
        marital = Marital.create! valid_attributes
        put :update, {:id => marital.to_param, :marital => valid_attributes}, valid_session
        response.should redirect_to(marital)
      end
    end

    describe "with invalid params" do
      it "assigns the marital as @marital" do
        marital = Marital.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Marital.any_instance.stub(:save).and_return(false)
        put :update, {:id => marital.to_param, :marital => { "name" => "invalid value" }}, valid_session
        assigns(:marital).should eq(marital)
      end

      it "re-renders the 'edit' template" do
        marital = Marital.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Marital.any_instance.stub(:save).and_return(false)
        put :update, {:id => marital.to_param, :marital => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested marital" do
      marital = Marital.create! valid_attributes
      expect {
        delete :destroy, {:id => marital.to_param}, valid_session
      }.to change(Marital, :count).by(-1)
    end

    it "redirects to the maritals list" do
      marital = Marital.create! valid_attributes
      delete :destroy, {:id => marital.to_param}, valid_session
      response.should redirect_to(maritals_url)
    end
  end

end
