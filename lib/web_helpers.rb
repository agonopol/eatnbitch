module Sinatra
  module AuthHelpers
    module Auth
      def auth(_)
        condition {redirect '/login' unless !!current_user && current_user.admin}
      end
    end
    
    module CurrentUser
      def current_user
        @current_user ||= User.find(:id => session[:user_id])
      end
    end
  end

  module ViewHelpers
    def partial(template, locals)
      haml template, {:layout => false}.merge(:locals => locals)
    end
    
    def month_date(date)
      date.strftime('%a, %b %d')
    end
        
    def month_date_long(date)
      date.strftime('%A, %B %d')
    end
        
    def content_for(key, &block)
      content_blocks[key.to_sym] << block
    end

    def yield_content(key, *args)
      content_blocks[key.to_sym].map { |content| capture_haml(*args, &content) }.join
    end

    private

    def content_blocks
      @content_blocks ||= Hash.new {|h,k| h[k] = [] }
    end
  end
  
  register AuthHelpers::Auth
  helpers AuthHelpers::CurrentUser
  helpers ViewHelpers
end

