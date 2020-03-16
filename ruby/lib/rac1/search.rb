require 'rac1/search/el_davantal'
require 'faraday'
require 'nokogiri'

module Rac1
  class Search
    URL = 'https://api.audioteca.rac1.cat'.freeze

    def search(date: Time.new)
      response = Faraday.get(
        "#{URL}/a-la-carta/cerca",
        {
          programId: program,
          sectionId: section,
          from:      date.strftime('%d/%m/%Y'),
          to:        (date + 60 * 60 * 24).strftime('%d/%m/%Y')
        }
      )

      audio_id = Nokogiri::HTML(response.body).xpath(
        '//div[@class="audioteca-listed-search"]//ul//li'
      )&.first&.[]('data-audio-id')

      return audio_id
    end
  end
end
