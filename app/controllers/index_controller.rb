class IndexController < ApplicationController

  def index
    @accounts = Account.all
  end

  def import
    Account.import(params[:file])
    redirect_to root_url, notice: "Uploads Success"
  end

end
