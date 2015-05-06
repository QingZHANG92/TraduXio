require 'spec_helper'

feature 'Create a translation' do

    background do
	Capybara.current_driver = :webkit
        visit 'works/'
        click_on 'Ajouter une oeuvre'
        fill_in 'title', :with => 'The Raven test'
        fill_in 'work-creator', :with => 'Edgar Allan Poe'
	find('input[type="submit"][name=""]').click
	sleep 5
	first('.edit').click
	find('.fulltext').set('This is a test \n\n This is not a test')
	first('.edit').click
    end

    scenario 'Create a translation' do
		find('.addVersion').click
		fill_in 'input[type="text"]', :with => 'Le Corbeau'
		find('input[type="submit"]').click
		click_on 'Choose your language', :with => 'Français'
		fill_in 'translator', :with => 'Martin Dupont'
		expect(page).to have_field 'author', :with => 'Edgar Allan Poe'
		fill_in block(2,1), :with => 'Une fois, sur le minuit lugubre pendant que je méditais, faible et fatigué,'
		fill_in block(2,2), :with => 'Sur maint précieux et curieux volume d une doctrine oubliée'
		expect(page).to have_field block(2,1), :with => 'Une fois, sur le minuit lugubre pendant que je méditais, faible et fatigué,'
		expect(page).to have_field block(2,2), :with => 'Sur maint précieux et curieux volume d une doctrine oubliée'
		click_on 'link_fields'
		expect(page).to have_field block(2,1), :with => 'Une fois, sur le minuit lugubre pendant que je méditais, faible et fatigué, Sur maint précieux et curieux volume d une doctrine oubliée'
		expect(page).to_not have_field block(2,2)
		expect(page).to have_button 'cut_fields'
		click_on 'block1'
		click_on 'cut_fields'
		expect(page).to have_field block(2,1), :with => 'Une fois, sur le minuit lugubre pendant que je méditais, faible et fatigué,'
		expect(page).to have_field block(2,2), :with => 'Sur maint précieux et curieux volume d une doctrine oubliée'
		expect(page).to have_button 'link_fields'
    end 

end
