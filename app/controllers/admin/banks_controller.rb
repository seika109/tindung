class Admin::BanksController < Admin::AdminController

  def index
    @banks = Bank.all
  end

  def new
    @banks = Bank.all
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      flash[:notice] = 'Bank has been created successfully.'
      redirect_to admin_banks_url
    else
      render :new
    end
  end

  protected
  def bank_params
    params.require(:bank).permit(:name)
  end
end
