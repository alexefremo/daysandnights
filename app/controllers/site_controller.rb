class SiteController < ApplicationController
  def index
    @adv = Advertise.find( :all, :order => "updated_at DESC" , :limit => 2)
    @events = Event.find( :all, :order => "start_date DESC" , :limit => 6)
    @news = News.find( :all, :order => "created_at DESC" , :limit => 4)
  end

  def result
   @search = Sunspot.search Place, News, Event do 
      fulltext params[:search]
     end
   @result = @search.results
  end

  def contact_us
  end
end
