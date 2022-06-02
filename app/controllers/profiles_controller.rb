class ProfilesController < ApplicationController

  http_basic_authenticate_with name:"dhh", password: "secret", except: [:index, :show]

  def index
    @profile = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit, status: :unprocessable_entry
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :age, :status)
    end
end
