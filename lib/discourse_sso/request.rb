class DiscourseSSO::Request
  attr_accessor :user

  def initialize(sso:, sig:)
    self.sso = sso
    self.sig = sig
  end

  def callback_url
  end
end
