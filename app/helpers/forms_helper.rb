module FormsHelper
  def download_link(form, opts = {})
    raw "<a href=\"#{form.document.url}\" class=\"#{opts[:class]}\" download>#{form.document_file_name}</a>"
  end
end
