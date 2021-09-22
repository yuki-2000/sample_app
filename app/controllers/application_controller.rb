class ApplicationController < ActionController::Base
    def hello
        render html: 'hello world sample app'
    end
end
