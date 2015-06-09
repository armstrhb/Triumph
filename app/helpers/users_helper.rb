module UsersHelper
  def gravatar_for(email, size=40)
    image_tag(get_gravatar_url(email, size), class: "gravatar")
  end

  def get_gravatar_url(email, size=40)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?d=retro&s=#{size}"
  end
end
