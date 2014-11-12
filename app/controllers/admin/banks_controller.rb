class Admin::BanksController < Admin::AdminController

  def index
    @banks = Bank.all
  end
end
