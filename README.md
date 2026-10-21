# 🌍 EarthVault

> **A Beautiful, Interactive Data Visualization Platform for Exploring Our Planet's Environmental, Social & Cultural Metrics**

## 🖥️ Visit: https://chamitro.github.io/EarthVault/

---

## ✨ Features

#### 📊 **47 Data Visualization Sections**
EarthVault provides comprehensive insights across environmental, social, economic, and cultural dimensions:

#### 🌍 **Environmental Data (13 sections)**
- 🌪️ **Weather Archive** - 50+ years of historical climate data with daily temperature records and extreme weather tracking
- 🌊 **Ocean Pulse** - Live sea surface temperature, wave height and marine heatwave tracking for any coastal city, with a daily record back to late 2022
- 🌳 **Forest Heritage** - Global deforestation rates and forest coverage trends
- 🌾 **Agriculture** - Agricultural land use intensity and farming trends
- ⚡ **Energy & Renewables** - Clean energy transition tracking and renewable adoption rates The World Bank renewable series ends in 2021, so later years are derived as 100% minus the fossil and nuclear shares, which run to the latest year and sum to within half a point of the published figure
- 💧 **Water Safety** - Access to safely managed drinking water sources
- 🏭 **Carbon Emissions** - CO₂ emissions tracking per capita and environmental impact
- 🐾 **Endangered Species** - Threatened mammals, birds, fish, and plants (% of global threatened species)
- ♻️ **Waste & Recycling** - Live OECD municipal waste data: recycling, composting, incineration, landfill and kg per person, through 2024
- 🔌 **Power Mix** - Fossil, coal and nuclear shares of electricity plus electricity use per person
- 🌫️ **Air Quality** - 30+ years of annual PM2.5 exposure against the WHO guideline, with a live reading in the capital
- 🏜️ **Water Stress** - Freshwater withdrawal as a share of renewable resources (FAO levels), rainfall and live river flow near the capital
- 🦋 **Wildlife Gallery** - Real wildlife photos spotted by citizen scientists in any country (GBIF/iNaturalist), with common names, a breakdown of what lives there and a shuffle button

#### 👥 **Social & Health Metrics (9 sections)**
- 🎓 **University Access** - Global tertiary education enrollment with gender parity analysis
- ⏳ **Human Lifespan** - Life expectancy trends with male/female breakdowns
- 🤱 **Generations** - Fertility rates and demographic transitions
- 🧠 **Mental Health** - Suicide mortality per 100,000 (WHO via World Bank) with male/female breakdown and world comparison
- 😊 **Happiness & Wellbeing** - World Happiness Report life satisfaction scores with global rank, trend since 2011, working hours and safety context
- ✈️ **Migration & Diaspora** - Net migration, brain drain/gain, and remittances data
- 🏥 **Health: Public vs Private** - Healthcare spending distribution and government vs private expenditure
- 💼 **Economy & Labor Market** - GDP per capita, unemployment rates, GINI index, labor force participation
- 🏛️ **Education: Public vs Private** - School enrollment distribution between public and private sectors

