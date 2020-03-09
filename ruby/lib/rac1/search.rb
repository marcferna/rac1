require 'search/el_davantal'
require 'faraday'
require 'nokogiri'

class Rac1::Search
  URL = 'https://api.audioteca.rac1.cat'

  def search(date: "06/03/2020")
    response = Faraday.get(
      "#{URL}/a-la-carta/cerca",
      {
        programId: PROGRAM,
        sectionId: SECTION,
        from:      date,
        to:        "07/03/2020"
      }
    )

    audio_id = Nokogiri::HTML(response.body).xpath(
      '//div[@class="audioteca-listed-search"]//ul//li'
    ).first['data-audio-id']
    return audio_id
  end
end
