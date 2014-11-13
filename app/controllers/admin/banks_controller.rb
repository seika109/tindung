class Admin::BanksController < Admin::AdminController

  def index
    @banks = Bank.all.paginate(page: page_param)
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

  def edit
    @bank = Bank.find(bank_id)
    @banks = Bank.all
  end

  def update
    @bank = Bank.find(bank_id)
    if @bank.update(bank_params)
      flash[:notice] = 'Bank has been updated successfully.'
      redirect_to admin_banks_url
    else
      flash[:alert] = 'Failed to update bank.'
      render :edit
    end
  end

  def destroy
    @bank = Bank.find(bank_id)
    @bank.destroy
    flash[:notice] = "Bank has been deleted successfully."
    redirect_to admin_banks_path
  end

  protected
  def bank_id
    params.require(:id)
  end
  def bank_params
    params.require(:bank).permit(:name)
  end
  def page_param
    params.fetch(:page, 1)
  end
end
