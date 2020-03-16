require 'faraday'
require 'json'

class Rac1::Audio
  def initialize(audio_id:)
    @audio_id = audio_id
  end

  def url
    response = Faraday.get(
      "https://api.audioteca.rac1.cat/piece/audio",
      { id: @audio_id }
    )

    JSON.parse(response.body)['path']
  end
end
