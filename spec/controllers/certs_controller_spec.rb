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

describe CertsController do

  # This should return the minimal set of attributes required to create a valid
  # Cert. As you add validations to Cert, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CertsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all certs as @certs" do
      cert = Cert.create! valid_attributes
      get :index, {}, valid_session
      assigns(:certs).should eq([cert])
    end
  end

  describe "GET show" do
    it "assigns the requested cert as @cert" do
      cert = Cert.create! valid_attributes
      get :show, {:id => cert.to_param}, valid_session
      assigns(:cert).should eq(cert)
    end
  end

  describe "GET new" do
    it "assigns a new cert as @cert" do
      get :new, {}, valid_session
      assigns(:cert).should be_a_new(Cert)
    end
  end

  describe "GET edit" do
    it "assigns the requested cert as @cert" do
      cert = Cert.create! valid_attributes
      get :edit, {:id => cert.to_param}, valid_session
      assigns(:cert).should eq(cert)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cert" do
        expect {
          post :create, {:cert => valid_attributes}, valid_session
        }.to change(Cert, :count).by(1)
      end

      it "assigns a newly created cert as @cert" do
        post :create, {:cert => valid_attributes}, valid_session
        assigns(:cert).should be_a(Cert)
        assigns(:cert).should be_persisted
      end

      it "redirects to the created cert" do
        post :create, {:cert => valid_attributes}, valid_session
        response.should redirect_to(Cert.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cert as @cert" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cert.any_instance.stub(:save).and_return(false)
        post :create, {:cert => { "name" => "invalid value" }}, valid_session
        assigns(:cert).should be_a_new(Cert)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cert.any_instance.stub(:save).and_return(false)
        post :create, {:cert => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cert" do
        cert = Cert.create! valid_attributes
        # Assuming there are no other certs in the database, this
        # specifies that the Cert created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Cert.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => cert.to_param, :cert => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested cert as @cert" do
        cert = Cert.create! valid_attributes
        put :update, {:id => cert.to_param, :cert => valid_attributes}, valid_session
        assigns(:cert).should eq(cert)
      end

      it "redirects to the cert" do
        cert = Cert.create! valid_attributes
        put :update, {:id => cert.to_param, :cert => valid_attributes}, valid_session
        response.should redirect_to(cert)
      end
    end

    describe "with invalid params" do
      it "assigns the cert as @cert" do
        cert = Cert.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cert.any_instance.stub(:save).and_return(false)
        put :update, {:id => cert.to_param, :cert => { "name" => "invalid value" }}, valid_session
        assigns(:cert).should eq(cert)
      end

      it "re-renders the 'edit' template" do
        cert = Cert.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cert.any_instance.stub(:save).and_return(false)
        put :update, {:id => cert.to_param, :cert => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cert" do
      cert = Cert.create! valid_attributes
      expect {
        delete :destroy, {:id => cert.to_param}, valid_session
      }.to change(Cert, :count).by(-1)
    end

    it "redirects to the certs list" do
      cert = Cert.create! valid_attributes
      delete :destroy, {:id => cert.to_param}, valid_session
      response.should redirect_to(certs_url)
    end
  end

end