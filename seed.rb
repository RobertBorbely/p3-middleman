require 'yaml'

LIBRARY = "#{Dir.pwd}/source/assets/images/lamps/" #asset path
IMAGE_EXT = '.png'

p "Create YAML files to galleries"

light_sphere_gallery = {
  en_name: 'Light sphere pictures', 
  en_plural_name: 'Light sphere picture', 
  de_name: 'Licht Sphären Bilder', 
  de_plural_name: 'Licht Sphären Bild', 
  which_gallery: 1
}

light_sphere_photos = [
  {
    en_name: 'Aurora', 
    de_name: 'Aurora',
    en_ingredients: 'Gold, manganese',
    de_ingredients: 'Gold, Mangan',
    en_desc: 'The genesis of a new universe full with energy.',
    de_desc: 'Die energiegeladene Entstehung eines neuen Universums.'
  },
  {
    en_name: 'Brillias', 
    de_name: 'Brillias',
    en_ingredients: 'Silver, cobalt',
    de_ingredients: 'Silber, Kobalt',   
    en_desc: 'The natural force of the tornado in the colourful whirl of the glass.',
    de_desc: 'Die Naturgewalt eines Tornados, in einem gläsernen Farbwirbel.'
  },
  {
    en_name: 'Dikoja', 
    de_name: 'Dikoja',
    en_ingredients: 'Silver, chrome, gold',
    de_ingredients: 'Silber, Chrom, Gold',   
    en_desc: 'The Dikoja reminds of a fossil that was formed by the temperature and the pressure preserving it forever in the fluid glass.',
    de_desc: 'Dikoja erinnert an ein Urgestein, geprägt durch Temperatur und Druck, für immer gezeichnet in flüssigem Glas.'
  },
  {
    en_name: 'Felopas', 
    de_name: 'Felopas',
    en_ingredients: 'Gold, silver, manganese',
    de_ingredients: 'Gold, Silber, Mangan',   
    en_desc: 'Existence consists of the four core elements:  earth, water, air and fire. My energy originating from these elements created Felopas.',
    de_desc: 'Alles Sein besteht aus den 4 Grundelementen Erde, Wasser, Luft und Feuer. Meine Energie aus diesen Elementen geschöpft ließ mich Felopas kreieren.'
  },
  {
    en_name: 'Fengol', 
    de_name: 'Fengol',
    en_ingredients: 'Gold, samarium',
    de_ingredients: 'Gold, SamariumG',   
    en_desc: 'Soft silk touches the floor in a ball room; the only thing left is the dancing woman and the music in our ears.',
    de_desc: 'In einem Ballsaal berührt sanfte Seide das Parkett, was bleibt ist die Tänzerin und die Musik in unseren Ohren.'
  },
  {
    en_name: 'Feron', 
    de_name: 'Feron',
    en_ingredients: 'Indium, samarium',
    de_ingredients: 'Indium, Samarium',   
    en_desc: 'As if there is a fossil from ancient times in a glass sphere.',
    de_desc: 'Wie ein Fossil der Urzeit, in einer Sphäre aus Glas.'
  },
  {
    en_name: 'Gawora', 
    de_name: 'Gawora',
    en_ingredients: 'Gold, chrome, selenium',
    de_ingredients: 'Gold, Chrom, Selen',   
    en_desc: 'A shell is created from the several layers, just like my light objects.',
    de_desc: 'Aus vielen Schichten entsteht ein Schneckenhaus, so auch meine Lichtobjekte.'
  },
  {
    en_name: 'Litana', 
    de_name: 'Litana',
    en_ingredients: 'Cobalt, gold, silver',
    de_ingredients: 'Kobalt, Gold, Silber',   
    en_desc: 'The peacock opens his shining feathering to amuse the female. The green-blue spectacle remains forever in the glass picture.',
    de_desc: 'Um sein Weibchen zu beeindrucken öffnet der Pfau sein schillerndes Federkleid. Der grün, blaue Schein für immer festgehalten in einem gläsernen Bild.'
  },
  {
    en_name: 'Makün', 
    de_name: 'Makün',
    en_ingredients: 'Chrome, cobalt, copper',
    de_ingredients: 'Chrom, Kobalt, Kupfer',   
    en_desc: 'The Makün takes you for a walk in the Pannon land and birds start their journeys from the wet, green reed.',
    de_desc: 'Makün nimmt uns mit auf einen Spaziergang durch die panonische Landschaft, zwischen dem saftigen Grün des Schilfs steigen die Vögel auf.',
    original_file_name: 'Makun'
  },
  {
    en_name: 'Nelfein', 
    de_name: 'Nelfein',
    en_ingredients: 'Chrome, silver, sulphur',
    de_ingredients: 'Chrom, Silber, Schwefel',   
    en_desc: 'As the peahen sees the peacock’s glittering and attractive dance, she surrenders to the male. What remains is a love story carved into a light sphere. ',
    de_desc: 'Geschmeichelt durch den schimmernden Tanz des Pfauenmännchens gibt sich das Pfau Weibchen ihrem Verehrer hin. Was bleibt ist eine Liebesgeschichte, festgehalten in einer Lichtsphäre.'
  },
  {
    en_name: 'Nügas', 
    de_name: 'Nügas',
    en_ingredients: 'Chrome, iron',
    de_ingredients: 'Chrom, Eisen',   
    en_desc: 'The bare top of the conquered mountain surrounded by snow and ice. It is breathtaking and mystique at the same time; the light green colour of the remote valley reduces the fear.',
    de_desc: 'Die karge Spitze des erklommenen Berges, umgeben von Schnee und Eis. Atemberaubend und mystisch zugleich, weicht die Angst dem leuchten Grün im weit entfernten Tal.',
    original_file_name: 'Nugas'
  },
  {
    en_name: 'Remari', 
    de_name: 'Remari',
    en_ingredients: 'Gold, copper, manganese',
    de_ingredients: 'Gold, Kupfer, Mangan',   
    en_desc: 'Inside of the Earth deep below the surface.',
    de_desc: 'Das innere der Erde tief unter ihrer Oberfläche.'
  },
  {
    en_name: 'Sarilapis', 
    de_name: 'Sarilapis',
    en_ingredients: 'Gold, cobalt',
    de_ingredients: 'Gold, Kobalt',   
    en_desc: 'The volcanic island remains lonely and deserted surrounded by the deep ocean.',
    de_desc: 'Einsam und verlassen, umgeben vom tiefen Ozean, bleibt die Vulkaninsel.'
  },
  {
    en_name: 'Seraf', 
    de_name: 'Seraf',
    en_ingredients: 'Gold, titanium, manganese',
    de_ingredients: 'Gold, Titan, Mangan',   
    en_desc: 'The tree heals itself with the fluid resin touching the cortex. Art lures us into another dimension and heals us there.',
    de_desc: 'Der Baum heilt sich selbst durch das flüssige Harz, das die Rinde berührt. Die Kunst heilt uns mit einer Entführung in eine andere Dimension.'
  },
  {
    en_name: 'Serena', 
    de_name: 'Serena',
    en_ingredients: 'Manganese, gold, titanium',
    de_ingredients: 'Mangan, Gold, Titan',   
    en_desc: 'The Serena smoothly arranges for the light and warmth, just like an Egyptian sun god.',
    de_desc: 'Anmutig wie der ägyptische Sonnengott ist Serena verantwortlich für Licht und Wärme.'
  },
  {
    en_name: 'Sion', 
    de_name: 'Sion',
    en_ingredients: 'Chrome, samarium, indium',
    de_ingredients: 'Chrom, Samarium, Indium',   
    en_desc: 'The last snow softens the sunshine, the Alps break into blossom and new light formulates.',
    de_desc: 'Der letzte Schnee weicht den Sonnenstrahlen, die Alpen erblühen, neues Licht entsteht.'
  }
]

