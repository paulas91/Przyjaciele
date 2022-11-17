# frozen_string_literal: true

describe FriendsController, type: :controller do
  describe 'GET #index' do
    subject(:index_request) { get :index }

    it 'returns http success' do
      index_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      index_request
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    subject(:show_request) { get :show, params: { id: friend.id } }

    let(:friend) { create(:friend) }

    it 'returns http succes' do
      show_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      show_request
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    subject(:new_request) { get :new }

    it 'returns http succes' do
      new_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the new template' do
      new_request
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    subject(:edit_request) { get :edit, params: { id: friend.id } }

    let(:friend) { create(:friend) }

    it 'returns http succes' do
      edit_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the edit template' do
      edit_request
      expect(response).to render_template('edit')
    end
  end

  describe 'POST #create' do
    subject(:create_request) { post :create, params: { friend: friend_attributes } }

    let(:friend_attributes) { attributes_for(:friend) }

    it 'returns http redirect' do
      create_request
      expect(response).to have_http_status(:found)
    end

    it 'redirects to new friend' do
      create_request
      expect(response).to redirect_to(friend_path(Friend.last))
    end

    it 'returns status unprocessable_entity' do
      post :create, params: { friend: { first_name: nil, last_name: nil, email: nil, residence: nil, cognition: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'creates a new friend' do
      expect { create_request }.to change(Friend, :count).by(1)
    end
  end

  describe 'PUT #update' do
    subject(:update_request) { put :update, params: { id: friend.id, friend: new_attributes } }

    let(:friend) { create(:friend) }
    let(:new_attributes) { attributes_for(:friend) }

    it 'returns http redirect' do
      update_request
      expect(response).to have_http_status(:found)
    end

    it 'redirects to updated friend' do
      update_request
      expect(response).to redirect_to(friend_path(friend))
    end

    it 'returns status unprocessable_entity' do
      put :update, params: { id: friend.id, friend: { first_name: nil, last_name: nil, email: nil, residence: nil, cognition: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'updates the friend' do
      expect { update_request }.to change { friend.reload.first_name }.to(new_attributes[:first_name])
    end
  end

  describe 'DELETE #destroy' do
    subject(:destroy_request) { delete :destroy, params: { id: friend.id } }

    let!(:friend) { create(:friend) }

    it 'returns http redirect' do
      destroy_request
      expect(response).to have_http_status(:found)
    end

    it 'redirects to the friends index' do
      destroy_request
      expect(response).to redirect_to(friends_path)
    end

    it 'deletes the friend' do
      expect { destroy_request }.to change(Friend, :count).by(-1)
    end
  end

  describe 'GET #school' do
    subject(:school_request) { get :school }

    it 'returns http success' do
      school_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the school template' do
      school_request
      expect(response).to render_template('school')
    end
  end

  describe 'GET #work' do
    subject(:work_request) { get :work }

    it 'returns http success' do
      work_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the work template' do
      work_request
      expect(response).to render_template('work')
    end
  end

  describe 'GET #party' do
    subject(:party_request) { get :party }

    it 'returns http success' do
      party_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the party template' do
      party_request
      expect(response).to render_template('party')
    end
  end

  describe 'GET #holiday' do
    subject(:holiday_request) { get :holiday }

    it 'returns http success' do
      holiday_request
      expect(response).to have_http_status(:ok)
    end

    it 'renders the holiday template' do
      holiday_request
      expect(response).to render_template('holiday')
    end
  end
end
