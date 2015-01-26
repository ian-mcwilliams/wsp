class TestTwoAppController < ApplicationController

  def make_predictions
    @current_page_title = 'Make Predictions'

    @matches = [
        {
            home_team: {
                name: 'Man Utd',
                color:  'red',
            },
            away_team: {
                name: 'Arsenal',
                color:  'red',
            },
        },
        {
            home_team: {
                name: 'Liverpool',
                color:  'red',
            },
            away_team: {
                name: 'Aston Villa',
                color:  'pink',
            },
        },
        {
            home_team:  {
                name: 'Newcastle United',
                color:  'white',
            },
            away_team: {
                name: 'Stevenage Borough',
                color:  'white',
            },
        },
    ]
  end

  def view_all_predictions
    @current_page_title = 'View All Predictions'
  end

  def login
    @current_page_title = 'Login'
  end
end
