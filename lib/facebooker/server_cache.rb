module Facebooker
  class ServerCache
    def initialize(session)
      @session = session
    end
    
    # 
    # Stores an FBML reference on the server for use 
    # across multiple users in FBML
    def set_ref_handle(handle_name, fbml_source)
      (@session.post 'facebook.fbml.setRefHandle', :handle => handle_name, :fbml => fbml_source) == '1'
    end
    
    ##
    # Fetches and re-caches the content stored at the given URL, for use in a fb:ref FBML tag.
    def refresh_ref_url(url)
      (@session.post 'facebook.fbml.refreshRefUrl', :url => url) == '1'
    end
  end
end