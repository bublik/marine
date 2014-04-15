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

describe VesselTypesController do

  # This should return the minimal set of attributes required to create a valid
  # VesselType. As you add validations to VesselType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VesselTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vessel_types as @vessel_types" do
      vessel_type = VesselType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vessel_types).should eq([vessel_type])
    end
  end

  describe "GET show" do
    it "assigns the requested vessel_type as @vessel_type" do
      vessel_type = VesselType.create! valid_attributes
      get :show, {:id => vessel_type.to_param}, valid_session
      assigns(:vessel_type).should eq(vessel_type)
    end
  end

  describe "GET new" do
    it "assigns a new vessel_type as @vessel_type" do
      get :new, {}, valid_session
      assigns(:vessel_type).should be_a_new(VesselType)
    end
  end

  describe "GET edit" do
    it "assigns the requested vessel_type as @vessel_type" do
      vessel_type = VesselType.create! valid_attributes
      get :edit, {:id => vessel_type.to_param}, valid_session
      assigns(:vessel_type).should eq(vessel_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VesselType" do
        expect {
          post :create, {:vessel_type => valid_attributes}, valid_session
        }.to change(VesselType, :count).by(1)
      end

      it "assigns a newly created vessel_type as @vessel_type" do
        post :create, {:vessel_type => valid_attributes}, valid_session
        assigns(:vessel_type).should be_a(VesselType)
        assigns(:vessel_type).should be_persisted
      end

      it "redirects to the created vessel_type" do
        post :create, {:vessel_type => valid_attributes}, valid_session
        response.should redirect_to(VesselType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vessel_type as @vessel_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        VesselType.any_instance.stub(:save).and_return(false)
        post :create, {:vessel_type => { "name" => "invalid value" }}, valid_session
        assigns(:vessel_type).should be_a_new(VesselType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VesselType.any_instance.stub(:save).and_return(false)
        post :create, {:vessel_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vessel_type" do
        vessel_type = VesselType.create! valid_attributes
        # Assuming there are no other vessel_types in the database, this
        # specifies that the VesselType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VesselType.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => vessel_type.to_param, :vessel_type => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested vessel_type as @vessel_type" do
        vessel_type = VesselType.create! valid_attributes
        put :update, {:id => vessel_type.to_param, :vessel_type => valid_attributes}, valid_session
        assigns(:vessel_type).should eq(vessel_type)
      end

      it "redirects to the vessel_type" do
        vessel_type = VesselType.create! valid_attributes
        put :update, {:id => vessel_type.to_param, :vessel_type => valid_attributes}, valid_session
        response.should redirect_to(vessel_type)
      end
    end

    describe "with invalid params" do
      it "assigns the vessel_type as @vessel_type" do
        vessel_type = VesselType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VesselType.any_instance.stub(:save).and_return(false)
        put :update, {:id => vessel_type.to_param, :vessel_type => { "name" => "invalid value" }}, valid_session
        assigns(:vessel_type).should eq(vessel_type)
      end

      it "re-renders the 'edit' template" do
        vessel_type = VesselType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VesselType.any_instance.stub(:save).and_return(false)
        put :update, {:id => vessel_type.to_param, :vessel_type => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vessel_type" do
      vessel_type = VesselType.create! valid_attributes
      expect {
        delete :destroy, {:id => vessel_type.to_param}, valid_session
      }.to change(VesselType, :count).by(-1)
    end

    it "redirects to the vessel_types list" do
      vessel_type = VesselType.create! valid_attributes
      delete :destroy, {:id => vessel_type.to_param}, valid_session
      response.should redirect_to(vessel_types_url)
    end
  end

end
