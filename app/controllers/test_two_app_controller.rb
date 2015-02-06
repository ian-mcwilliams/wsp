class TestTwoAppController < ApplicationController
  helper HtmlProcessorHelpers, LoginHtmlHelpers, PredictMatchesHtmlHelpers

  def make_predictions
    @current_page_title = 'Make Predictions'
    set_matches_data_hash
  end

  def view_all_predictions
    @current_page_title = 'View All Predictions'
    set_matches_data_hash
    set_all_predictions_data_hash
    puts @predictions
  end

  def login
    @current_page_title = 'Login'
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
        20.times { preds << get_random_number(0, 4) }
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
                  key:  :man_utd,
                  color:  'red',
              },
              away_team: {
                  name: 'Arsenal',
                  key: :arsenal,
                  color:  'red',
              },
          },
          {
              home_team: {
                  name: 'Liverpool',
                  key: :liverpool,
                  color:  'red',
              },
              away_team: {
                  name: 'Aston Villa',
                  key: :aston_villa,
                  color:  'pink',
              },
          },
          {
              home_team:  {
                  name: 'Newcastle United',
                  key: :newcastle_united,
                  color:  'white',
              },
              away_team: {
                  name: 'Stevenage Borough',
                  key: :stevenage_borough,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Fulham',
                  key: :fulham,
                  color:  'white',
              },
              away_team: {
                  name: 'Colchester',
                  key: :colchester,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'WBA',
                  key: :wba,
                  color:  'white',
              },
              away_team: {
                  name: 'Dulwich Hamlet',
                  key: :dulwich_hamlet,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Leamington Brakes',
                  key: :leamington_brakes,
                  color:  'white',
              },
              away_team: {
                  name: 'Everton',
                  key: :everton,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Southampton',
                  key: :southampton,
                  color:  'white',
              },
              away_team: {
                  name: 'Plymouth Argyle',
                  key: :plymoth_argyle,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Witton Albion',
                  key: :witton_albion,
                  color:  'white',
              },
              away_team: {
                  name: 'Margate',
                  key: :margate,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'Derby County',
                  key: :derby_county,
                  color:  'white',
              },
              away_team: {
                  name: 'Carlisle United',
                  key: :carlisle_united,
                  color:  'white',
              },
          },
          {
              home_team:  {
                  name: 'West Ham United',
                  key: :west_ham_united,
                  color:  'white',
              },
              away_team: {
                  name: 'Tottenham Hotspur',
                  key: :tottenham_hotspur,
                  color:  'white',
              },
          },
      ]
    end
end
