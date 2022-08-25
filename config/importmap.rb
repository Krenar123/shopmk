# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@fortawesome/fontawesome-free', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.1.2/js/all.js'
pin '@fortawesome/fontawesome-svg-core', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.1.1/index.es.js'
pin '@fortawesome/free-brands-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.1.2/index.es.js'
pin '@fortawesome/free-regular-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-regular-svg-icons@6.1.2/index.es.js'
pin '@fortawesome/free-solid-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-solid-svg-icons@6.1.1/index.es.js'
pin '@hotwired/turbo', to: 'https://ga.jspm.io/npm:@hotwired/turbo@7.1.0/dist/turbo.es2017-esm.js'
pin '@rails/actioncable/src', to: 'https://ga.jspm.io/npm:@rails/actioncable@7.0.3/src/index.js'
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin '@rails/ujs', to: 'https://ga.jspm.io/npm:@rails/ujs@7.0.3-1/lib/assets/compiled/rails-ujs.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
