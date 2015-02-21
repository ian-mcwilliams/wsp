class TestTwoAppController < ApplicationController
  helper HtmlProcessorHelpers, LoginHtmlHelpers, PredictMatchesHtmlHelpers, ViewAllPredictionsHtmlHelpers,
         PageFrameHelpers

  def sandbox

  end

  def predict_matches
    @current_page_title = 'Make Predictions'
    @matches = get_predict_matches_data_hash
  end

  def view_all_predictions
    @current_page_title = 'View All Predictions'
    @view_all_predictions = get_view_all_predictions_data_hash
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

    def get_all_predictions_data_hash
      predictions = []
      get_all_users.each do |user|
        preds = []
        20.times { preds << get_random_number(0, 4) }
        predictions << { user: user, preds: preds }
      end
      predictions
    end

    def get_all_users
      %w[Ian Davy Ryan Adeeb Juan Mickey Manni Mark Ade Omar]
    end

    def get_view_all_predictions_data_hash
      collection = { users: get_all_users}
      raw_matches = get_predict_matches_data_hash
      raw_predictions = get_all_predictions_data_hash
      matches = []
      raw_matches.each_with_index do |match, index|
        predictions = []
        raw_predictions.each do |prediction|
          home_score = prediction[:preds][index * 2]
          away_score = prediction[:preds][index * 2 + 1]
          predictions << { home_score: home_score, away_score: away_score }
        end
        matches << {
            home_team: match[:home_team][:name],
            away_team: match[:away_team][:name],
            predictions: predictions
        }
      end
      collection[:matches] = matches
      collection
    end

    def get_predict_matches_data_hash
      [
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
