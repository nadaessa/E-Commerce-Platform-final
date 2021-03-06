# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w(
    vendors/linericon/style.css
    css/font-awesome.min.css
    css/themify-icons.css
    css/flaticon.css 
    vendors/owl-carousel/owl.carousel.min.css
    vendors/lightbox/simpleLightbox.css
    vendors/nice-select/css/nice-select.css
    vendors/animate-css/animate.css 
    vendors/jquery-ui/jquery-ui.css
    css/style.css
    css/responsive.css
    js/popper.js
    js/stellar.js 
    vendors/lightbox/simpleLightbox.min.js
    vendors/nice-select/js/jquery.nice-select.min.js
    vendors/isotope/imagesloaded.pkgd.min.js
    vendors/isotope/isotope-min.js
    vendors/owl-carousel/owl.carousel.min.js
    js/jquery.ajaxchimp.min.js
    custom.js
    vendors/counter-up/jquery.waypoints.min.js
    vendors/counter-up/jquery.counterup.js 
    js/mail-script.js
    js/theme.js
    js/jquery-3.2.1.min.js 
    js/bootstrap.min.js
)



# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
