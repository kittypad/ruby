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

describe PlayerAppsController do

  # This should return the minimal set of attributes required to create a valid
  # PlayerApp. As you add validations to PlayerApp, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all player_apps as @player_apps" do
      player_app = PlayerApp.create! valid_attributes
      get :index
      assigns(:player_apps).should eq([player_app])
    end
  end

  describe "GET show" do
    it "assigns the requested player_app as @player_app" do
      player_app = PlayerApp.create! valid_attributes
      get :show, :id => player_app.id.to_s
      assigns(:player_app).should eq(player_app)
    end
  end

  describe "GET new" do
    it "assigns a new player_app as @player_app" do
      get :new
      assigns(:player_app).should be_a_new(PlayerApp)
    end
  end

  describe "GET edit" do
    it "assigns the requested player_app as @player_app" do
      player_app = PlayerApp.create! valid_attributes
      get :edit, :id => player_app.id.to_s
      assigns(:player_app).should eq(player_app)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PlayerApp" do
        expect {
          post :create, :player_app => valid_attributes
        }.to change(PlayerApp, :count).by(1)
      end

      it "assigns a newly created player_app as @player_app" do
        post :create, :player_app => valid_attributes
        assigns(:player_app).should be_a(PlayerApp)
        assigns(:player_app).should be_persisted
      end

      it "redirects to the created player_app" do
        post :create, :player_app => valid_attributes
        response.should redirect_to(PlayerApp.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved player_app as @player_app" do
        # Trigger the behavior that occurs when invalid params are submitted
        PlayerApp.any_instance.stub(:save).and_return(false)
        post :create, :player_app => {}
        assigns(:player_app).should be_a_new(PlayerApp)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PlayerApp.any_instance.stub(:save).and_return(false)
        post :create, :player_app => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested player_app" do
        player_app = PlayerApp.create! valid_attributes
        # Assuming there are no other player_apps in the database, this
        # specifies that the PlayerApp created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PlayerApp.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => player_app.id, :player_app => {'these' => 'params'}
      end

      it "assigns the requested player_app as @player_app" do
        player_app = PlayerApp.create! valid_attributes
        put :update, :id => player_app.id, :player_app => valid_attributes
        assigns(:player_app).should eq(player_app)
      end

      it "redirects to the player_app" do
        player_app = PlayerApp.create! valid_attributes
        put :update, :id => player_app.id, :player_app => valid_attributes
        response.should redirect_to(player_app)
      end
    end

    describe "with invalid params" do
      it "assigns the player_app as @player_app" do
        player_app = PlayerApp.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PlayerApp.any_instance.stub(:save).and_return(false)
        put :update, :id => player_app.id.to_s, :player_app => {}
        assigns(:player_app).should eq(player_app)
      end

      it "re-renders the 'edit' template" do
        player_app = PlayerApp.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PlayerApp.any_instance.stub(:save).and_return(false)
        put :update, :id => player_app.id.to_s, :player_app => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested player_app" do
      player_app = PlayerApp.create! valid_attributes
      expect {
        delete :destroy, :id => player_app.id.to_s
      }.to change(PlayerApp, :count).by(-1)
    end

    it "redirects to the player_apps list" do
      player_app = PlayerApp.create! valid_attributes
      delete :destroy, :id => player_app.id.to_s
      response.should redirect_to(player_apps_url)
    end
  end

end
