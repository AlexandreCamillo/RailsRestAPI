require 'rails_helper'

RSpec.describe PlatformsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # platform. As you add validations to platform, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: 'iVento', email: 'a@a.com' }
  }

  let(:invalid_attributes) {
    { name: '', email: 'a@acom' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # platformsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "retorna uma lista de plataformas com sucesso" do
      50.times  do
        Platform.create({
          name: Faker::Company.unique.name,
          email: Faker::Internet.email
        })
      end

      length = Platform.count

      get :index, params: {}, session: valid_session

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(body['data'].count).to eq(length)
    end
  end

  describe "GET #show" do
    it "retorna uma plataforma específica" do
      platform = Platform.create! valid_attributes
      get :show, params: {id: platform.to_param}, session: valid_session

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(body['data']).to eq(platform.as_json)
    end
  end

  describe "POST #create" do
    context "com atributos válidos" do
      it "cria uma nova plataforma" do

        expect {
          post :create, params: {platform: valid_attributes}, session: valid_session
        }.to change(Platform, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "com atributos inválidos" do
      it "envia uma resposta em JSON com erros da criação da plataforma" do

        post :create, params: { platform: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "PUT #update" do
    context "com atributos válidos" do
      let(:new_attributes) {
        { name: 'Sympla', email: 'b@b.com' }
      }

      it "edita a plataforma requerida" do
        platform = Platform.create! valid_attributes
        put :update, params: { id: platform.to_param, platform: new_attributes }, session: valid_session
        platform.reload

        body = JSON.parse(response.body)

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(body['data']).to eq(platform.as_json)
      end
    end

    context "com atributos inválidos" do
      it "envia uma resposta em JSON com erros da edição da plataforma" do
        platform = Platform.create! valid_attributes
        put :update, params: { id: platform.to_param, platform: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroi a plataforma especificada" do
      platform = Platform.create! valid_attributes
      expect {
        delete :destroy, params: { id: platform.to_param }, session: valid_session
      }.to change(Platform, :count).by(-1)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end
