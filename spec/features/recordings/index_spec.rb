require 'rails_helper'

feature 'recordings index page' do
  describe 'as a visitor' do
    it 'shows all recordings' do
      VCR.use_cassette('visitor_sees_recording', record: :new_episodes) do
        @recordings = create_list(:recording, 2)
        visit recordings_path
        expect(page).to have_content('All Recordings')
        expect(page.all('.recording-list').count).to eq(2)

        within(first('.recording-list')) do
          recording = @recordings.first
          expect(page).to have_content(recording.title)
          expect(page).to have_link(recording.user.display_name, href: user_path(recording.user))
          expect(page).to have_link(recording.landmark.name, href: landmark_path(recording.landmark))
          expect(page.all('audio').count).to eq(1)
        end
      end
    end

    xit 'sorts recordings by total rating from Sinatra' do
      VCR.use_cassette('sorted_recordings_index', record: :new_episodes) do
        r1 = create(:recording, id: 999 + rand(9999))
        r2 = create(:recording, id: 999 + rand(9999))
        r3 = create(:recording, id: 999 + rand(9999))
        votable_type = 'recording'
        # r2 rating = +1, r1 rating = 0, r3 rating = -1
        VoteService.new(votable_type: votable_type, votable_id: r2.id, type: 'upvote', vote_token: '12345').request_create
        VoteService.new(votable_type: votable_type, votable_id: r3.id, type: 'downvote', vote_token: '12345').request_create

        visit recordings_path

        expect(page.all('.recording-list').count).to eq(3)

        within(first('.recording-list')) do
          expect(page).to have_content(r2.title)
          expect(page).to have_content(1)
        end

        within(page.all('.recording-list')[1]) do
          expect(page).to have_content(r1.title)
          expect(page).to have_content(0)
        end

        within(page.all('.recording-list')[2]) do
          expect(page).to have_content(r3.title)
          expect(page).to have_content(-1)
        end
      end
    end

    it 'the vote arrows dont display' do
      VCR.use_cassette('recordings_index_page/as_a_visitor/the_vote_arrows_dont_display', record: :new_episodes) do
        @recordings = create_list(:recording, 2)
        
        visit recordings_path
        
        expect(page).to_not have_content('▲')
        expect(page).to_not have_content('▼')
      end
    end
  end
  
  describe 'as a user' do
    let(:user) { create(:user) }
    
    it 'the vote arrows display' do
      VCR.use_cassette('recordings_index_page/as_a_user/the_vote_arrows_display', record: :new_episodes) do
        @recordings = create_list(:recording, 2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit recordings_path

        expect(page).to have_content('▲')
        expect(page).to have_content('▼')
      end
    end
  end
end
