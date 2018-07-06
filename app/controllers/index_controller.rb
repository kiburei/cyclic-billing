class IndexController < ApplicationController

  def index
    if params[:year] != nil
      @accounts = Account.where(Date: params[:year])
    else
      @accounts = Account.all
    end
    @dates = Account.distinct.pluck(:Date).uniq
  end

  def import
    Account.import(params[:file])
    redirect_to root_url, notice: "Uploads Success"
  end

  def download
    @accounts = Account.all
    respond_to do |format|
      format.csv { send_data @accounts.to_csv, filename: "Core Banking Unreconciled Records.csv" }
    end
  end


end
