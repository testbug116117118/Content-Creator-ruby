class DynamicTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  def index
    @templates = current_user.dynamic_templates
  end
  
  def show
    @rendered_content = TemplateRenderer.render(@template.template_code)
  end
  
  def new
    @template = DynamicTemplate.new
  end

  def create
    @template = current_user.dynamic_templates.build(template_params)
    # Save the template and redirect
  end
end
