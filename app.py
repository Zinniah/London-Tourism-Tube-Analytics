import streamlit as st
import pandas as pd

st.set_page_config(page_title="London Tourism & Tube Analytics", page_icon="🚇", layout="wide")

st.title("🚇 London Tourism & Tube Analytics Dashboard")
st.markdown("Exploring London's iconic tourist destinations, station accessibility, and TfL travel zones.")

# Key Metrics Row
col1, col2, col3 = st.columns(3)
col1.metric("Total Attractions Tracked", "5")
col2.metric("Connected Underground Stations", "5")
col3.metric("Avg Station Proximity", "230 meters")

st.divider()

# Simulated Data Table matching your SQL queries
st.subheader("📍 Major Attractions & Closest Tube Stations")
data = {
    "Attraction": ["The British Museum", "Natural History Museum", "Tower of London", "The London Eye", "Covent Garden Market"],
    "Category": ["Museum", "Museum", "Historic", "Entertainment", "Shopping"],
    "Borough": ["Camden", "Kensington & Chelsea", "Tower Hamlets", "Lambeth", "Westminster"],
    "Closest Station": ["Tottenham Court Road", "South Kensington", "London Bridge", "Westminster", "Covent Garden"],
    "Zone": [1, 1, 1, 1, 1],
    "Walking Distance (m)": [350, 200, 400, 150, 50]
}
df = pd.DataFrame(data)

st.dataframe(df, use_container_width=True)

st.info("💡 Tip: This data layout mirrors your SQL schema tables (`attractions`, `stations`, and `attraction_stations`).")