fusion_light_gallery = {
  en_name: 'Fusion light object', 
  en_plural_name: 'Fusion light object', 
  de_name: 'Fusions-Lichtobjekte', 
  de_plural_name: 'Fusions-Lichtobjekt', 
  which_gallery: 2
}

fusion_light_photos = [
  {
    en_name: 'ELMIGO', 
    de_name: 'ELMIGO',
    en_ingredients: 'Manganese, neodymium, samarium',
    de_ingredients: 'Mangan, Neodym, Samarium',   
    en_desc: 'Elmigo was created jointly with Swedish glass artists, Dan Clausen and Lars Skulberg in Transjö Hytta, Sweden. The unique feature of the Elmigo is the three glass dimensions that melt into each other and create a unique light object. The surface was frozen and this results in a dull spectacle.',
    de_desc: 'Elmigo entstand in Zusammenarbeit mit den schwedischen Glaskünstlern Dan Clausen und Lars Skulberg in der Transjö Hytta in Schweden. Das besondere an Elmigo sind die drei Glasdimensionen, welche ineinander verschmelzen und ein einzigartiges Lichtobjekt entstehen lassen. Die Oberfläche wurde gefrostet und erscheint dadurch in einer matten Optik.'
  },
  {
    en_name: 'ELSAR', 
    de_name: 'ELSAR',
    en_ingredients: 'Copper, indium, silver',
    de_ingredients: 'Kupfer, Indium, Silber',   
    en_desc: 'Elsar was created jointly with Swedish glass artists, Dan Clausen and Lars Skulberg in Transjö Hytta, Sweden. Just like the tiger eye stone, Elsar keeps the balance in the body. At the sight of the two glass dimensions new power is generated in the body.',
    de_desc: 'Elsar entstand in Zusammenarbeit mit den schwedischen Glaskünstlern Dan Clausen und Lars Skulberg in der Transjö Hytta in Schweden. Wie der Stein Tigerauge hält Elsar die Balance im Körper aufrecht. Durch den Anblick der beiden Glasdimensionen entsteht im Körper neue Kraft.'
  },
  {
    en_name: 'KARIEL', 
    de_name: 'KARIEL',
    en_ingredients: 'Gold, neodymium, samarium',
    de_ingredients: 'Gold, Neodym, Samarium',   
    en_desc: 'Kariel was created jointly with Swedish glass artists, Dan Clausen and Lars Skulberg in Transjö Hytta, Sweden. This blazing flame was created by two glass dimensions melting into each other.',
    de_desc: 'Kariel entstand in Zusammenarbeit mit den schwedischen Glaskünstlern Dan Clausen und Lars Skulberg in der Transjö Hytta in Schweden. Diese lodernde Flamme entstand durch zwei ineinander verschmelzende Glasdimensionen.'
  },
  {
    en_name: 'NEOLIN', 
    de_name: 'NEOLIN',
    en_ingredients: 'Iron, chrome, europium, nickel',
    de_ingredients: 'Eisen, Chrom, Europium, Nickel',   
    en_desc: 'Neolin was created jointly with Swedish glass artists, Dan Clausen and Lars Skulberg in Transjö Hytta, Sweden. In the Neolin two complementary glass dimensions find each other. The fusion takes you on a spiritual journey in a world full of fantasies.',
    de_desc: 'Neolin entstand in Zusammenarbeit mit den schwedischen Glaskünstlern Dan Clausen und Lars Skulberg in der Transjö Hytta in Schweden. Bei Neolin treffen zwei komplementäre Glasdimensionen  aufeinander. Die Verschmelzung führt zu einer spirituellen Reise in eine Welt voller Fantasie.'
  }
]

