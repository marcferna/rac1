require 'faraday'
require 'pry'

class Rac1::Audio
  def piece(audio_id:)
    response = Faraday.get(
      "https://api.audioteca.rac1.cat/piece/audio",
      { id: audio_id }
    )

    binding.pry
  end
end

# response
# {"audio":{"id":"cec0057a-baad-40c9-a181-9d37494aaefb","type":"SECTION","title":"'Silenci. Vist per a sentència. Absolts.', el film","epigraph":"EL DAVANTAL DE JORDI BASTÉ","description":null,"keywords":["Trapero","De los cobos","Audiencia Nacional","Mossos"],"section":{"id":"el-davantal","type":"SECTION","title":"El davantal","program":{"id":"el-mon","methodeSectionId":"/programes/el-mon","title":"El món a RAC1","subtitle":"amb Jordi Basté","description":"","schedule":"De dilluns a divendres, de 6 a 12 h","socialNetworks":{"facebook":"https://ca-es.facebook.com/elmonarac1/","twitter":"https://twitter.com/elmonarac1?lang=ca","instagram":"https://www.instagram.com/elmonarac1/"},"images":{"app":"/rsc/img/app/el-mon.png","itunes":"/rsc/img/itunes/el-mon.png","share":"/rsc/img/share/el-mon.png","program":"/rsc/img/program/el-mon.png","person":"/rsc/img/person/el-mon.png","person-small":"/rsc/img/person-small/el-mon.png","podcast":"/rsc/img/podcast/el-mon.png"},"imageVersion":6,"email":"elmon@rac1.net","url":"http://www.rac1.cat/elmon/","active":true,"hidden":false,"sections":null,"pillAdsId":14,"itunesCategory":"NEWS_POLITICS"},"active":true,"hidden":false,"adsId":31,"itunesUrl":"https://itunes.apple.com/es/podcast/el-mon-a-rac1-el-davantal/id1169425248"},"date":"2020-03-06","time":"09:30:00","duration":"PT4M15S","length":1530671,"essential":false,"version":1,"publicationDate":"2020-03-06T08:47:00Z","endPublicationDate":null,"published":true},"appMobileTitle":"El davantal 06/03/20 'Silenci. Vist per a sentència. Absolts.', el film","appTabletTitle":"El davantal 06/03/20 'Silenci. Vist per a sentència. Absolts.', el film","source":"WEB","safeTitle":"2020-03-06-el-mon-a-rac1-el-davantal-silenci-vist-per-a-sentencia-absolts-el-film","path":"https://audioserver.rac1.cat/get/cec0057a-baad-40c9-a181-9d37494aaefb/1/2020-03-06-el-mon-a-rac1-el-davantal-silenci-vist-per-a-sentencia-absolts-el-film.mp3?source=WEB","dateTime":"2020-03-06T09:30:00+01:00","durationSeconds":255}
