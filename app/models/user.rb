class User < ActiveRecord::Base
  # Auto save encrypted password to field password_digest
  has_secure_password

  def editor?
    self.role == 'editor'
  end

  def admin?
    self.role == 'admin'
  end
end
