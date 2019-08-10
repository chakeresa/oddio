require 'rails_helper'

RSpec.describe "Tours Index" do
  describe 'as a visitor' do
    it 'loads the page' do
      VCR.use_cassette('tours_index/visitor_loads_page', record: :new_episodes) do
        tours = create_list(:tour, 2)
        visit tours_path

        expect(current_path).to eq(tours_path)
        expect(status_code).to eq(200)
      end
    end

    it 'lists all tours' do
      VCR.use_cassette('tours_index/visitor_sees_all_tours', record: :new_episodes) do
        tours = create_list(:tour, 2)
        visit tours_path

        expect(page).to have_content('All Tours')
        expect(page.all('.tour-list').count).to eq(2)

        within(first('.tour-list')) do
          tour = tours.first
          expect(page).to have_link(tour.title, href: tour_path(tour))
          expect(page).to have_link(tour.user.display_name, href: user_path(tour.user))
        end
      end
    end


    it 'sorts tours by total rating from Sinatra' do
      # VCR.use_cassette('sorted_tours_index', record: :new_episodes) do
        WebMock.allow_net_connect!
        VCR.turn_off!
        t1 = create(:tour, id: 999 + rand(9999))
        t2 = create(:tour, id: 999 + rand(9999))
        t3 = create(:tour, id: 999 + rand(9999))
        votable_type = 'tour'
        # r2 rating = +1, r1 rating = 0, r3 rating = -1
        VoteService.new(votable_type: votable_type, votable_id: t2.id, type: 'upvote', vote_token: '12345').request_create
        VoteService.new(votable_type: votable_type, votable_id: t3.id, type: 'downvote', vote_token: '12345').request_create

        visit tours_path

        expect(page.all('.tour-list').count).to eq(3)

        within(first('.tour-list')) do
          expect(page).to have_content(t2.title)
          expect(page).to have_content(1)
        end

        within(page.all('.tour-list')[1]) do
          expect(page).to have_content(t1.title)
          expect(page).to have_content(0)
        end

        within(page.all('.tour-list')[2]) do
          expect(page).to have_content(t3.title)
          expect(page).to have_content(-1)
        end
      end
    # end
  end
end
