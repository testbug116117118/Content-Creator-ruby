class TemplateRenderer
  def self.render(template_code, variables = {})
    # Render the template code using ERB
    begin
      ERB.new(template_code).result(binding)
    rescue => e
      Rails.logger.error("Template rendering error: #{e.message}")
      "<div class='alert alert-danger'>Error rendering template</div>"
    end
  end
  
  # Helper method to limit CPU usage for free users
  def self.render_with_timeout(template_code, timeout = 2.seconds)
    Timeout::timeout(timeout) do
      render(template_code)
    end
  end
end
