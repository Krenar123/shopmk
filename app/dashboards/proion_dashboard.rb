# frozen_string_literal: true

require 'administrate/base_dashboard'

class ProionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    market_proion_id: Field::String,
    title: Field::String,
    description: Field::String,
    price: Field::String,
    market_price: Field::String,
    price_per_size: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    size: Field::String,
    category: Field::String,
    previous_price: Field::String,
    long_description: Field::Text,
    energy: Field::String,
    fat: Field::String,
    carbs: Field::String,
    fibre: Field::String,
    protein: Field::String,
    salt: Field::String,
    sugar: Field::String,
    category: Field::BelongsTo,
    eikonas: Field::HasMany
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    market_proion_id
    title
    eikonas
    price
    category
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    market_proion_id
    title
    description
    eikonas
    price
    market_price
    price_per_size
    size
    category
    previous_price
    long_description
    carbs
    fat
    energy
    fibre
    protein
    salt
    sugar
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    title
    description
    price
    market_price
    previous_price
    price_per_size
    size
    category
    long_description
    energy
    fat
    carbs
    fibre
    protein
    salt
    sugar
    eikonas
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how proions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(proion)
    proion.title.to_s
  end
end
