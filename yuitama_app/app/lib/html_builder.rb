module HtmlBuilder
  def init
	root = Nokogiri::HTML::DocumentFragment.parse('')
	Nokogiri::HTML::Builder.with(root) do |doc|
	  doc.link(:link => "css/bootstrap.min.css", :rel => "stylesheet")
	  doc.script "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"
	  doc.script "js/bootstrap.min.js"
	  yield(doc)
	end
	    root.to_html.html_safe

  end
end
