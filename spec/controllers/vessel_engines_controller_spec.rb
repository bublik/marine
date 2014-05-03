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

describe VesselEnginesController do

  # This should return the minimal set of attributes required to create a valid
  # VesselEngine. As you add validations to VesselEngine, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VesselEnginesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vessel_engines as @vessel_engines" do
      vessel_engine = VesselEngine.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vessel_engines).should eq([vessel_engine])
    end
  end

  describe "GET show" do
    it "assigns the requested vessel_engine as @vessel_engine" do
      vessel_engine = VesselEngine.create! valid_attributes
      get :show, {:id => vessel_engine.to_param}, valid_session
      assigns(:vessel_engine).should eq(vessel_engine)
    end
  end

  describe "GET new" do
    it "assigns a new vessel_engine as @vessel_engine" do
      get :new, {}, valid_session
      assigns(:vessel_engine).should be_a_new(VesselEngine)
    end
  end

  describe "GET edit" do
    it "assigns the requested vessel_engine as @vessel_engine" do
      vessel_engine = VesselEngine.create! valid_attributes
      get :edit, {:id => vessel_engine.to_param}, valid_session
      assigns(:vessel_engine).should eq(vessel_engine)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VesselEngine" do
        expect {
          post :create, {:vessel_engine => valid_attributes}, valid_session
        }.to change(VesselEngine, :count).by(1)
      end

      it "assigns a newly created vessel_engine as @vessel_engine" do
        post :create, {:vessel_engine => valid_attributes}, valid_session
        assigns(:vessel_engine).should be_a(VesselEngine)
        assigns(:vessel_engine).should be_persisted
      end

      it "redirects to the created vessel_engine" do
        post :create, {:vessel_engine => valid_attributes}, valid_session
        response.should redirect_to(VesselEngine.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vessel_engine as @vessel_engine" do
        # Trigger the behavior that occurs when invalid params are submitted
        VesselEngine.any_instance.stub(:save).and_return(false)
        post :create, {:vessel_engine => { "name" => "invalid value" }}, valid_session
        assigns(:vessel_engine).should be_a_new(VesselEngine)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VesselEngine.any_instance.stub(:save).and_return(false)
        post :create, {:vessel_engine => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vessel_engine" do
        vessel_engine = VesselEngine.create! valid_attributes
        # Assuming there are no other vessel_engines in the database, this
        # specifies that the VesselEngine created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VesselEngine.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => vessel_engine.to_param, :vessel_engine => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested vessel_engine as @vessel_engine" do
        vessel_engine = VesselEngine.create! valid_attributes
        put :update, {:id => vessel_engine.to_param, :vessel_engine => valid_attributes}, valid_session
        assigns(:vessel_engine).should eq(vessel_engine)
      end

      it "redirects to the vessel_engine" do
        vessel_engine = VesselEngine.create! valid_attributes
        put :update, {:id => vessel_engine.to_param, :vessel_engine => valid_attributes}, valid_session
        response.should redirect_to(vessel_engine)
      end
    end

    describe "with invalid params" do
      it "assigns the vessel_engine as @vessel_engine" do
        vessel_engine = VesselEngine.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VesselEngine.any_instance.stub(:save).and_return(false)
        put :update, {:id => vessel_engine.to_param, :vessel_engine => { "name" => "invalid value" }}, valid_session
        assigns(:vessel_engine).should eq(vessel_engine)
      end

      it "re-renders the 'edit' template" do
        vessel_engine = VesselEngine.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VesselEngine.any_instance.stub(:save).and_return(false)
        put :update, {:id => vessel_engine.to_param, :vessel_engine => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vessel_engine" do
      vessel_engine = VesselEngine.create! valid_attributes
      expect {
        delete :destroy, {:id => vessel_engine.to_param}, valid_session
      }.to change(VesselEngine, :count).by(-1)
    end

    it "redirects to the vessel_engines list" do
      vessel_engine = VesselEngine.create! valid_attributes
      delete :destroy, {:id => vessel_engine.to_param}, valid_session
      response.should redirect_to(vessel_engines_url)
    end
  end

end