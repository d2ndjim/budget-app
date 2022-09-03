class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  # GET /records/1 or /records/1.json
  def show; end

  # GET /records/new
  def new
    @category = Category.find(params[:category_id])
    @record = Record.new
  end

  def create
    @category = Category.find(params[:category_id])
    @record = @category.records.create(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to category_path(@category), notice: 'Record was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy
    @category = Category.find(params[:category_id])

    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:user_id, :name, :amount)
  end
end
