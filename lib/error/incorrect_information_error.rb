module Error
  class IncorrectInformationError < CustomError
    def initialize
      super(:incorrect_information, 422, 'incorrect email or password' )
    end
  end
end
