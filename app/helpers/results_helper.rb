module ResultsHelper
  def download_link(result, opts = {})
    raw "<a href=\"#{result.document.url}\" class=\"#{opts[:class]}\" download>#{result.document_file_name}</a>"
  end
end