light_phoenix_gallery = {
  en_name: 'Light phoenix', 
  en_plural_name: 'Light phoneix', 
  de_name: 'Lichtphönix', 
  de_plural_name: 'Lichtphönix', 
  which_gallery: 0
}

light_phoenix_photos = [ 
  {
    en_name: 'KARIEL light phoenix', 
    de_name: 'Lichtphönix KARIEL',
    en_ingredients: 'Gold, neodymium, samarium',
    de_ingredients: 'Gold, Neodym, Samarium',   
    en_desc: 'The vision of the creation of a light object presumes the existence of a new dimension and presents a unique piece of the glass art. The vision was created in Transjő Hytta, Sweden. The light phoenix is the articulation of my personal creativity and will in order to create something totally new.',
    de_desc: 'Die Vision ein Lichtobjekt zu kreieren, welches eine neue Dimension annimmt und ein Unikat in der Glaskunst darstellt entstand in der Transjő Hytta in Schweden. Der Lichtphönix ist der Ausdruck meiner persönlichen Kreativität und meinen Willen etwas komplett Neues zu erschaffen.'
  }
]

light_objects_gallery = {
  en_name: 'Lightobjects', 
  en_plural_name: 'Lightobject', 
  de_name: 'Lichtobjekte', 
  de_plural_name: 'Lichtobjekt', 
  which_gallery: 2
}

