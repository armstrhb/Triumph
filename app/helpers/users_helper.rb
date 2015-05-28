module UsersHelper
  def gravatar_for(email, size=40)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=retro&s=#{size}"

    image_tag(gravatar_url, class: "gravatar")
  end
end
