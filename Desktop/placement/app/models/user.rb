class User < ActiveRecord::Base
  acts_as_authentic

   attr_accessor :old_password, :reset_password

   validate :old_password_valid, :unless => [:reset_password]

   def old_password_valid
      errors.add(:old_password, "You must introduce your password") if !new_record? && !valid_password?(old_password)
    end

    def require_password?
      password_changed? || (crypted_password.blank? && !new_record?) || reset_password
    end




    ROLES = %w[admin placement]

    def role_symbols
      [role.to_sym]
    end
end
