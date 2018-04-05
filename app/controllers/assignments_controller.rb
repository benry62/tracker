class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end
end
