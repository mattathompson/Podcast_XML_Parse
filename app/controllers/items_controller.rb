class ItemsController < ApplicationController

  def index
    @items = current_user.items.all

    #respond_to do |format|
    #  format.html
    #  format.xml { send_file :filename => 'mydoc.xml', :type=>"application/xml", :disposition => 'attachment' }
    #end

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def import
    @item = current_user.items.find params[:item].to_i
    xml = Item.import(params, @item)
    send_data xml, filename: "Updated.xml"
  end

  def add_item
    @item = current_user.items.find params[:id]
  end

  def show
    @item = current_user.items.find params[:id]
  end


  def new
    @item = current_user.items.new
  end


  def create
    @item = current_user.items.new create_params

    if @item.save!
      redirect_to @item
    else
      redirect_to :back
    end

  end

  def make

  end


  def edit

  end


  def xmltest


  end


  def update

  end


  def destroy

  end


  private

  def create_params
    params[:item].permit(:title, :link, :keywords, :author, :cdata)
  end


end
