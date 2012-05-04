require 'digest/md5'

module Jekyll
  class Gravatar < Liquid::Tag
    @hash = nil

    def initialize(tagname, email_address, tokens)
      @hash = Digest::MD5.hexdigest(email_address.downcase.gsub(/\s+/, ""))
    end

    def render(context)
      "<img class=\"gravatar\" src=\"http://www.gravatar.com/avatar/#{@hash}></img>"
    end

  end


end
Liquid::Template.register_tag('gravatar', Jekyll::Gravatar)
