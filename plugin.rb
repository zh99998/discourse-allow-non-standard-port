# name: allow-non-standard-port
# about: S3-competition storage in non 80/443 port
# version: 0.1
# authors: zh99998 <zh99998@gmail.com>, marguerite <marguerite@opensuse.org>

after_initialize do

  RouteFormat.class_eval do
    def validate_uri_format
      return false unless @uri
      return false unless ['https', 'http'].include?(@uri.scheme)
      #return false if @uri.scheme == 'http' && @uri.port != 80
      #return false if @uri.scheme == 'https' && @uri.port != 443

      # Disallow IP based crawling
      (IPAddr.new(@uri.hostname) rescue nil).nil?
    end
  end

end

