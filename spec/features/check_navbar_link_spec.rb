# frozen_string_literal: true

describe 'check navbar links' do
  before do
    visit '/'
  end

  it 'check school link' do
    click_link 'School'
    expect(page).to have_content('Cognition at school')
  end

  it 'check work link' do
    click_link 'Work'
    expect(page).to have_content('Cognition at work')
  end

  it 'check holiday link' do
    click_link 'Holiday'
    expect(page).to have_content('Cognition on holiday')
  end

  it 'check party link' do
    click_link 'Party'
    expect(page).to have_content('Cognition on party')
  end

  it 'check All link' do
    click_link 'All'
    expect(page).to have_xpath('/')
  end
end
