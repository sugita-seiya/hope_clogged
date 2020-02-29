class ReportsController < ApplicationController

  def top
  end

  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.create(report_params)
    # Report.create(report_params)
    redirect_to reports_path
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
    redirect_to reports_path(report.id)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to reports_path
  end

  private
  def report_params
    params.require(:report).permit(:date, :text)
  end

end
