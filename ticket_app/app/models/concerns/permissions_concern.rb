module PermissionsConcern
  extend ActiveSupport::Concern
  def is_admin?
    self.admin_role
  end
end