light_objects_photos = [
  {
    en_name: 'Kroma', 
    de_name: 'Kroma',
    en_ingredients: 'Sulphur, titanium, indium',
    de_ingredients: 'Schwefel, Titan, Indium',   
    en_desc: 'The Sun is the most beautiful source of light. The Kroma was inspired by the sunset. If you think about and let your fantasy roam then you can even see a seagull flying into remote areas.',
    de_desc: 'Die Sonne ist der schönste Lichtspender. Ein Sonnenuntergang war die Inspiration zu Kroma. Lässt man sich noch auf diesen Gedanken ein kann man mit viel Fantasie sogar eine Möwe auf ihrer Reise in die Ferne sehen.'
  },
  {
    en_name: 'Sonari', 
    de_name: 'Sonari',
    en_ingredients: 'Gold, titanium, silver',
    de_ingredients: 'Gold, Titan, Silber',   
    en_desc: 'Orange and brown are as different as women and men and their kiss melts into a unique light object.',
    de_desc: 'Orange und Braun so verschieden wie Frau und Mann, verschmilzt ihr Kuss zu einem einzigartigen Lichtobjekt.'
  },
  {
    en_name: 'Masran', 
    de_name: 'Masran',
    en_ingredients: 'Samarium, selenium, manganese',
    de_ingredients: 'Samarium, Selen, Mangan',   
    en_desc: 'When I create these new light objects I feel like an erupting volcano. This is how Masran was created. (lava, soil and sand)',
    de_desc: 'Wie ein Vulkan der ausbricht, fühle ich mich bei der Kreation neuer Lichtobjekte. Und so entstand auch Masran . (Lava, Erde , Sand )'
  },
  {
    en_name: 'Gloria', 
    de_name: 'Gloria',
    en_ingredients: 'Samarium, gold, sulphur',
    de_ingredients: 'Samarium, Gold, Schwefel',   
    en_desc: 'Gloria, the divine personalization of glory.',
    de_desc: 'Gloria wie die göttliche Personifizierung des Ruhms.'
  },
  {
    en_name: 'Rubiko', 
    de_name: 'Rubiko',
    en_ingredients: 'Silver, selenium, gold',
    de_ingredients: 'Silber, Selen, Gold',   
    en_desc: 'The gracefulness of the pink, yellow and brown touches you just like a light breeze touches the skin in a summer night.',
    de_desc: 'Die Leichtigkeit von Rosa, Gelb und Braun berührt wie eine leichte Brise die Haut wie in einer Sommernacht.'
  },
  {
    en_name: 'Jadiko', 
    de_name: 'Jadiko',
    en_ingredients: 'Sulphur, chrome, nickel',
    de_ingredients: 'Schwefel, Chrom, Nickel',   
    en_desc: 'Jadiko is like the sweet smell of cotton candy when we finally enter the market.',
    de_desc: 'Jadiko ist wie der süße Duft von Zuckerwatte, wenn man endlich den Jahrmarkt betritt.'
  },
  {
    en_name: 'Iros', 
    de_name: 'Iros',
    en_ingredients: 'Selenium, chrome, manganese',
    de_ingredients: 'Selen, Chrom, Mangan',   
    en_desc: 'Black ash after the eruption of the volcano of creativity.',
    de_desc: 'Die schwarze Asche nach einem Vulkanausbruch der Kreativität.'
  },
  {
    en_name: 'Humara', 
    de_name: 'Humara',
    en_ingredients: 'Samarium, iron, indium',
    de_ingredients: 'Samarium, Eisen, Indium',   
    en_desc: 'The Humara’s yellow colour has the same effect as a beesting.',
    de_desc: 'Humara besticht durch ihr gelb wie der Stich einer Biene.'
  },
  {
    en_name: 'Tibaka', 
    de_name: 'Tibaka',
    en_ingredients: 'Titanium, indium, silver',
    de_ingredients: 'Titan, Indium, Silber',   
    en_desc: 'Like the feathering of an owl.',
    de_desc: 'Wie das Federkleid eines Uhus.'
  },
  {
    en_name: 'Komal', 
    de_name: 'Komal',
    en_ingredients: 'Indium, titanium',
    de_ingredients: 'Indium, Titan',   
    en_desc: 'Komal lures you in such a special way into another world of sense like the voice waves of a bat.',
    de_desc: 'So besonders wie die Schallwellen einer Fledermaus, entführt Komal in eine andere Welt der Wahrnehmung.'
  },
  {
    en_name: 'Florenz', 
    de_name: 'Florenz',
    en_ingredients: 'Titanium, gold, indium',
    de_ingredients: 'Titan, Gold, Indium',   
    en_desc: 'Like the shining sun mirrored on marble and eternized in glass.',
    de_desc: 'Wie die schimmernde Sonne im spiegelnden Marmor, gefangen in Glas.'
  },
  {
    en_name: 'Numara', 
    de_name: 'Numara',
    en_ingredients: 'Titanium, copper, gold',
    de_ingredients: 'Titan, Kupfer, Gold',   
    en_desc: 'The shining scale of koi inspired the Numara. ',
    de_desc: 'Das schillernde Schuppengeflecht eines Kois hat mich zu Numara inspiriert.'
  },
  {
    en_name: 'Iroma', 
    de_name: 'Iroma',
    en_ingredients: 'Titanium, selenium, silver',
    de_ingredients: 'Titan, Selen, Silber',   
    en_desc: 'When the fluid resin becomes amber stone.',
    de_desc: 'Wie das flüssige Harz bevor Bernstein entsteht.'
  },
  {
    en_name: 'Savi', 
    de_name: 'Savi',
    en_ingredients: 'Chrome, iron, neodymium',
    de_ingredients: 'Chrom, Eisen, Neodym',   
    en_desc: 'The feeling of the warm sun on the neck standing next to a blossoming lavender field.',
    de_desc: 'Das warme Gefühl der Sonne im Nacken, wenn man vor einem blühenden Lavendelfeld steht.'
  },
  {
    en_name: 'Sanün', 
    de_name: 'Sanün',
    en_ingredients: 'Chrome, selenium',
    de_ingredients: 'Chrom, Selen',   
    en_desc: 'The Sanün is like from another planet - alien.',
    de_desc: 'Sanün ist wie von einem anderen Planeten – außerirdisch.',
    original_file_name: 'Sanun'
  },
  {
    en_name: 'Murün', 
    de_name: 'Murün',
    en_ingredients: 'Chrome, iron, praseodymium',
    de_ingredients: 'Chrom, Eisen, Praseodym',   
    en_desc: 'The Murün attracts the readers of Style up your Life! magazine with its unique light.',
    de_desc: 'Murün verzaubert durch ihr einzigartiges Leuchten viele Leser des Style up your Life! Magazines.',
    original_file_name: 'Murun'
  },
  {
    en_name: 'Saakron', 
    de_name: 'Saakron',
    en_ingredients: 'Chrome, indium, manganese',
    de_ingredients: 'Chrom, Indium, Mangan',   
    en_desc: 'The juicy green of fresh olives in Greece.',
    de_desc: 'Das saftige Grün von frischen Oliven in Griechenland.'
  },
  {
    en_name: 'Sarkan', 
    de_name: 'Sarkan',
    en_ingredients: 'Neodymium, indium',
    de_ingredients: 'Neodym, Indium',   
    en_desc: 'As diverse as the California coast, one side is similar to a landscape with a thousand orange trees, while the backside of Sakran mirrors the purple and blue clouds above the sea.',
    de_desc: 'So verschieden wie die Küste in Kalifornien, ähnelt eine Seite der Landseite mit ihren tausenden Orangenbäumen, die Rückseite Sakrans reflektiert die violetten Wolken über dem Meer.'
  },
  {
    en_name: 'Smaral', 
    de_name: 'Smaral',
    en_ingredients: 'Samarium, iron, cobalt',
    de_ingredients: 'Samarium, Eisen, Kobalt',   
    en_desc: 'The glittering gold meets the deep blue of the ocean. The heat of the glass blowing and this combination of colours invites you on a trip to the remote Abu Dhabi.',
    de_desc: 'Schimmerndes Gold trifft das tiefe Blau des Ozeans. Die Hitze beim Glasblasen und diese Farbkombination nimmt mich auf eine Reise mit in das ferne Abu Dhabi.'
  },
  {
    en_name: 'Schikoi', 
    de_name: 'Schikoi',
    en_ingredients: 'Nickel, copper, titanium',
    de_ingredients: 'Nickel, Kupfer, Titan',   
    en_desc: 'The Schikoi is like the whisper of the leaves when autumn is slowly nearing.',
    de_desc: 'Schikoi lässt einen das Knistern des Laubes spüren, wenn langsam der Herbst beginnt.'
  },
  {
    en_name: 'Greta', 
    de_name: 'Greta',
    en_ingredients: 'Gold, nickel',
    de_ingredients: 'Gold,  Nickel',   
    en_desc: 'The fusion of gold and nickel mirrors the blazing fire.',
    de_desc: 'Gold und Nickel ineinander verschmolzen spiegeln eine lodernde Flamme.'
  },
  {
    en_name: 'Gomaka', 
    de_name: 'Gomaka',
    en_ingredients: 'Titanium, europium, sulphur',
    de_ingredients: 'Titan, Europium, Schwefel',   
    en_desc: 'A path in the woods lit by the sun through the tree crowns.',
    de_desc: 'Ein Weg im Wald,  hell durch die Sonne die sich durch die dichten Baumkronen drängt.'
  },
  {
    en_name: 'Montana', 
    de_name: 'Montana',
    en_ingredients: 'Cobalt, gold',
    de_ingredients: 'Kobalt, Gold',   
    en_desc: 'The magic of the pink and blue sky after a heavy rain is mirrored in the endless distance of the clouds.',
    de_desc: 'Die Magie eines rosa, blauen Himmels nach einem starken Regen reflektiert in der unendlichen Weite der Wolken.'
  },
    {
    en_name: 'Lapam', 
    de_name: 'Lapam',
    en_ingredients: 'Silver, cobalt, nickel',
    de_ingredients: 'Silber, Kobalt, Nickel',   
    en_desc: 'Attracts my senses, the different colours meet mildly just like the perfume of a beautiful lady tickles the nose when she steps into the room.',
    de_desc: 'Lapam verzaubert meine Sinne, die verschiedenen Farben treffen sanft aufeinander, wie das Parfum einer wunderschönen Frau die Nase kitzelt, wenn sie den Raum betritt.'
  },
  {
    en_name: 'Jamusa', 
    de_name: 'Jamusa',
    en_ingredients: 'Titanium, copper, silver',
    de_ingredients: 'Titan, Kupfer, Silber',   
    en_desc: 'The amazing animal theatre of the Serengeti savannah eternalized in glass and regains life as a light object.',
    de_desc: 'Das gewaltige Tierschauspiel der Steppe Serengeti in Glas geschmolzen und als Lichtobjekt belebt.'
  },
  {
    en_name: 'Jatis', 
    de_name: 'Jatis',
    en_ingredients: 'Titanium, copper, silver',
    de_ingredients: 'Titan, Kupfer, Silber',   
    en_desc: 'A form of water. Jatis is a mirage created by me.',
    de_desc: 'Die Erscheinung von Wasser. Jatis, meine selbstkreierte Fata Morgana.'
  },
  {
    en_name: 'Flamour', 
    de_name: 'Flamour',
    en_ingredients: 'Selenium, manganese, gold',
    de_ingredients: 'Selen, Mangan, Gold',   
    en_desc: 'Flamour attracts you just like a flamingo with its unique pink feathering. ',
    de_desc: 'Der Flamingo fasziniert durch sein einzigartiges rosa Federkleid so auch Flamour. '
  },
    {
    en_name: 'Roka', 
    de_name: 'Roka',
    en_ingredients: 'Indium, silver, chrome',
    de_ingredients: 'Indium, Silber, Chrom',   
    en_desc: 'Roka is like a glowing glass furnace in which my light objects are manufactured. ',
    de_desc: 'Roka gleicht dem glühenden Glasofen in dem meine Lichtobjekte entstehen. '
  },
  {
    en_name: 'Oroma', 
    de_name: 'Oroma',
    en_ingredients: 'Indium, selenium, silver',
    de_ingredients: 'Indium, Selen, Silber',   
    en_desc: 'The burning sun. ',
    de_desc: 'Die brennende Sonne. '
  },
  {
    en_name: 'Merapis', 
    de_name: 'Merapis',
    en_ingredients: 'Gold, cobalt, silver',
    de_ingredients: 'Gold, Kobalt, Silber',   
    en_desc: 'The amazing planet, the Earth where we live inspired me to prepare this light object. ',
    de_desc: 'Die Erde, ein faszinierender Planet auf dem wir leben, inspirierte mich zu diesem Lichtobjekt. '
  },
  {
    en_name: 'Sopal', 
    de_name: 'Sopal',
    en_ingredients: 'Silver, chrome, titanium',
    de_ingredients: 'Silber, Chrom, Titan',   
    en_desc: 'The Sopal reminds of meeting with a green praying mantis. Its shining green colour and living environment creates the colour combination of Sopal. ',
    de_desc: 'Sopal erinnert mich an die Begegnung mit einer grünen Gottesanbeterin. Ihr strahlendes Grün und ihr Lebensraum ließen die Farbkombination für Sopal entstehen.'
  },
  {
    en_name: 'Kansali', 
    de_name: 'Kansali',
    en_ingredients: 'Silver, indium, titanium',
    de_ingredients: 'Silber, Indium, Titan',   
    en_desc: 'The sweet smeel of honey, the god-like nectar is as fluid as the glass the Kansali consists of.',
    de_desc: 'Der süße Duft von Honig, der göttliche Nektar, flüssig wie das Glas aus dem Kansali entstand.'
  },
  {
    en_name: 'Erdos', 
    de_name: 'Erdos',
    en_ingredients: 'Titanium, iron, sulphur',
    de_ingredients: 'Titan, Eisen, Schwefel',   
    en_desc: 'As the leaves are blown away by the autumn from the trees, this is how Erdos reminds us of this beautiful season.',
    de_desc: 'Wie der Herbst die Blätter von den Bäumen weht, erinnert Erdos an diese wunderschöne Jahreszeit.'
  },
  {
    en_name: 'Orogo', 
    de_name: 'Orogo',
    en_ingredients: 'Titanium, iron, sulphur',
    de_ingredients: 'Titan, Eisen, Schwefel',   
    en_desc: 'The Orogo reminds us of the hissing of a snake and the sight of its glistening scaled skin.',
    de_desc: 'Orogo erinnert an das zischen einer Schlange und der Anblick ihrer schillernden und schuppigen Haut.'
  },
  {
    en_name: 'Piera', 
    de_name: 'Piera',
    en_ingredients: 'Copper, gold, titanium',
    de_ingredients: 'Kupfer, Gold, Titan',   
    en_desc: 'The Piera changes its colour in such a breathtaking way depending on the angles of the light like the rocks of the Grand Canyon. Nature’s magic in a light object.',
    de_desc: 'So atemberaubend wie das Gestein des Grand Canyons, verändert Piera mit Lichteinfall ihre Farbe. Die Magie der Natur gezeichnet in einem Lichtobjekt.'
  },
  {
    en_name: 'Dimal', 
    de_name: 'Dimal',
    en_ingredients: 'Titanium, gold',
    de_ingredients: 'Titan, Gold',   
    en_desc: 'Reminds us of an African night.',
    de_desc: 'Erinnert an einen Traum in Afrikas Nächten.'
  }
]

