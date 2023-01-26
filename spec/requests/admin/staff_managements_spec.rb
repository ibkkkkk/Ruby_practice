require "rails_helper"


describe "管理者に職員管理" do
  context "ログイン前" do
    include_examples "a protected admin controller", "admin/staff_members"
  end
end

describe "管理者による職員管理" do
  let(:administrator) {
    create(:administrator) }

    before do 
      post admin_session_url,
        params: {
          admin_login_form: {
            email: administrator.email,
            password: "pw"
          }
        }
    end

    describe "新規登録" do
      let(:params_hash) {
        attributes_for(:staff_member) }

      example "職員一覧ページにリダイレクト "do
        post admin_staff_members_url, params: {staff_member: params_hash}
        expect(response).to redirect_to(admin_staff_members_url)
      end

      example "例外 ActionController::ParameterMissingが発生" do
        expect {post admin_staff_members_url}.to raise_error(ActionController::ParameterMissing)
      end
    end

    describe "更新" do
      let(:staff_member) {
        create(:staff_member) }
      let(:params_hash) {
        attributes_for(:staff_member) }
    end
end
