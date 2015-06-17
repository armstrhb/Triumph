class NotAuthorizedError < StandardError
  def message
    "The current user is not authorized to access this resource."
  end
end
