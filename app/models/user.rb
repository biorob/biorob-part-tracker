class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid

  def self.find_for_ldap_auth(auth, signed_in_resource = nil)
    uid = auth.info.uid
    provider = auth.provider
    email = auth.info.email.downcase unless auth.info.email.nil?
    raise OmniAuth::Error, "LDAP accounts must provide an uid and email address" if uid.nil? or email.nil?
    
    if @user = User.where(:provider => provider, :uid => uid).first
      @user
    else
      create_from_omniauth(auth,true)
    end
  end
  
  private
    
  def self.create_from_omniauth(auth, ldap = false)
    provider = auth.provider
    uid = auth.info.uid || auth.uid
    name = auth.info.name.force_encoding("utf-8")
    email = auth.info.email.downcase unless auth.info.email.nil?

    ldap_prefix = ldap ? '(LDAP) ' : ''
    raise OmniAuth::Error, "#{ldap_prefix}#{provider} does not provide an email"\
      " address" if auth.info.email.blank?
    
    password = Devise.friendly_token[0, 8].downcase
    @user = User.new

    @user.uid      = uid
    @user.provider = provider
    @user.name     = name
    @user.email    = email
    @user.password = password
    @password_confirmation = password,
    @user.confirmed_at = Time.now

    @user.save!
    @user

  end

end
