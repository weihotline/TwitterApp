module FormHelper
  def urls_for(new_user)
    urls = []

    urls << (new_user ? users_url : session_url)
    urls << (new_user ? new_session_url : new_user_url)

    urls
  end

  def labels_for(new_user)
    labels = [ "Log in »", "Sign up »" ]

    labels.reverse! if new_user

    labels
  end
end
