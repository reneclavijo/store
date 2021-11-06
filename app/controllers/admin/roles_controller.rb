class Admin::RolesController < ApplicationController

  layout 'admin_layout'
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  # GET /roles
  def index
  end

  # GET /roles/:id
  def show
  end

  # GET /roles/new
  def new
  end

  # GET /roles/:id/edit
  def edit
  end

  # POST /roles
  def create
  end

  # PUT/PATCH /roles/:id
  def update
  end

  # DELETE /roles/:id
  def destroy
  end
  
  private
  def set_role
  end

  def params_role
  end


end
