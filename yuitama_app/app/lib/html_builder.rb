module HtmlBuilder
  def init
	root = Nokogiri::HTML::DocumentFragment.parse('')
	Nokogiri::HTML::Builder.with(root) do |doc|
	        yield(doc)
			    end
	    root.to_html.html_safe

  end
end