############## SEED Logic >>>>>>>>>>>>>>>>>>>>>>



def upload_image(photos, gallery)
  photos.each do |photo|
    image_hash = {
      thumbnail: photo_file(photo, 'Thumbnail',gallery),
      front: photo_file(photo, 'Front',gallery),
      magnified_front: photo_file(photo, 'Magnified_Front',gallery)
    }
    unless gallery.en_name.eql? 'Light sphere pictures'
      image_hash[:back] = photo_file(photo, 'Back',gallery)
      image_hash[:magnified_back] = photo_file(photo, 'Magnified_Back',gallery)
    end
    p_hash = photo.merge image_hash
    # gallery.gallery_photos.create p_hash
    File.open("data/#{filename}.yml", 'w') {|f| f.write data.to_yaml } #Store
  end

end

require 'pry'

def photo_file(photo, type, gallery)
  File.open File.join(LIBRARY, 
                      type.downcase, 
                      gallery[:en_name].gsub(' ','_').downcase.to_s ,
                      "#{ photo[:original_file_name] ? photo[:original_file_name] : photo[:en_name].to_s}_#{type.to_s}#{IMAGE_EXT}"), 'r'
  # this will send an error if file is missing
  # url for the image
  "/assets/images/lamps/#{type.downcase}/#{gallery[:en_name].gsub(' ','_').downcase.to_s}/#{ photo[:original_file_name] ? photo[:original_file_name] : photo[:en_name].to_s}_#{type.to_s}#{IMAGE_EXT}"
