class GramsController < ApplicationController
  def index
    @grams = Gram.order(created_at: :desc).page(params[:page]).per(5)   #pagination gem
  end



  def new
    @gram = Gram.new  #instance variable. so that view (new.html.erb) can access this variable
  end



  def create
    redirect_to root_path unless current_user

    @gram = Gram.new(model_params)    #pass parameters to database
    @gram.user = current_user

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
    params.require(:gram).permit(:title, :description, :location_code, :image_url)
    #strong parameter concept. white listing of things to put into database.
    #if no white listing, anything can update database, new columns created for bigger arrays
    #prevent hacking. normally = admin attribute to update database
    #hackers will submit admin = true to attack database
  end



end
