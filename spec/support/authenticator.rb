module Authenticator
  def sign_in(resource, scope)
    session[(scope.to_s + '_id').to_sym] = resource.id
  end

  def signed_user(scope)
    session[scope]
  end
end
