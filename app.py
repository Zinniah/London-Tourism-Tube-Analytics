import streamlit as st
import pandas as pd
import altair as alt

# Page Configuration
st.set_page_config(
    page_title="London Tourism & Tube Analytics", 
    page_icon="🚇", 
    layout="wide"
)

# App Header
st.title("🚇 London Tourism & Tube Analytics Dashboard")
st.markdown("Exploring the relationship between London's iconic tourist destinations, station accessibility, and TfL travel rates.")

# Enhanced Dataset with TfL Underground Fares (GBP)
data = {
    "Attraction": ["The British Museum", "Natural History Museum", "Tower of London", "The London Eye", "Covent Garden Market"],
    "Category": ["Museum", "Museum", "Historic", "Entertainment", "Shopping"],
    "Borough": ["Camden", "Kensington & Chelsea", "Tower Hamlets", "Lambeth", "Westminster"],
    "Closest Station": ["Tottenham Court Road", "South Kensington", "London Bridge", "Westminster", "Covent Garden"],
    "Zone": [1, 1, 1, 1, 1],
    "Walking Distance (m)": [350, 200, 400, 150, 50],
    "Annual Visitors": [6000000, 5000000, 3000000, 4500000, 15000000],
    "Peak Fare (£)": [2.80, 2.80, 2.80, 2.80, 2.80],
    "Off-Peak Fare (£)": [2.70, 2.70, 2.70, 2.70, 2.70],
    "lat": [51.5194, 51.4966, 51.5081, 51.5033, 51.5117],
    "lon": [-0.1270, -0.1764, -0.0759, -0.1195, -0.1240]
}
df = pd.DataFrame(data)

# --- SIDEBAR FILTERS ---
st.sidebar.header("🔍 Filter Dashboard")
selected_category = st.sidebar.selectbox("Filter by Category", ["All"] + list(df["Category"].unique()))
max_distance = st.sidebar.slider("Max Walking Distance (meters)", min_value=50, max_value=500, value=500, step=50)

# Apply Filters
filtered_df = df.copy()
if selected_category != "All":
    filtered_df = filtered_df[filtered_df["Category"] == selected_category]
filtered_df = filtered_df[filtered_df["Walking Distance (m)"] <= max_distance]

# --- KPI METRICS ROW ---
col1, col2, col3, col4 = st.columns(4)
col1.metric("Filtered Attractions", len(filtered_df))
col2.metric("Total Annual Footfall", f"{filtered_df['Annual Visitors'].sum():,}")
col3.metric("Avg Walking Distance", f"{filtered_df['Walking Distance (m)'].mean():.0f} m")
col4.metric("Avg Peak Fare", f"£{filtered_df['Peak Fare (£)'].mean():.2f}")

st.divider()

# --- LAYOUT: TWO COLUMNS FOR MAP & CHARTS ---
col_left, col_right = st.columns([1, 1])

with col_left:
    st.subheader("📍 Interactive Map of Attractions")
    st.markdown("Geographic distribution of tourist hotspots across London.")
    if not filtered_df.empty:
        st.map(filtered_df, latitude='lat', longitude='lon', size='Annual Visitors', zoom=12)
    else:
        st.warning("No data matches your filter criteria.")

with col_right:
    st.subheader("📊 Visitor Volume & Fare Impact")
    if not filtered_df.empty:
        chart = alt.Chart(filtered_df).mark_bar(color="#e31b23").encode(
            x=alt.X('Annual Visitors:Q', title='Annual Visitors'),
            y=alt.Y('Attraction:N', sort='-x', title='Attraction Name'),
            tooltip=['Attraction', 'Peak Fare (£)', 'Off-Peak Fare (£)', 'Annual Visitors']
        ).properties(height=300)
        st.altair_chart(chart, use_container_width=True)
    else:
        st.warning("No data to display.")

st.divider()

# --- DATA TABLE SECTION ---
st.subheader("📋 Detailed SQL Query Result View (With TfL Fares)")
st.dataframe(filtered_df.drop(columns=['lat', 'lon']), use_container_width=True)
