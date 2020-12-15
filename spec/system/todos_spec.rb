require 'rails_helper'

RSpec.describe "Todos", type: :system do
  let(:user) { create(:user) }

  before do
    # driven_by(:rack_test)
    driven_by(:selenium_chrome)
    # driven_by(:selenium_chrome_headless)
  end

  describe 'root page' do
    it 'should have valid content' do
      visit('/')

      expect(page).to have_content('Hello, Todo App')
    end
  end

  describe 'todos' do
    before do
      login_as(user)
      visit('/todos')
    end

    it 'should have title' do
      expect(page).to have_content('All todos:')
    end

    it 'should create todo item' do
      fill_in(with: 'New Task', class: 'add-todo').send_keys(:enter)

      expect(page.find('.in-progress-todos')).to have_content('New Task')
    end
  end
end
