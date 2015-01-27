class TestTwoAppController < ApplicationController
  def make_predictions
    set_matches_data_hash
  end

  def view_all_predictions
    set_matches_data_hash
    set_all_predictions_data_hash
    puts @predictions
  end

  def login
  end

  private

    def get_random_number(num_a, num_b)
      num_generator = Random.new
      min = [num_a, num_b].min
      max = [num_a, num_b].max
      num_generator.rand(min..max)
    end

    def set_all_predictions_data_hash
      @predictions = []
      get_all_users.each do |user|
        preds = []
        10.times { preds << get_random_number(0, 4) }
        @predictions << { user: user, preds: preds }
      end
    end

    def get_all_users
      %w[Ian Davy Ryan Adeeb Juan Mickey Manni Mark Ade Omar]
    end

    def set_matches_data_hash
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
          {
              home_team:  {
                  name: 'Fulham',
                  color:  'white',
              },
              away_team: {
                  name: 'Colchester',
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'WBA',
                  color:  'white',
              },
              away_team: {
                  name: 'Dulwich Hamlet',
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Leamington Brakes',
                  color:  'white',
              },
              away_team: {
                  name: 'Everton',
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Southampton',
                  color:  'white',
              },
              away_team: {
                  name: 'Plymouth Argyle',
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Witton Albion',
                  color:  'white',
              },
              away_team: {
                  name: 'Margate',
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Derby County',
                  color:  'white',
              },
              away_team: {
                  name: 'Carlisle United',
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'West Ham United',
                  color:  'white',
              },
              away_team: {
                  name: 'Tottenham Hotspur',
                  color:  'white',
              },
          },
      ]
    end
end
