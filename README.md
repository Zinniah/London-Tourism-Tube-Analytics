# London Tourism & Tube Analytics 🚇🇬🇧

An end-to-end SQL analytics project exploring the relationship between London's iconic tourist destinations, London Underground (TfL) station accessibility, and travel pricing zones.

## 📊 Project Overview
Navigating London can be overwhelming for millions of annual tourists. This project models **Transport for London (TfL) open data** alongside major landmark locations to answer key questions regarding travel efficiency, station proximity, and borough tourist distribution using advanced SQL queries.

## 🗂️ Repository Structure
- `sql/schema/` - Database creation scripts, table relationships, and initial seed datasets (`create_tables.sql`).
- `sql/queries/` - Analytical scripts utilizing Joins, Aggregations, and Window Functions (`analysis.sql`).

## 🔍 Key Insights Addressed
1. **Station Proximity Analysis:** Pinpointing exactly how many meters visitors must walk from the nearest Underground exit to iconic landmarks like The British Museum or London Eye.
2. **Borough Footfall Ranking:** Utilizing window functions (`DENSE_RANK()`) to rank London boroughs by overall tourist volume.
3. **Zone-Based Itinerary Planning:** Grouping attractions by TfL fare zones to optimize cost-effective travel routes.

## 🛠️ Tech Stack
- **Language:** SQL (PostgreSQL / SQLite compatible)
- **Data Domains:** TfL Open Data, Urban Transit Networks, Point-of-Interest (POI) Datasets
- **Platform:** GitHub (Web-managed repository)

---
*Created as part of a data analytics portfolio highlighting robust database structuring and insightful query writing.*
