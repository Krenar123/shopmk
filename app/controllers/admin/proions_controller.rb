# frozen_string_literal: true

module Admin
  class ProionsController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def new
      @tags = Tag.all
      super
    end

    def edit
      @tags = Tag.all
      @tags_selected = Proion.find(params[:id]).tags.map(&:name)
      super
    end

    def create
      resource = resource_class.new(resource_params)
      authorize_resource(resource)

      proion = Proion.new(proion_params)

      if proion.save_and_link_tag(proion_params)
        redirect_to(
          after_resource_created_path(resource),
          notice: translate_with_resource('create.success')
        )
      else
        @tags = Tag.all

        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }, status: :unprocessable_entity
      end
    end

    def update
      proion = Proion.find(params[:id])

      if proion.update_and_link_tag(proion_params)
        redirect_to(
          after_resource_updated_path(requested_resource),
          notice: translate_with_resource('update.success')
        )
      else
        @tags = Tag.all
        @tags_selected = Proion.find(params[:id]).tags.map(&:name)

        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource)
        }, status: :unprocessable_entity
      end
      # send_foo_updated_email(requested_resource)
    end

    private

    def after_resource_created_path(requested_resource)
      [namespace, requested_resource]
    end

    def after_resource_updated_path(requested_resource)
      [namespace, requested_resource]
    end

    def proion_params
      params.require(:proion).permit(
        :title,
        :description,
        :price,
        :size,
        :category_id,
        :previous_price,
        :long_description,
        :energy,
        :fat,
        :carbs,
        :fibre,
        :protein,
        :salt,
        :sugar,
        :tag_names
      )
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
