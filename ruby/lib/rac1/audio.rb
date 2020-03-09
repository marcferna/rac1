require 'faraday'
require 'pry'

class Rac1::Audio
  def piece(audio_id:)
    response = Faraday.get(
      "https://api.audioteca.rac1.cat/piece/audio",
      { id: audio_id }
    )

    JSON.parse(response.body)['path']
  end
end
