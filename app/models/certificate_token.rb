# This file is part of Mconf-Web, a web application that provides access
# to the Mconf webconferencing system. Copyright (C) 2010-2015 Mconf.
#
# This file is licensed under the Affero General Public License version
# 3 or later. See the LICENSE file.

class CertificateToken < ActiveRecord::Base
  belongs_to :user
  validates :identifier, :presence => true, :uniqueness => true
  validates :user_id, :presence => true, :uniqueness => true

  def last_sign_in_date
    current_sign_in_at
  end

  def sign_in_method_name
    "certificate"
  end

  def self.user_created_by_certificate?(u)
    CertificateToken.where(user_id: u.id, new_account: true).present?
  end

end
