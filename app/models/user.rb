class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :provider, :role, :uid

  validates_presence_of :email, :first_name
  validates_uniqueness_of :email

  ROLES = %w[admin publisher author tech guest]
  SUPERROLES = %w[super_admin admin publisher author tech guest]
  #def role?(base_role)
  #  ROLES.index(base_role.to_s) <= ROLES.index(role)
  #end

  def check_permission(current_user_role,selected_role)
    if current_user_role == "super_admin"
      if selected_role == "super_admin"
        return false
      end
      return true
    end
    if current_user_role == "admin"
      if selected_role =="super_admin"||selected_role =="admin"
        return false
      end
      return true
    end
    return false
  end

  def self.update_with_omniauth_info(auth)
    user = User.where(:email => auth['info']['email']).first
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      first_name,last_name = auth['info']['name'].split(" ",2)
      user.first_name = first_name || ""
      user.last_name = last_name || ""
      user.email = auth['info']['email'] || ""
    end
    user.save!
    return user
  end

end
