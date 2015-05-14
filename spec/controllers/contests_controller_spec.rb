require 'rails_helper'

RSpec.describe ContestsController, type: :controller do
  before(:each) do
    @contest1 = Contest.create(name:"First Contest")
    @contest2 = Contest.create(name:"Second Contest")
  end


  describe "GET #index" do
    before :each do
      get :index
    end

    it "returns http success" do
      
      expect(response).to have_http_status(:success)
    end


    it "should render the correct page" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do

    before :each do
      get :new
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should render the correct page" do
      expect(response).to render_template("new")
    end
  end

  describe "GET #show" do
    before :each do
      get :show, id: @contest1.id
    end
  
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should render the correct view template" do 
      expect(response).to render_template("show")
    end

  end

  describe "POST #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    before :each do
      get :edit, id: @contest1.id
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "should render edit view template" do 
      expect(response).to render_template("edit")
    end
    
  end

  describe "PATCH #update" do
    before :each do 
      @contest1.update_attributes(name: "third contest")
    end
    it "returns http success" do 
      expect(response).to have_http_status(:success)
    end

    it "should update attributes of item" do 
      expect(@contest1.name).to eq("third contest") 
    end
  end

  describe "DELETE #destroy" do

    it "returns http success" 

  end

end
