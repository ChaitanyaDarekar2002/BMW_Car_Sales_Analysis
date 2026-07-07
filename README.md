# 🚗 BMW Geo-Sales Dashboard (Power BI)

An interactive Power BI dashboard analyzing BMW global sales performance (2019–present), featuring a **live model selector** that displays the corresponding car image and a full sales breakdown (Revenue, Units Sold, Region, Country, Channel, Year-over-Year trend) the moment a model is clicked.

![Dashboard Preview](assets/dashboard_preview.png)
<!-- Add a screenshot of your dashboard here, e.g. assets/dashboard_preview.png -->

---

## 📊 Overview

This project explores BMW sales data across regions, countries, models, and sales channels, and presents it through a single-page interactive dashboard built in Power BI. The standout feature is a **model-to-image binding**: selecting any BMW model (via bar chart or slicer) instantly swaps the displayed car photo and updates every KPI, chart, and map on the page.

**Live metrics on the dashboard:**
- Total Revenue
- Total Units Sold
- YoY Revenue Change %
- Average Revenue by Country (map)
- Sum of Revenue by Model (bar chart / selector)
- Sum of Revenue by Region (donut chart)
- Selected model's car image (dynamic)

---

## 🗂️ Dataset

**File:** `BMW_Clean_Data.csv`

| Column | Description |
|---|---|
| `Date` | Transaction date |
| `Year` | Transaction year |
| `Model` | BMW model (e.g., BMW M2, BMW X5, BMW iX) |
| `Revenue` | Revenue generated (USD) |
| `Quantity Sold` | Units sold |
| `Region` | Continent/region of sale |
| `Country` | Country of sale |
| `Channel` | Sales channel (Wholesale / Retail) |

Covers 27 BMW models sold across 5+ regions and dozens of countries.

**Note:** During cleaning, a stray `Model = "0"` row was filtered out in Power Query (`Home > Remove Rows` or a `Model <> "0"` filter) before modeling.

---

## 🖼️ Model Image Mapping

**File:** `Model_Image_Mapping.csv`

A lookup table mapping each of the 26 BMW models to a real, publicly licensed image hosted on **Wikimedia Commons**, using Commons' stable hotlink endpoint:

```
https://commons.wikimedia.org/wiki/Special:FilePath/<exact file name>
```

This table is related to the main dataset on the `Model` column (many-to-one) and powers the dynamic image display.

> Images are sourced from Wikimedia Commons under their respective Creative Commons licenses (CC BY / CC BY-SA). See each file's Commons page for attribution details if redistributing.

---

## 🧮 Key DAX Measures

```dax
Selected Car Image = 
VAR CurrentModel = SELECTEDVALUE(BMW_Clean_Data[Model])
RETURN
    LOOKUPVALUE(Model_Image_Mapping[ImageURL], Model_Image_Mapping[Model], CurrentModel)

Total Revenue = SUM(BMW_Clean_Data[Revenue])

Total Units Sold = SUM(BMW_Clean_Data[Quantity Sold])

Avg Revenue per Unit = DIVIDE([Total Revenue], [Total Units Sold])

YoY Revenue Change % = 
VAR CurrentYearRevenue = [Total Revenue]
VAR PriorYearRevenue = 
    CALCULATE([Total Revenue], BMW_Clean_Data[Year] = MAX(BMW_Clean_Data[Year]) - 1)
RETURN 
    DIVIDE(CurrentYearRevenue - PriorYearRevenue, PriorYearRevenue)
```

**Important:** The car image is bound to the *measure* (`Selected Car Image`), not the raw `ImageURL` column. Binding a column directly forces Power BI to ask for a First/Last aggregation and breaks the "click to change image" interactivity — the measure re-evaluates per selection automatically.

---

## 🛠️ Tools & Tech

- **Power BI Desktop** — data modeling, DAX, report design
- **Power Query** — data cleaning
- **Wikimedia Commons** — image sourcing
- Visuals used: Image visual, Map, Bar chart, Donut chart, Card (KPI)

---

## 🚀 How to Use

1. Clone this repository
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
2. Open `BMW_Sales_Dashboard.pbix` in Power BI Desktop
3. If prompted, update the data source path for `BMW_Clean_Data.csv` and `Model_Image_Mapping.csv` to their location on your machine
4. Click any bar in **Sum of Revenue by Model** (or use the model slicer) to see the image and all details update live

---

## 📁 Repository Structure

```
├── BMW_Clean_Data.csv
├── Model_Image_Mapping.csv
├── BMW_Sales_Dashboard.pbix
├── assets/
│   └── dashboard_preview.png
└── README.md
```

---

## 👤 Author

**Chaitanya Darekar**
Data Analyst | Power BI · SQL · Python · Excel Automation

- Portfolio: [chaitanyadarekar2002.github.io](https://chaitanyadarekar2002.github.io)
- LinkedIn: [linkedin.com/in/chaitanyadarekar](https://linkedin.com/in/chaitanyadarekar02)
- GitHub: [github.com/ChaitanyaDarekar2002](https://github.com/ChaitanyaDarekar2002)

---

## 📄 License

This project's code and analysis are open for reuse — feel free to fork and adapt. Car images retain their original Wikimedia Commons licenses (see `Model_Image_Mapping.csv` source links for attribution per file).
