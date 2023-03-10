# frozen_string_literal: true

module Pages
  class TestController < ApplicationController
    def hostname
      render plain: "#{`hostname`.gsub!(/[^0-9A-Za-z]/, '')} - #{DateTime.now}\n"
    end
  end
end
