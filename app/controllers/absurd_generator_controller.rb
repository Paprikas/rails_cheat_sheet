class AbsurdGeneratorController < ApplicationController
  def index
    if request.post?
      keywords = params[:keywords].split(",").map(&:strip)
      @advice = AdviceGeneratorService.generate_absurd_advice(keywords)
      render :index, status: :created
    end
  end
end
