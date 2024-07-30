module AuthorizationHelper

  def authorized_user(user_params: {}, reload_user: false)
    let_it_be(:user, reload: reload_user) do
      create(:user, user_params)
    end

    let_it_be(:cookie) { "Authorization=#{user.token_payload}" }
  end

  def authorization(user)
    cookies['Authorization'] = user.token_payload
  end

end
