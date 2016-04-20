class GramsController < ApplicationController
  def index
    @grams = Gram.page(params[:page]).per(5)
  end



  def new
    @gram = Gram.new  #instance variable. so that view (new.html.erb) can access this variable
  end



  def create
    @gram = Gram.new(model_params)    #pass parameters to database
    if @gram.save
      flash[:notice] = 'Gram successfully created'
      redirect_to @gram
    else
      render :new
    end
  end

  def show
    @gram = Gram.find(params[:id])    #displays title description location_code
    #if you see the server message, the form is submitted with sql return "id"
  end

  def destroy
    @gram = Gram.find(params[:id])
    @gram.destroy

    redirect_to grams_path    #redirect to /grams
  end


  private
  def model_params
    params.require(:gram).permit(:title, :description, :location_code)
    #strong parameter concept. white listing of things to put into database.
    #if no white listing, anything can update database, new columns created for bigger arrays
    #prevent hacking. normally = admin attribute to update database
    #hackers will submit admin = true to attack database
  end








end
