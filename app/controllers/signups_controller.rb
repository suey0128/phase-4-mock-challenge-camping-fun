class SignupsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def create
        signup = Signup.create!(signup_params)
        activity = Activity.find(params[:activity_id])
        render json: activity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
        # params.require(:signup).permit(:time, :camper_id, :activity_id)
        # params.permit(:name, :description, :price)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
