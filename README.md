# 🌍 EarthVault

> **A Beautiful, Interactive Data Visualization Platform for Exploring Our Planet's Environmental, Social & Cultural Metrics**

## 🖥️ Visit: https://chamitro.github.io/EarthVault/

---

## ✨ Features

### 📊 **13 Data Visualization Modes**

EarthVault provides comprehensive insights across environmental, social, and cultural dimensions:

#### 🌍 **Environmental Data**
- 🌡️ **Weather Archive** - 50+ years of historical climate data with daily temperature records
- 🌳 **Forest Heritage** - Global deforestation rates and forest coverage trends
- 🌾 **Agriculture** - Agricultural land use intensity and farming trends
- ⚡ **Energy & Renewables** - Clean energy transition tracking and renewable adoption
- 💧 **Water Safety** - Access to safely managed drinking water sources
- 🏭 **Carbon Emissions** - CO₂ emissions tracking against Paris Agreement targets

#### 👥 **Social & Health Metrics**
- 🎓 **University Access** - Global tertiary education enrollment with gender parity analysis
- ⏳ **Human Lifespan** - Life expectancy trends and longevity gap analysis
- 🤱 **Generations** - Fertility rates and demographic transitions
- 🧠 **Mental Health** - Global mental health prevalence and trends

#### 🌐 **Digital & Cultural**
- 🌐 **Internet Access** - Digital connectivity and internet penetration worldwide
- 🎵 **Music Culture** - Top artists and tracks by country (powered by Last.fm)
- 🎬 **Cinema Discovery** - Highest-rated films from each country (powered by TMDB)

### 🎨 **Modern UI/UX**

- ✨ **Animated Particle Background** - Dynamic canvas-based particle system
- 📈 **Real-time Number Counters** - Smooth easing animations for live statistics
- 🎯 **Interactive Elements** - Hover effects, micro-interactions, and responsive feedback
- 📱 **Fully Responsive** - Optimized for mobile, tablet, and desktop devices
- 🌓 **Dark Mode First** - Beautiful dark theme with glassmorphism design
- 🎭 **Smooth Transitions** - Polished animations between sections and data views
- 📊 **Interactive Charts** - Dynamic line charts with customizable styling
- 🗓️ **Timeline Grids** - Historical data visualization with peak/floor indicators

### 🚀 **Technical Highlights**

- 📡 **Multi-Source Data Integration** - Real-time data from World Bank, Open-Meteo, Last.fm, and TMDB APIs
- 💾 **Smart Caching System** - localStorage-based caching with automatic weekly/monthly refresh
- 🎬 **Performance Optimized** - Efficient API usage with rate limiting and caching strategies
- 🧮 **Advanced Statistics** - Growth rates, trends, comparisons, and historical analysis
- 🌐 **Client-Side Only** - No backend required, runs entirely in the browser
- ⚡ **Lightweight** - Fast loading and smooth performance
- 🎨 **Custom Scrollbars** - Styled scrollbars matching the design theme

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
Social, economic, and environmental indicators:
- Forest coverage (AG.LND.FRST.ZS)
- Agricultural land (AG.LND.AGRI.ZS)
- Renewable energy (EG.ELC.RNEW.ZS)
- Water access (SH.H2O.SMDW.ZS)
- University enrollment (SE.TER.CUAT.BA.ZS)
- Life expectancy (SP.DYN.LE00.IN)
- Fertility rates (SP.DYN.TFRT.IN)
- Mental health (SH.STA.DIAB.ZS)
- Carbon emissions (EN.GHG.ALL.MT.CE.AR5)
- Internet usage (IT.NET.USER.ZS)

**API Documentation:** [data.worldbank.org](https://data.worldbank.org)

#### **Open-Meteo**
Historical weather and climate data:
- Temperature (daily max, mean)
- Humidity (relative)
- Air quality (PM2.5)
- 50+ years of climate records

**API Documentation:** [open-meteo.com](https://open-meteo.com)

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

### 📈 **Statistical Models**

The splash screen displays estimated daily accumulations based on:
- **FAO** (Food and Agriculture Organization) - Forest loss rates
- **Global Carbon Project** - CO₂ emissions
- **IEA** (International Energy Agency) - Renewable energy generation
- **IUCN** - Ocean plastic pollution
- **UN Population Division** - Population growth
- **NOAA** - Global temperature rise

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

## 📊 Project Stats

![GitHub stars](https://img.shields.io/github/stars/chamitro/EarthVault?style=social)
![GitHub forks](https://img.shields.io/github/forks/chamitro/EarthVault?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/chamitro/EarthVault?style=social)

![GitHub license](https://img.shields.io/github/license/chamitro/EarthVault)
![GitHub issues](https://img.shields.io/github/issues/chamitro/EarthVault)
![GitHub pull requests](https://img.shields.io/github/issues-pr/chamitro/EarthVault)

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
