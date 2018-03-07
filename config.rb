activate :directory_indexes
activate :i18n

set :relative_links, true
set :haml, { format: :html5 }

activate :pagination do
  # Remember: you need to add manually the gallerries because
  # data in here is not present only in the pageable_set!!!
  ['fusion_light', 'light_object', 'light_phoenix', 'light_sphere'].each do |item|
    pageable_set :"#{item}_gallery_photos" do
      data.send("#{item}_gallery.photos")
    end
  end
end

# Disable Haml warnings
Haml::TempleEngine.disable_option_validator!

page "/", layout: 'landing'
page "/en/", layout: 'landing'

# data.site.galleries.each do |gallery|
#  I18n.locale = :en
#   #pretty_url = "#{gallery.en_name}".

#   proxy "/en/gallery/#{gallery.to_s}", 
#     'gallery/template.en.html',
#     locale: :en, 
#     locals: {
#       gallery_name: gallery 
#     }

#   I18n.locale = :de
#   proxy "/galerie/#{gallery.to_s}", 
#     'gallery/template.de.html',
#     locale: :de, 
#     locals: {
#       gallery_name: gallery
#     }
# end

ignore "/en/gallery/template.en.html"
ignore "/galerie/template.de.html"
ignore "/gallery/template.en.html"
ignore "/gallery/template.de.html"

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/404.html", directory_index: false

set :css_dir, "assets/stylesheets"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"

# redirect "/en/gallery", to: "/en/gallery/light_object"
# redirect "/galerie", to: "/galerie/light_object"

configure :build do
  activate :external_pipeline,
    name: :gulp,
    command: "npm run production",
    source: ".tmp",
    latency: 1

  ignore "assets/javascripts/all.js"
  ignore "assets/stylesheets/site"

  activate :gzip

  activate :minify_html do |html|
    html.remove_quotes = false
    html.remove_intertag_spaces = true
  end
end
