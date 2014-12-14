class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:send_request, :show, :edit, :update, :destroy]
  before_action :check_access, only: [:edit, :update, :destroy]
  before_action :check_admin_or_manager, only: [:new, :create]
  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_action :set_rank

  # GET /vacancies
  def index
    @vacancies = Vacancy
    if user_signed_in?
      if current_user.user?
        #@vacancies = @vacancies.where(rank_id: current_user.personal.rank_id) if current_user.personal
        @vacancies = @vacancies.active
      else
        #admin or crewing
        @vacancies = @vacancies.where(crew_id: current_user.crew_id || current_user.id)
      end
    end
    @vacancies = current_user.vacancies.order('user_vacancies.id DESC') if params[:filter].eql?('my_requests')
    @vacancies = @vacancies.where(rank_id: params[:rank_id]) if params[:rank_id].present?
    @vacancies = @vacancies.page(params[:page]).per(10)
  end

  # GET /vacancies/1
  def show
    @vacancy = @vacancy.decorate
    @related_vacancies = Vacancy.where(rank_id: @vacancy.rank_id).where('id != ?', @vacancy.id).limit(5).all.decorate
    @sent_request = user_signed_in? && UserVacancy.where(vacancy_id: params[:id], user_id: current_user.id).first
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
  end

  # GET /vacancies/1/edit
  def edit
  end

  # POST /vacancies
  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.crew_id = current_user.crew_id || current_user.id

    if @vacancy.save
      redirect_to @vacancy, notice: 'Vacancy was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vacancies/1
  def update
    if @vacancy.update(vacancy_params)
      redirect_to @vacancy, notice: 'Vacancy was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vacancies/1
  def destroy
    @vacancy.destroy
    redirect_to vacancies_url, notice: 'Vacancy was successfully destroyed.'
  end

  def send_request
    if current_user.user?
      UserVacancy.find_or_create_by({user: current_user, vacancy: @vacancy})
      redirect_to @vacancy, notice: 'Your request has been sent!'
    else
      redirect_to @vacancy, error: 'You should be registered as Sailor!'
    end
  end

  private
  def set_rank
    @rank = Rank.find_by_id(params[:rank_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def check_access
    unless current_user.can_edit?(@vacancy)
      redirect_to root_path, alert: 'You dont have access to change this vacancy!'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def vacancy_params
    params.require(:vacancy).permit(:rank_id, :vessel_type_id, :language_id, :salary_min, :salary_max, :salary_currency, :term_in_month, :from_date, :country_id, :require_description, :ship, :ship_motor, :nationality, :region, :crew_id, :shipowner_country_id)
  end
end
