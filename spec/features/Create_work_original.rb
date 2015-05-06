require 'spec_helper'

feature 'Create work original' do
	
	scenario 'Create work original' do

		visit 'works/'
	        click_on 'Ajouter une oeuvre'
	        fill_in 'title', :with => 'The Raven'
	        fill_in 'work-creator', :with => 'Edgar Allan Poe'
	        find('input[type="submit"][name=""]').click
		expect(page).to have_content 'The Raven'
		expect(page).to have_content 'Edgar Allan Poe'

	end

end
