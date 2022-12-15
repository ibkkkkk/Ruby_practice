Rails.application.configure do
  config.combee = {
    staff: {host: "combee.example.com", path: ""},
    admin: {host: "combee.example.com", path: "admin"},
    customer: {host: "example.com", path: "mypage"}
  }
end