#### 🎮 **Games (4 sections)**
- 🏠 **Home** - The front door after the splash: a hero with live tiles (quakes today, wildfires tracked, the hottest capital this minute, the Kp index), four featured doors (globe, stories, quiz, country profile), a Continue chip for the vault you used last, and every vault grouped by category. The logo and a 🏠 button return to it
- 🔍 **Command palette** - Ctrl K (or the 🔍 button) opens a search over all 47 vaults and every country; arrow keys and Enter jump straight to a vault or a country profile
- ✨ **Interface polish** - Shimmer skeletons while live sections load, sections fade and lift into place, clickable cards rise on hover, and everything respects `prefers-reduced-motion`
- 🌐 **Live Globe** - The planet in 3D (Globe.gl, loaded only when opened): live fires, storms, floods, volcanoes from GDACS and NASA EONET, a week of USGS earthquakes with rings for M5.5+, every capital coloured by its temperature right now, and the ISS moving every 5 seconds. Countries can be coloured by forest cover, life expectancy, happiness, internet use, emissions per person, air pollution, fertility or renewables, and tapping a country opens its profile. Also reachable from the splash screen
- 🧭 **Country Profile** - One page per country, linkable as `?country=GR`: flag, capital, region, income group and population; the weather in the capital right now; active alerts in that country; all 25 measures from every vault with their year and world rank; the five closest twins; and a chip into every vault for that country or its capital
- 📖 **Earth Stories** - Nine guided, scroll-driven tours drawn live from the data, linkable as `?vault=stories&story=…`, with a reading-progress bar, numbers that count up and charts that draw as they scroll into view: This week on Earth (rebuilt from the live feeds on every visit: seven days of USGS quakes, fires by country, active cyclones, floods, volcanoes and red alerts, the hottest and coldest capitals this minute, three days of Kp index and the ISS position), The carbon century (NOAA CO₂ and NASA GISTEMP warming stripes), The sea is warming too (HadSST sea-surface anomaly since 1850 and global sea level since 1880 via Our World in Data), Where the forests went (World Bank forest cover since 1990), The renewable turn (Our World in Data / Ember electricity mix: renewables, solar and wind since 1985), Eight billion of us (world population, fertility, life expectancy and urban share since 1960), Who lives longest (the ten longest- and shortest-lived countries and sixty years of life expectancy), Where people are moving (net migration today and since 1990) and The Mediterranean is heating (ERA5 daily archive for Athens, Rome and Barcelona since 1980)
- 🎯 **Planet Quiz** - Starts within a second on capitals, flags and live questions while the World Bank figures load in the background, then adds the data questions. Seven kinds of question on real data, mixed at random: higher or lower between two countries (25 measures), top of four, capitals, flags, estimate-on-a-slider (a guess within 10% of the slider range counts, shown before you lock in), and two live ones from Open-Meteo: which capital is warmer right now and where it is later in the day (with a hint button that explains the east-to-west rule and each city's longitude). Streaks, confetti milestones, an explore button into the matching vault, share, challenge-by-link (seeded, live kinds excluded) and the global leaderboard
- 🕵️ **Mystery Country** - One secret country a day, the same for everyone. Six guesses; every miss unlocks a clue (region, population, forest and life expectancy, capital hint, neighbours, flag) and tells you how far off you were and in which direction. Streaks, stats and a Wordle-style share grid
- 🌡️ **Hot or Not** - Two cities, live temperatures from Open-Meteo: which one is warmer at this moment? The answer changes through the day
- 🚩 **Flag Flash** - Thirty seconds, four choices per flag, with distractors from the same region. Personal best and share
- ⚔️ **Challenge a friend** - Planet Quiz, Hot or Not and Flag Flash each have a "Challenge a friend" button. It starts a seeded round (10 questions, or the same flag deck for 30 seconds), then gives you a link with your score. Your friend opens it, plays the exact same questions, and both scores appear side by side with a winner. They can send their result back and you see who won without playing again. No account and no server: everything is encoded in the link (`?vault=quiz&ch=<seed>&cs=<score>&cb=<name>`)
- 🌍 **Global leaderboard** - When a Planet Quiz or Hot or Not streak ends, a Flag Flash round finishes or the daily Mystery Country is solved, the page posts the result (name, score, country of the browser language, a random device id) to a small Supabase table and shows the top 5 players all time and in the last 24 hours, plus your rank. The publishable key in the page can only insert scores and read the `leaderboard` view (every round counts, so one strong player may hold several of the top 5 places); a database trigger limits one score per device every 20 seconds and 200 a day and cleans names. Seeded challenge rounds are never posted

#### 🛰️ **Live Earth (11 sections)**
- 🌍 **Planet Right Now** - Live leaderboards across 56 cities: hottest, coldest, windiest, cleanest and most polluted air, strongest UV, plus how many are clear, raining, snowing or in night. Refreshes every 10 minutes
- 🛰️ **Planet Alerts** - Worldwide wildfires, floods, cyclones, volcanic eruptions and droughts from GDACS (the EU and UN disaster alert system, with green/orange/red impact levels), icebergs and US fire incidents from NASA EONET, and the last 24 hours of M4.5+ earthquakes from USGS. Tap a category tile to list every event in it, or filter by country or place ("Greece", "Australia"). No search needed
- ☀️ **Space Weather** - NOAA geomagnetic, radio and radiation scales, Kp history and forecast, aurora outlook, solar wind and the latest bulletins
- 🚀 **Space Station Tracker** - The ISS on a world map, refreshed every 5 seconds, with speed, altitude, daylight and the country or ocean it is flying over
- 🌌 **Sky Tonight** - For any city: sunset and golden hour, when the sky is fully dark, moon phase and illumination, cloud cover now, aurora chance from NOAA's live forecast, sunrise and UV tomorrow, and a plain verdict on stargazing conditions
- ☄️ **Asteroid Watch** - Every near-Earth object passing this week from NASA's NeoWs: size compared to everyday objects, speed, miss distance in lunar distances, hazard flag
- 📅 **On This Day on Earth** - Wikipedia's events for today, with planet, nature and space moments highlighted, and a random-day button
- 🐾 **Wildlife Near You** - iNaturalist sightings within 40 km of any city in the last 30 days: most-seen species and the latest photos
- 🏃 **Best Hour Outside** - The next 48 hours for any city scored 0-100 for being outdoors, blending feels-like temperature, rain chance, wind, UV, European air-quality index and pollen. Shows the best two-hour window today and tomorrow, the hour to avoid, a 48-hour score chart, and the best hour for a walk, run, ride or picnic
- 🌴 **Perfect Weather Finder** - Pick your ideal temperature on a slider and see which of 208 capital cities have it at this very moment, with sunny-only, daytime-only and region filters. Live readings from Open-Meteo for every capital in two calls, refreshed every 10 minutes

#### 🧰 **Tools (5 sections)**
- ⚖️ **Country vs Country** - Any two countries side by side on 16 World Bank metrics, with a two-line history chart and a plain-language verdict
- 👯 **Country Twins** - Type a country and get its five closest twins across 25 measures drawn from the other vaults: fertility, life expectancy, ageing, population, GDP per person, unemployment, inequality, internet, degrees, education and health spending, suicide rate, happiness, migrants, forest, farmland, rainfall, water, water stress, air pollution, renewables, fossil power, electricity use, emissions per person and threatened species. Every number is shown side by side with a green/amber/red closeness dot, plus the least similar country and a jump to Country vs Country. Each measure is scaled by the interquartile range across all countries (log scale for money, population and pollution), so the match is a fair average The processed dataset is kept in the browser for a day, so later visits and the quiz open instantly and survive a World Bank outage
- 🎂 **The Planet Since You Were Born** - Enter your birth date (and optionally your city) for a personal Earth report: days alive, orbits around the Sun, distance travelled through space, full moons, ISS orbits, then-and-now tiles for CO₂ (NOAA Mauna Loa), global temperature (NASA GISTEMP), world population, life expectancy, urbanisation, internet, renewables, forest and emissions, and the actual weather in your city on the day you were born versus your last birthday (Open-Meteo ERA5 archive, 1940 onwards)

#### 🌐 **Digital & Cultural (5 sections)**
- 🌐 **Internet Access** - Digital connectivity and internet penetration with gender breakdowns
- 🎵 **Music Culture** - Top artists and tracks by country (powered by Last.fm)
- 🎬 **Cinema Discovery** - Box office data and trending movies (powered by TMDB)
- 📊 **Internet Trends** - Real-time trending topics from Reddit (global r/all + country subreddits)
- 🏙️ **City Stories** - Type any city for its founding date and age, population and density, local time, nickname and demonym, the most famous people born there (with portraits), six dated moments from its history, and twin cities you can hop to


### 🎨 **Modern UI/UX**
- ⚔️ **Challenge links** - Any game round can be shared as a link that reproduces the same questions for a friend and compares the two scores
- 📲 **Installable app (PWA)** - Open the site on a phone and tap "Install" (Android Chrome shows the prompt, iPhone users go via Share → Add to Home Screen). EarthVault then runs full-screen from its own icon, the shell works offline, and long-pressing the icon on Android offers shortcuts to Mystery Country, Planet Quiz, Planet Right Now and Best Hour Outside. Deep links like `?vault=mystery` open a vault directly
- 🇬🇷 **Greek interface** - An EN/ΕΛ toggle in the header and on the splash screen switches the menu, titles, descriptions, search row, tips and shared labels to Greek (auto-selected for Greek browsers, remembered between visits). Data from the sources stays in English
- 🛂 **Country Passport** - Every country result opens with the flag, capital, region, income group and population
- 🎲 **Surprise Me** - A dice button next to the search box picks a random place for the current vault
- 📸 **Share Cards** - One click turns any result into a shareable 1200×630 image (native share sheet on phones, download on desktop)
- 🧭 **Explorer Progress** - A counter in the header tracks how many of the 47 vaults you have opened, with milestone celebrations
- 🛰️ **Earth Today** - The splash screen shows the latest full-disc photo of Earth from NASA's EPIC camera
- 💡 **First-visit Tips** - A dismissable three-step guide; press `/` anywhere to jump to the search box
- 🌊 **Tides in Ocean Pulse** - Current tide height and the next high or low water for any coastal city
- 🌼 **Pollen & UV in Air Quality** - The live capital reading now includes UV and pollen levels (Europe)
- 🔎 **Search-engine ready** - `sitemap.xml` (home, privacy, all 47 `?vault=` links, the nine stories and every `?country=` profile, 275 URLs), `robots.txt`, canonical and Open Graph tags, and a title and description that change per vault so each deep link reads as its own page
- 🛰️ **Live splash counters** - Earthquakes in the last 24 hours, wildfires burning now and the current Kp index, next to the statistical daily estimates
- 🔎 **Vault Finder** - Type to filter the 47 vaults in the menu; the last vault you used is offered as a Continue chip on the home screen
- 💬 **Friendly Feedback** - Non-blocking toasts replace browser alerts; empty or failed searches never leave stale data on screen
- 🧭 **Guided Search** - Every vault shows a one-line description and "Try" example chips; Enter submits, and results scroll into view on phones
- 📱 **Phone-first Checks** - Verified at 390px: no horizontal overflow, 44px tap targets in the menu, 3-column timeline grid
- ✨ **Animated Particle Background** - Dynamic canvas-based particle system creating an immersive environment
- 📈 **Real-time Number Counters** - Smooth easing animations for live statistics and data transitions
- 🎯 **Interactive Elements** - Hover effects, micro-interactions, and responsive feedback on all components
- 📱 **Fully Responsive** - Optimized layouts for mobile, tablet, and desktop devices with adaptive breakpoints
- 🌓 **Dark Mode First** - Beautiful dark slate theme with glassmorphism design and vibrant accent colors
- 🎭 **Smooth Transitions** - Polished animations between sections, mode switches, and data view changes
- 📊 **Interactive Charts** - Dynamic multi-line charts with Chart.js showing historical trends
- 🗓️ **Timeline Grids** - Year-by-year historical data visualization with peak/floor indicators and color coding
- 🎨 **Category Color Coding** - Distinct colors for each category (Green for environment, Pink for social, Blue for digital, Yellow for economy)
- 🎲 **Rotating Fun Facts** - Educational and engaging facts for each section that refresh dynamically
- 💡 **Contextual Notes** - Explanatory text helping users understand data meaning and significance
- 🏷️ **Data Attribution** - Clear "Data by [Source]" labels on every section for transparency

---

## 📲 Install on a phone

EarthVault is a Progressive Web App, so it installs from the browser with no app store:

- **Android (Chrome, Edge, Samsung Internet):** open https://chamitro.github.io/EarthVault/ and tap the green **Install** button in the header, or the browser's own "Install app" prompt.
- **iPhone / iPad (Safari):** tap **Share**, then **Add to Home Screen**.
- **Desktop (Chrome, Edge):** click the install icon in the address bar.

The pieces behind it: `manifest.json` (name, icons, theme, shortcuts), `sw.js` (network-first service worker that keeps the shell available offline; live data always goes to the network) and the icon set in `icons/`. To ship the same app on Google Play later, wrap this PWA as a Trusted Web Activity with PWABuilder or Bubblewrap; no code changes are needed.

---

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| **HTML5** | Semantic structure and markup |
| **CSS3** | Modern styling with custom animations |
| **Tailwind CSS** | Utility-first styling framework |
| **JavaScript (ES6+)** | Interactive functionality and data processing |
| **Canvas API** | Particle animation system |
| **Chart.js** | Interactive data visualization charts |
| **localStorage API** | Client-side caching for performance |
| **Fetch API** | Asynchronous data retrieval |

---

## 📊 Data Sources

### 🔌 **External APIs**

#### **World Bank Open Data**
Social, economic, and environmental indicators (Country Twins pulls 21 of them for every country in four multi-indicator calls with `source=2&mrnev=1`, plus the four threatened-species counts one by one; the capital-city coordinates from the country list power the Perfect Weather Finder):
- Forest coverage (AG.LND.FRST.ZS)
- Agricultural land (AG.LND.AGRI.ZS)
- Renewable energy (EG.ELC.RNEW.ZS)
- Water access (SH.H2O.SMDW.ZS)
- University enrollment (SE.TER.CUAT.BA.ZS)
- Life expectancy (SP.DYN.LE00.IN)
- Fertility rates (SP.DYN.TFRT.IN)
- Suicide mortality, total / female / male (SH.STA.SUIC.P5, SH.STA.SUIC.FE.P5, SH.STA.SUIC.MA.P5)
- Electricity from fossil fuels, coal and nuclear (EG.ELC.FOSL.ZS, EG.ELC.COAL.ZS, EG.ELC.NUCL.ZS) and use per person (EG.USE.ELEC.KH.PC)
- PM2.5 exposure (EN.ATM.PM25.MC.M3)
- Water stress and precipitation (ER.H2O.FWST.ZS, AG.LND.PRCP.MM)
- Carbon emissions (EN.GHG.ALL.MT.CE.AR5)
- Internet usage (IT.NET.USER.ZS)

**API Documentation:** [data.worldbank.org](https://data.worldbank.org)

#### **Open-Meteo**
Historical weather and climate data:
- Temperature (daily max, mean)
- Humidity (relative)
- Air quality (PM2.5)
- 50+ years of climate records

**Open-Meteo Marine API** (Ocean Pulse):
- Current sea surface temperature, wave height and ocean current velocity
- Daily sea surface temperature means and maxima (archive begins November 2022)

**API Documentation:** [open-meteo.com](https://open-meteo.com) · [Marine Weather API](https://open-meteo.com/en/docs/marine-weather-api)


#### **Our World in Data**

Powers the Happiness & Wellbeing Vault. Three small CSV series, fetched directly from the grapher endpoints and cached monthly in localStorage:
- Life satisfaction (Cantril ladder, 0-10) from the World Happiness Report, 2011 to the latest survey year
- Annual working hours per employed person
- Intentional homicide rate per 100,000 people (UNODC)
- For Earth Stories, cached for a day: sea-surface temperature anomaly (HadSST, world and both hemispheres since 1850), global sea level (Church & White and UHSLC, quarterly since 1880) and the electricity mix (Ember / Energy Institute: renewables, solar and wind shares since 1985 for every country). The grapher CSV endpoints follow redirects and allow CORS

**API Documentation:** [ourworldindata.org](https://ourworldindata.org/happiness-and-life-satisfaction)

#### OECD (Organisation for Economic Co-operation and Development)

Drives the Waste & Recycling Vault through the live OECD SDMX API (dataset `DSD_MUNW@DF_MUNW`), cached monthly in the browser:
- Recycling, composting, incineration and landfill as a share of treated municipal waste
- Municipal waste generated per person (kg/year)
- Covers OECD members and most European countries, 2000 to the latest reported year

**API Documentation:** [sdmx.oecd.org](https://sdmx.oecd.org/public/rest/)

#### **Last.fm**
Music discovery and trends:
- Top artists by country
- Track popularity and listeners
- Geographic music preferences

**API Documentation:** [last.fm/api](https://www.last.fm/api)

#### **The Movie Database (TMDB)**
Cinema data and analytics:
- Top-rated films by country
- Movie ratings and vote counts
- Primary production country verification
- Release dates and metadata

**API Documentation:** [themoviedb.org/documentation/api](https://www.themoviedb.org/documentation/api)

#### **GDACS, NASA EONET & USGS**

Power Planet Alerts (live, no search):
- GDACS event list API (`gdacsapi/api/events/geteventlist/SEARCH`), one call per event type with a short window: wildfires 7 days, floods 14 days, cyclones and eruptions 30 days, ongoing droughts, orange/red earthquakes 30 days. Each event carries its alert level, affected countries, severity (hectares burned, peak wind, magnitude and depth) and a report link
- EONET v3 open events of the last 30 days, used for sea and lake ice and for US wildfire incidents (controlled "prescribed" burns are left out; EONET's wildfire feed only covers the United States and its storm list lags, so GDACS is the source for both worldwide)
- USGS GeoJSON feeds: all M4.5+ earthquakes in the past day and significant earthquakes of the past week

**API Documentation:** [eonet.gsfc.nasa.gov](https://eonet.gsfc.nasa.gov/docs/v3) · [earthquake.usgs.gov](https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php)

#### **NOAA Space Weather Prediction Center**

Powers Space Weather (live, no search): NOAA scales (G/R/S), planetary Kp index and 3-day forecast, solar wind speed and Bz, F10.7 flux, latest X-ray flare and alert bulletins.

**API Documentation:** [swpc.noaa.gov/products](https://www.swpc.noaa.gov/products-and-data)

#### **GBIF (Global Biodiversity Information Facility)**

Powers the Wildlife Gallery: occurrence counts by animal class, recent human observations with photos (mostly iNaturalist, Creative Commons) and English vernacular names. No key required.

**API Documentation:** [techdocs.gbif.org](https://techdocs.gbif.org/en/openapi/)

#### **Where the ISS at? & BigDataCloud**

Power the Space Station Tracker: live ISS latitude, longitude, altitude, velocity and visibility every 5 seconds, plus free reverse geocoding to name the country or ocean below. Map background: Wikimedia Commons equirectangular projection.

**API Documentation:** [wheretheiss.at/w/developer](https://wheretheiss.at/w/developer) · [bigdatacloud.com](https://www.bigdatacloud.com/free-api/free-reverse-geocode-to-city-api)

#### **Wikipedia & Wikidata**

Power City Stories. The city is geocoded with Open-Meteo, matched to its Wikipedia article by proximity, then:
- Wikipedia REST summary for the description and hero photo, and the article's History section for dated facts
- Wikidata SPARQL for inception date (with precision handling for centuries and BC dates), area, elevation, demonym, nicknames, name origin and twin cities
- Wikidata SPARQL for people born in the city, ranked by how many language editions of Wikipedia cover them, with Commons portraits

No key required. **API Documentation:** [en.wikipedia.org/api/rest_v1](https://en.wikipedia.org/api/rest_v1/) · [query.wikidata.org](https://query.wikidata.org/)

#### **Open-Meteo (live, many cities at once)**

Planet Right Now and Hot or Not request current conditions for dozens of coordinates in a single call. Sky Tonight uses the daily sunrise/sunset/UV fields plus current cloud cover; twilight times come from sunrise-sunset.org and the aurora probability from NOAA's OVATION grid. Ocean Pulse reads `sea_level_height_msl` from the Marine API for tides.

#### **NASA NeoWs**

Asteroid Watch uses the Near-Earth Object feed with NASA's public `DEMO_KEY`, which allows about 30 requests per hour per visitor. Results are cached for 6 hours in the session. For heavy traffic, register a free key at api.nasa.gov and replace `DEMO_KEY`.

#### **iNaturalist**

Wildlife Near You queries recent observations and species counts around a coordinate. No key required.

#### **Open-Meteo hourly forecasts**

Best Hour Outside combines the forecast API (hourly temperature, apparent temperature, precipitation probability, wind, UV, weather code, daylight) with the air-quality API (hourly European AQI and five pollen types, Europe only) for three days. No key required.

#### **Supabase (leaderboard)**
A free Supabase project holds the `scores` table behind row-level security. The page talks to the REST endpoint directly (`/rest/v1/scores` for inserts, `/rest/v1/leaderboard` for reads with `Prefer: count=exact` for ranks). The SQL that creates the table, the view and the spam-guard trigger is in `supabase/leaderboard.sql`.

#### **NOAA GML & NASA GISTEMP**
The Planet Since You Were Born reads the Mauna Loa annual CO₂ means (`gml.noaa.gov/webdata/ccgg/trends/co2/co2_annmean_mlo.csv`, from 1959) and the GISTEMP land-ocean monthly anomalies relayed by global-warming.org (`/api/temperature-api`, from 1880), both without a key.

#### **NASA EPIC**

Provides the latest natural-colour image of Earth from the DSCOVR satellite for the splash screen. No key required.

**API Documentation:** [epic.gsfc.nasa.gov/about/api](https://epic.gsfc.nasa.gov/about/api)

#### Reddit API

Powers the Internet Trends Vault for real-time cultural discourse.
- Global Pulse: Fetches top discussions from r/all
- Regional Sentiment: Queries country-specific subreddits (e.g., r/greece, r/germany) to compare local interests against global trending topics.

**API Documentation:** [reddit.com/dev/api](reddit.com/dev/api)

### 📈 **Statistical Models**

The splash screen displays estimated daily accumulations based on the latest published baselines:
- **FAO Forest Resources Assessment 2025** - 10.9M ha/year deforestation (2015-2025)
- **Global Carbon Budget 2025** - 42.2 Gt CO₂/year (38.1 fossil + 4.1 land use)
- **Ember Global Electricity Review 2025** - 9,900 TWh/year of renewable electricity
- **Pew / SYSTEMIQ** - 11M tonnes/year of plastic entering the ocean
- **UN World Population Prospects 2024** - about 70M net population growth per year
- **WMO State of the Global Climate** - about 1.4°C warming above 1850-1900

*All data is clearly labeled as either real historical data or statistical estimates.*

---

## 🎯 Key Features Explained

### 🎬 **Cinema Discovery Mode**

The Cinema section provides curated film recommendations by country:

- **Primary Production Filtering** - Shows only films where the selected country is the primary (first) producer
- **Quality Threshold** - Minimum 50 votes required to ensure rating reliability
- **Smart Caching** - Monthly cache reset to balance freshness with performance
- **Top 20 Films** - Sorted by highest average rating
- **Fallback System** - Shows global trending movies if country has limited film production
- **Detailed Stats** - Average rating, total votes, newest/oldest films

**Example:** Searching "Greece" returns authentic Greek cinema like *Dogtooth*, *Attenberg*, and *Alps* - not international co-productions.

### 🎵 **Music Culture Mode**

Discover what's popular in different countries:

- **Top Artists & Tracks** - Ranked by listener count
- **Geographic Insights** - Country-specific music preferences
- **Weekly Cache** - Automatic refresh to capture trending changes
- **Listener Statistics** - Total and average listener metrics

### 🌊 **Ocean Pulse Mode**

Sea conditions for any coastal city, built on the Open-Meteo Marine API:

- **Live Readings** - Sea surface temperature, wave height and ocean current velocity right now
- **Seasonal Anomaly** - Today's sea temperature against the same week in earlier years of the record
- **Marine Heatwave Tracking** - Active heatwave streak and days above the 90th percentile over the last 12 months
- **Record Book** - Warmest and coolest days on record for that stretch of coast
- **Year-on-Year Shift** - Average of the last 12 months versus the 12 months before
- **Monthly Timeline** - 24 months of mean sea temperature with peak and floor markers
- **Landlocked Detection** - Inland cities get a clear message instead of empty data

The marine archive only starts in late 2022, so the record is about four years deep rather than the 50 years used by the Weather Archive.

### 😊 **Happiness & Wellbeing Mode**

Life satisfaction for any of the ~146 countries in the World Happiness Report:

- **Global Rank** - Position among all countries surveyed in the latest year, plus the current happiest country
- **World Comparison** - Score against the population-weighted world average
- **Trend Since 2011** - Rising, falling or stable, with the happiest and lowest years on record
- **Life Context** - Annual working hours and the homicide rate, colour-coded from very safe to high risk
- **Name Aliases** - Common shorthand such as "usa", "uk" or "korea" resolves to the right country

### 🌡️ **Weather Archive Mode**

Comprehensive climate analysis:

- **50-Year Historical Data** - Daily temperature records dating back decades
- **Climate Trends** - Era shift calculations (first 25 years vs. last 25 years)
- **Extreme Events** - Count of days above 30°C and below 0°C
- **Record Tracking** - Historical peak and floor temperatures
- **Air Quality** - Current PM2.5 pollution levels

---

## 💡 Performance & Optimization

### **Caching Strategy**

To handle high traffic and respect API rate limits:

- **Music Data:** Weekly cache reset (localStorage)
- **Cinema Data:** Monthly cache reset (localStorage)
- **Cache Benefits:**
  - First search: Makes API calls, saves to cache
  - Subsequent searches: Instant results from cache
  - Automatic expiration: Fresh data monthly/weekly

### **API Rate Limiting**

- **TMDB Free Tier:** 50 requests/second, ~2M requests/day
- **First-time searches:** ~50-100 API calls (cinema mode)
- **Cached searches:** 0 API calls
- **Capacity:** Can handle ~40 new cinema searches/minute, unlimited cached searches

### **Rate Limit Handling**

If API limits are exceeded:
- Returns HTTP 429 "Too Many Requests"
- Temporary cooldown period (~1 minute)
- No permanent account ban or API key revocation
- Graceful error messages to users

---

### **API Keys**

The following API keys are included in the code:

- ✅ **World Bank API** - No key required (public API)
- ✅ **Open-Meteo** - No key required (free tier)
- ✅ **Last.fm** - Key included (free tier)
- ✅ **TMDB** - Key included (free tier)
- ✅ **OECD** - No key required (public API)
- ✅ **reddit** - No key required (public API)
- ✅ **Our World in Data, GDACS, NOAA GML, NASA EONET, USGS, NOAA SWPC, NASA EPIC, GBIF, iNaturalist, Where the ISS at?, BigDataCloud, Wikipedia, Wikidata, sunrise-sunset.org** - No key required (public APIs with open CORS)
- ⚠️ **NASA NeoWs** - Uses the public DEMO_KEY (rate limited per visitor); swap in a free key for production


For production use with high traffic, consider getting your own API keys:
- [Last.fm API Key](https://www.last.fm/api/account/create)
- [TMDB API Key](https://www.themoviedb.org/settings/api)

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### **Types of Contributions**

- 🐛 Bug fixes and error handling improvements
- ✨ New data visualization modes
- 🎨 UI/UX enhancements
- 📝 Documentation improvements
- 🌍 Additional country support
- ⚡ Performance optimizations

### **Development Workflow**

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Make your changes**
4. **Test thoroughly** across different browsers and devices
5. **Commit your changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
6. **Push to the branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
7. **Open a Pull Request**

### **Code Standards**

- Use ES6+ JavaScript features
- Follow existing code style and naming conventions
- Add comments for complex logic
- Test on mobile, tablet, and desktop
- Ensure accessibility (ARIA labels, keyboard navigation)

---

## 📝 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

You are free to:
- ✅ Use commercially
- ✅ Modify
- ✅ Distribute
- ✅ Private use

---

## 👨‍💻 Author

**Charalambos Mitropoulos**

- 🌐 Website: [chamitro.github.io](https://chamitro.github.io/)
- 💼 GitHub: [@chamitro](https://github.com/chamitro)
- 🎓 Research: Smart Contract Security, Fuzzing, Static Analysis

---

## 🙏 Acknowledgments

### **Data Providers**
- **World Bank** - Open access to global development data
- **Open-Meteo** - Free weather and climate API
- **Last.fm** - Music discovery and statistics
- **The Movie Database (TMDB)** - Comprehensive film database

### **Tools & Libraries**
- **Chart.js** - Excellent charting library
- **canvas-confetti** - Celebration effects for quiz streaks and milestones
- **Tailwind CSS** - Design system inspiration
- **Google Fonts** - Beautiful typography

### **Community**
- All open data initiatives making projects like this possible
- Contributors and users providing feedback
- The open-source community

---

## 📧 Contact & Support

### **Get Help**

- 📖 Read the [Documentation](https://github.com/chamitro/EarthVault/wiki)
- 🐛 Report [Issues](https://github.com/chamitro/EarthVault/issues)
- 💬 Join [Discussions](https://github.com/chamitro/EarthVault/discussions)

### **Reach Out**

Have questions, suggestions, or want to collaborate?

- 📧 Email: [your.email@example.com](mailto:your.email@example.com)
- 🐦 Twitter: [@yourusername](https://twitter.com/yourusername)
- 💼 LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)

---

<p align="center">
  <strong>Made with ❤️ for our planet 🌍</strong>
  <br>
  <sub>Exploring data to understand and protect our world</sub>
  <br><br>
  <a href="#-earthvault">⬆️ Back to Top</a>
</p>

---

## 🌟 Star History

If you find EarthVault useful, please consider giving it a star! ⭐

It helps others discover the project and motivates continued development.

```bash
# Clone and star in one command
git clone https://github.com/chamitro/EarthVault.git && 
cd EarthVault && 
echo "Don't forget to ⭐ the repo on GitHub!"
```

---

**EarthVault** - *Your gateway to understanding our planet through data* 🌍📊✨
