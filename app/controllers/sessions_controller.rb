class SessionsController < Devise::SessionsController
  def create_magic_link
    # From [passwordless generator](https://github.com/abevoelker/devise-passwordless/blob/master/lib/generators/devise/passwordless/templates/sessions_controller.rb.erb)
    # edited customized flow
    self.resource = resource_class.find_by(email: create_params[:email])
    resource&.send_magic_link(create_params[:remember_me])

    redirect_to :root, notice: find_message(:magic_link_message)
  end

  protected

  # From passwordless generator
  def translation_scope
    if action_name == 'create'
      'devise.passwordless'
    else
      super
    end
  end

  private

  # Lightly edited from passwordless generator
  def create_params
    @create_params ||= params.permit(:email, :remember_me)
  end
end
