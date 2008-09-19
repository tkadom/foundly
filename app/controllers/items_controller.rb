require 'tiny_mce'
class ItemsController < ApplicationController
  layout 'application'

   uses_tiny_mce(:options => {  
        :theme => 'advanced',  
        :mode => "textareas",  
        :height => 100,  
        :content_css => "/stylesheets/base.css",  
        :remove_script_host => true,  
        :theme_advanced_toolbar_location => "top",  
        :theme_advanced_toolbar_align => "left",  
        :theme_advanced_buttons2 => %w{ spellchecker },  
        :editor_selector => 'mceEditor',  
        :spellchecker_rpc_url => "/items/spellchecker",  
        :spellchecker_languages => "+English=en",  
        :plugins => %w{ contextmenu paste spellchecker}  
         },  
        :only => [:new])  

  # GET /items
  # GET /items.xml
  def index
    @items = Item.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end

  def spellchecker  
     headers["Content-Type"] = "text/plain"  
     headers["charset"] =  "utf-8"  
     suggestions = check_spelling(params[:params][1], params[:method], params[:params][0])  
     results = {"id" => nil, "result" => suggestions, 'error' => nil}  
     render :text => results.to_json  
     return  
   end  
end
