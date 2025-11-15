class Api::EventTypesController < Api::BaseController
  before_action :set_event_type, only: %i[ show update destroy ]

  # GET /event_types
  def index
    @event_types = EventType.all

    render json: @event_types
  end

  # GET /event_types/1
  def show
    render json: @event_type
  end

  # POST /event_types
  def create
    @event_type = EventType.new(event_type_params)

    if @event_type.save
      render json: @event_type, status: :created
    else
      render json: @event_type.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /event_types/1
  def update
    if @event_type.update(event_type_params)
      render json: @event_type
    else
      render json: @event_type.errors, status: :unprocessable_content
    end
  end

  # DELETE /event_types/1
  def destroy
    @event_type.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type
      @event_type = EventType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_type_params
      params.expect(event_type: [ :name, :description, :duration_minutes, :buffer_before_minutes, :buffer_after_minutes, :active, :location_type, :user_id ])
    end
end
