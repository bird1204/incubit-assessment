module Error
  class IncorrectTokenError < CustomError
    def initialize
      super(:incorrect_token, 422, 'incorrect or expired token' )
    end
  end
end
