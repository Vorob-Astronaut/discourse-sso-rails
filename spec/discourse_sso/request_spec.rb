require 'spec_helper'

describe DiscourseSSO::Request do
  it 'return valid url' do
    DiscourseSSO::Config.configure do |config|
      config.secret = 'oh_my_secret'
    end

    sso = DiscourseSSO::Request.new(sso: "bm9uY2U9MzA3NGQwZGE2OTRhMzY5MWRlMTIyOWFjNmI3OWQwNzkmcmV0dXJu\nX3Nzb191cmw9aHR0cCUzQSUyRiUyRjQ2LjEwMS4xNzkuMTM2JTJGc2Vzc2lv\nbiUyRnNzb19sb2dpbg==\n", sig: "7097f6aff1305982c82ecb8be263c673226fe0018d729d3b21e7a8adac399716")

    sso.user = {
      name: "Дмитрий Жлобо",
      email: "dima.zhlobo@gmail.com",
      username: "Proghat",
      external_id: '7679'
    }

    expect(sso.callback_url).to eq('http://46.101.179.136/session/sso_login?sso=bmFtZT0lRDAlOTQlRDAlQkMlRDAlQjglRDElODIlRDElODAlRDAlQjglRDAl%0AQjkrJUQwJTk2JUQwJUJCJUQwJUJFJUQwJUIxJUQwJUJFJmVtYWlsPWRpbWEu%0Aemhsb2JvJTQwZ21haWwuY29tJnVzZXJuYW1lPVByb2doYXQmZXh0ZXJuYWxf%0AaWQ9NzY3OSZub25jZT0zMDc0ZDBkYTY5NGEzNjkxZGUxMjI5YWM2Yjc5ZDA3%0AOQ%3D%3D%0A&sig=4f12902afa20dfd477a16aec876dc7d2174ff67603bd3c95ed9f35d9e4adb45f')
  end
end
