class PublicPagesController < ApplicationController
  # No authentication needed as these are public pages
  
  def show
    @user = User.find_by!(username: params[:username])
    @template = @user.dynamic_templates.find_by!(slug: params[:template_slug])
    
    # Track the page view for analytics
    TemplateView.create(dynamic_template: @template, ip: request.remote_ip)
    
    # Render the template
    @rendered_content = TemplateRenderer.render(@template.template_code)
  end
end
