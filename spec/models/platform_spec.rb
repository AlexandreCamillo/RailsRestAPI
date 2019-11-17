require 'rails_helper'

RSpec.describe Platform, type: :model do
  context "Validade de uma Plataforma" do
    it "Plataforma válida" do
      platform = Platform.new
      platform.name = 'a'
      platform.email = 'a@a.com'

      expect(platform.valid?).to be_truthy
    end

    it "Plataforma inválida por nome vazio" do
      platform = Platform.new
      platform.name = ''
      platform.email = 'a@a.com'

      expect(platform.valid?).to be_falsey
    end

    it "Plataforma inválida por faltar nome" do
      platform = Platform.new
      platform.email = 'a@a.com'

      expect(platform.valid?).to be_falsey
    end

    it "Plataforma inválida por email vazio" do
      platform = Platform.new
      platform.name = 'a'
      platform.email = ''

      expect(platform.valid?).to be_falsey
    end

    it "Plataforma inválida por faltar email" do
      platform = Platform.new
      platform.name = 'a'

      expect(platform.valid?).to be_falsey
    end

    it "Plataforma inválida por email com formato errado - a@acom" do
      platform = Platform.new
      platform.name = 'a'
      platform.email = 'a@acom'

      expect(platform.valid?).to be_falsey
    end

    it "Plataforma inválida por email com formato errado - aa.com" do
      platform = Platform.new
      platform.name = 'a'
      platform.email = 'aa.com'

      expect(platform.valid?).to be_falsey
    end

    it "Plataforma inválida por email com formato errado - a@a" do
      platform = Platform.new
      platform.name = 'a'
      platform.email = 'a@a'

      expect(platform.valid?).to be_falsey
    end
  end
end
