class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain.eql?("admin")
  end
end