# frozen_string_literal: true

describe 'Friend routes', type: :routing do
  it { expect(get: '/friends').to route_to('friends#index') }
  it { expect(get: '/friends/1').to route_to('friends#show', id: '1') }
  it { expect(post: '/friends').to route_to('friends#create') }
  it { expect(put: '/friends/1').to route_to('friends#update', id: '1') }
  it { expect(delete: '/friends/1').to route_to('friends#destroy', id: '1') }
  it { expect(get: '/friends/work').to route_to('friends#work') }
  it { expect(get: '/friends/party').to route_to('friends#party') }
  it { expect(get: '/friends/school').to route_to('friends#school') }
  it { expect(get: '/friends/holiday').to route_to('friends#holiday') }
end
