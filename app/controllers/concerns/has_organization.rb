# frozen_string_literal: true

module HasOrganization
  extend ActiveSupport::Concern

  included do
    helper_method :current_organization

    def current_organization
      Organization.find(params[organization_param])
    end

    def organization_param
      :organization_id
    end
  end
end
