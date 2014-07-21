require 'sinatra/base'
require 'gschool_database_connection'

require './lib/country_list'
require './lib/message_maker'

class Application < Sinatra::Application

  def initialize
    super
    @db = MessageMaker.new
  end

  get '/' do
    all_messages = @db.find_all_messages
    erb :index, locals: { all_messages: all_messages }
  end

  post '/message' do
    @db.insert_message(params[:name],params[:message])
    redirect '/'
  end

  get '/continents' do
    all_continents = CountryList.new.continents
    erb :continents, locals: { continents: all_continents }
  end

  get '/continents/:continent_name' do
    list_of_countries = CountryList.new.countries_for_continent(params[:continent_name])
    erb :countries, locals: { countries: list_of_countries, continent: params[:continent_name] }
  end

end