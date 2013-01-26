# encoding: utf-8

# Assets helpers
def digest_path(file_name)
  Assets[file_name].digest_path
end

def asset_path(file_name)
  asset_host = ENV['ASSET_HOST'] || '/assets/'
  "#{asset_host}#{digest_path(file_name)}"
end

def javascript_include_tag(file_name)
  file_name = "#{file_name}.js"
  %(<script src="#{asset_path(file_name)}"></script>)
end

def stylesheet_link_tag(file_name)
  file_name = "#{file_name}.css"
  %(<link rel="stylesheet" href="#{asset_path(file_name)}">)
end

# View helpers
def partial(partial)
  partial_view = "partials/_#{partial}".to_sym
  erb partial_view, :layout => false
end

def url_for_view(view)
  view.gsub('_', '-')
end