end

def create_yml_files(filename, photos, gallery)
  photos.each_with_index do |photo, index|
    image_hash = {
      thumbnail: photo_file(photo, 'Thumbnail',gallery),
      front: photo_file(photo, 'Front',gallery),
      magnified_front: photo_file(photo, 'Magnified_Front',gallery)
    }
    unless gallery[:en_name].eql? 'Light sphere pictures'
      image_hash[:back] = photo_file(photo, 'Back',gallery)
      image_hash[:magnified_back] = photo_file(photo, 'Magnified_Back',gallery)
    end
    p_hash = photo.merge image_hash
    photos[index] = p_hash
    # gallery.gallery_photos.create p_hash
  end

  gallery[:photos] = photos
  File.open("data/#{filename}.yml", 'w') {|f| f.write gallery.to_yaml } #Store
end

p 'Uploading light sphere photos'
create_yml_files('light_sphere_gallery', light_sphere_photos, light_sphere_gallery)
# upload_image(light_sphere_photos, light_sphere_gallery)

p 'Uploading fusion light photos'
create_yml_files('fusion_light_gallery', fusion_light_photos, fusion_light_gallery)

p 'Uploading light phoenix photos'
create_yml_files('light_phoenix_gallery', light_phoenix_photos, light_phoenix_gallery)

p 'Uploading light object photos'
create_yml_files('light_object_gallery', light_objects_photos, light_objects_gallery)

#<<<<<<<<<<<<< End of Seed Logic

