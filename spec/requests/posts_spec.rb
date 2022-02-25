# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     before(:each) { get '/users/2/posts' }

#     it 'checks if action returns correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'checks if action rendered a correct template' do
#       expect(response).to render_template('index')
#     end

#     it 'checks if correct placeholder is shown' do
#       expect(response.body).to include('Post for a given user')
#     end
#   end

#   describe 'GET /show' do
#     before(:example) { get '/users/2/posts/2' }

#     it 'checks if action returns correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'checks if action rendered a correct template' do
#       expect(response).to render_template('show')
#     end

#     it 'checks if correct placeholder is shown' do
#       expect(response.body).to include('Lists of Posts for the users')
#     end
#   end
# end
