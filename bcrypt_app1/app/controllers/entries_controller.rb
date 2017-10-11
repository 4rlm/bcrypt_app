class EntriesController < ApplicationController

  # INDEX: entries view all.
  get '/entries' do
    @entries = Entry.order('updated_at ASC').limit(10)
    erb :'entries/index'
  end

  # NEW: entries new
  get '/entries/new' do
    @entry = Entry.new  ## Prevents errors on Form Partial.
    erb :'entries/new'
  end

  # CREATE:
  post '/entries' do
    @entry = Entry.create(params[:entry])
    redirect '/entries'
  end

  # SHOW: displays a single entry detail page.
  get '/entries/:id' do
    @entry = Entry.find(params[:id])
    erb :'entries/show'
  end

  # EDIT:
  get '/entries/:id/edit' do
    @entry = Entry.find(params[:id])
    erb :'entries/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_entry
    @entry = Entry.find(params[:id])
    @entry.update(params[:entry])
    redirect "/entries/#{@entry.id}"
  end

  # UPDATE: patch
  patch '/entries/:id' do
    update_entry
  end

  # UPDATE: put
  put '/entries/:id' do
    update_entry
  end

  #################################

  # DELETE:
  delete '/entries/:id' do
    Entry.find(params[:id]).destroy!
    redirect '/entries'
  end

end

