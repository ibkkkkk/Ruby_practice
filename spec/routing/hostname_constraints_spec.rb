require "rails_helper"

describe "routing" do
  example "職員ページ" do
    config = Rails.application.config.combee
    url = "http://#{config[:staff][:host]}/#{config[:staff][:path]}"
    expect(get: url).to route_to(
      host: config[:staff][:host],
      controller: "staff/top",
      action: "index"
    )
  end

  example "管理者ログインフォーム" do 
    config = Rails.application.config.combee
    url = "http://#{config[:admin][:host]}/#{config[:admin][:path]}/login"
    expect(get: url).to route_to(
      host: config[:admin][:host],
      controller: "admin/sessions",
      action: "new"
    )
  end

  example "ホスト名が対象外ならroutableではない" do
    expect(get: "http://foo.example.com").not_to be_routable
  end

  example "存在しないパスならroutableではない" do
    config = Rails.application.config.combee
    expect(get: "http://#{config[:staff][:host]}/xyz").not_to be_routable
  end
end
