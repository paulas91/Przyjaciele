# frozen_string_literal: true

describe FriendsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:friend) { create(:friend) }

    it 'returns http succes' do
      get :show, params: { id: friend.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http succes' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    let(:friend) { create(:friend) }

    it 'returns http succes' do
      get :edit, params: { id: friend.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:friend_attributes) { attributes_for(:friend) }

    it 'returns http redirect' do
      post :create, params: { friend: friend_attributes }
      expect(response).to have_http_status(:found)
    end

    it 'returns status unprocessable_entity' do
      post :create, params: { friend: { first_name: nil, last_name: nil, email: nil, residence: nil, cognition: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT #update' do
    let(:friend) { create(:friend) }
    let(:new_attributes) { attributes_for(:friend) }

    it 'returns http redirect' do
      put :update, params: { id: friend.id, friend: new_attributes }
      expect(response).to have_http_status(:found)
    end

    it 'returns status unprocessable_entity' do
      put :update, params: { id: friend.id, friend: { first_name: nil, last_name: nil, email: nil, residence: nil, cognition: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    let(:friend) { create(:friend) }

    it 'returns http redirect' do
      delete :destroy, params: { id: friend.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET #school' do
    it 'returns http success' do
      get :school
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #work' do
    it 'returns http success' do
      get :work
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #party' do
    it 'returns http success' do
      get :party
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #holiday' do
    it 'returns http success' do
      get :holiday
      expect(response).to have_http_status(:ok)
    end
  end
end
