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

describe TopTensController do

  # This should return the minimal set of attributes required to create a valid
  # TopTen. As you add validations to TopTen, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all top_tens as @top_tens" do
      top_ten = TopTen.create! valid_attributes
      get :index
      assigns(:top_tens).should eq([top_ten])
    end
  end

  describe "GET show" do
    it "assigns the requested top_ten as @top_ten" do
      top_ten = TopTen.create! valid_attributes
      get :show, :id => top_ten.id.to_s
      assigns(:top_ten).should eq(top_ten)
    end
  end

  describe "GET new" do
    it "assigns a new top_ten as @top_ten" do
      get :new
      assigns(:top_ten).should be_a_new(TopTen)
    end
  end

  describe "GET edit" do
    it "assigns the requested top_ten as @top_ten" do
      top_ten = TopTen.create! valid_attributes
      get :edit, :id => top_ten.id.to_s
      assigns(:top_ten).should eq(top_ten)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TopTen" do
        expect {
          post :create, :top_ten => valid_attributes
        }.to change(TopTen, :count).by(1)
      end

      it "assigns a newly created top_ten as @top_ten" do
        post :create, :top_ten => valid_attributes
        assigns(:top_ten).should be_a(TopTen)
        assigns(:top_ten).should be_persisted
      end

      it "redirects to the created top_ten" do
        post :create, :top_ten => valid_attributes
        response.should redirect_to(TopTen.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved top_ten as @top_ten" do
        # Trigger the behavior that occurs when invalid params are submitted
        TopTen.any_instance.stub(:save).and_return(false)
        post :create, :top_ten => {}
        assigns(:top_ten).should be_a_new(TopTen)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TopTen.any_instance.stub(:save).and_return(false)
        post :create, :top_ten => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested top_ten" do
        top_ten = TopTen.create! valid_attributes
        # Assuming there are no other top_tens in the database, this
        # specifies that the TopTen created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TopTen.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => top_ten.id, :top_ten => {'these' => 'params'}
      end

      it "assigns the requested top_ten as @top_ten" do
        top_ten = TopTen.create! valid_attributes
        put :update, :id => top_ten.id, :top_ten => valid_attributes
        assigns(:top_ten).should eq(top_ten)
      end

      it "redirects to the top_ten" do
        top_ten = TopTen.create! valid_attributes
        put :update, :id => top_ten.id, :top_ten => valid_attributes
        response.should redirect_to(top_ten)
      end
    end

    describe "with invalid params" do
      it "assigns the top_ten as @top_ten" do
        top_ten = TopTen.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TopTen.any_instance.stub(:save).and_return(false)
        put :update, :id => top_ten.id.to_s, :top_ten => {}
        assigns(:top_ten).should eq(top_ten)
      end

      it "re-renders the 'edit' template" do
        top_ten = TopTen.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TopTen.any_instance.stub(:save).and_return(false)
        put :update, :id => top_ten.id.to_s, :top_ten => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested top_ten" do
      top_ten = TopTen.create! valid_attributes
      expect {
        delete :destroy, :id => top_ten.id.to_s
      }.to change(TopTen, :count).by(-1)
    end

    it "redirects to the top_tens list" do
      top_ten = TopTen.create! valid_attributes
      delete :destroy, :id => top_ten.id.to_s
      response.should redirect_to(top_tens_url)
    end
  end

end
