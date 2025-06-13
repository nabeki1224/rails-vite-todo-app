require 'rails_helper'

RSpec.describe "Lists", type: :request do
  context "GET /lists" do
    it "gets all lists" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  context "POST /lists" do
    it "creates a new list" do
      expect { 
        post lists_path, params: { list: { title: "Test title", content: "Test Content" }}
      }.to change { List.count }.by(1)
      expect(response).to have_http_status(:ok)
    end
  end

  context "DELETE /lists/:id" do
    let!(:list) { create(:list) }
    it "deletes the list" do
      expect {
        delete list_path(list.id)
    }.to change { List.count }.by(-1)
    end
  end
end
