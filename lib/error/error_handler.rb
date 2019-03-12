module Error
  module ErrorHandler
    def self.included(klass)
      klass.class_eval do
        rescue_from StandardError do |e|
          redierct(:standard_error, 500, e.to_s)
        end
        rescue_from ActiveRecord::RecordNotFound do |e|
          redierct(:record_not_found, 404, e.to_s)
        end
        rescue_from IncorrectInformationError do |e|
          redierct(e.error, e.status, e.message.to_s)
        end
      end
    end

    private

    def redierct(_error, _status, _message)
      flash[:error] = _message
      redirect_back fallback_location: root_path
    end

    def respond(_error, _status, _message)
      json = Helpers::Render.json(_error, _status, _message)
      render json: json
    end
  end
end
