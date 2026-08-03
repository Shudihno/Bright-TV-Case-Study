# 📺 BrightTV Viewership Analytics

![SQL](https://img.shields.io/badge/SQL-Databricks-blue?style=for-the-badge)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge)
![Excel](https://img.shields.io/badge/Excel-Analytics-217346?style=for-the-badge)
![Looker Studio](https://img.shields.io/badge/Looker-Studio-4285F4?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-success?style=for-the-badge)

## 🌐 Live Dashboard

**Interactive Analytics Dashboard**

https://lumina-tv-analytics.lovable.app

---

# Executive Summary

BrightTV is a digital television streaming platform seeking to grow its subscriber base and increase viewer engagement.

This project was completed in response to a business case requesting actionable insights for the Customer Value Management (CVM) team. The objective was to analyze subscriber demographics and viewing behaviour, identify factors influencing content consumption, and provide recommendations to improve customer engagement and business growth. :contentReference[oaicite:0]{index=0}

The project covers the complete analytics lifecycle:

- Business Understanding
- Data Discovery
- Data Cleaning
- Feature Engineering
- SQL Data Processing
- Dashboard Development
- Business Intelligence Reporting
- Recommendations

---

# Business Problem

BrightTV's CEO requested an analytical solution that would help the Customer Value Management (CVM) team answer the following business questions:

- What are the current user and viewing trends?
- Which factors influence content consumption?
- Which content should be promoted during periods of low engagement?
- Which initiatives can help increase BrightTV's subscriber base?

:contentReference[oaicite:1]{index=1}

---

# Project Objectives

✔ Understand customer viewing behaviour

✔ Analyse subscriber demographics

✔ Identify high-performing TV channels

✔ Measure audience engagement

✔ Build interactive dashboards

✔ Produce actionable business recommendations

---

# Project Workflow

```
Business Understanding
        │
        ▼
Data Collection
        │
        ▼
Data Cleaning
        │
        ▼
Feature Engineering
        │
        ▼
SQL Data Processing
        │
        ▼
Dashboard Development
        │
        ▼
Business Insights
        │
        ▼
Recommendations
```

---

# Project Timeline

The project followed a structured analytics workflow covering:

- Data Discovery
- Data Inspection
- Exploratory Data Analysis
- Data Cleaning
- Feature Engineering
- Dashboard Development
- Power BI Monitoring
- Data Presentation

:contentReference[oaicite:2]{index=2}

---

# Technologies Used

| Tool | Purpose |
|------|---------|
| SQL | Data Cleaning & Feature Engineering |
| Databricks SQL | Data Processing |
| Microsoft Excel | Dashboard Development |
| Power BI | Interactive Business Intelligence Dashboard |
| Google Looker Studio | Executive Reporting |
| Lovable | Web Dashboard |
| GitHub | Version Control |

---

# Dataset Overview

The project consists of two datasets:

### User Profiles

Contains subscriber demographic information including:

- Gender
- Age
- Province
- Race
- Email
- Social Media Handle

### Viewership Sessions

Contains viewing behaviour including:

- Subscriber ID
- Channel
- Viewing Date
- Viewing Time
- Session Duration

Each viewing session represents a single customer viewing event. :contentReference[oaicite:3]{index=3}

---

# SQL Data Engineering

The SQL pipeline performs extensive feature engineering.

## Data Cleaning

- Standardised missing Gender values
- Cleaned Race values
- Cleaned Province values
- Removed inconsistent channel names

---

## Feature Engineering

Created:

- Age Groups
- Province Category
- Email Flag
- Social Media Flag
- Time of Day
- Day Classification
- Month ID
- Viewing Hour
- Duration (Minutes)
- Screen Time Brackets

---

## Data Integration

Merged

```
User Profiles
        +
Viewership Data
```

into one analytical dataset for reporting.

---

# Dashboards Developed

## Microsoft Excel Dashboard

Interactive dashboard including:

- KPI Cards
- Channel Performance
- Demographics
- Viewership Trends
- Screen Time Analysis

---

## Power BI Dashboard

Pages include:

- Overview
- Channel Performance
- Viewer Behaviour
- Audience Segments
- Insights & Recommendations

---

## Looker Studio Dashboard

Executive dashboard designed for business reporting and online sharing.

---

## Lovable Dashboard

A responsive web application that allows users to explore BrightTV analytics interactively.

**Live Demo**

https://lumina-tv-analytics.lovable.app

---

# Key Performance Indicators

The dashboard measures:

- Total Viewing Records
- Total Viewing Hours
- Average Viewing Duration
- Number of Active Channels
- Top Performing Channel
- Audience Demographics
- Time of Day Analysis
- Geographic Distribution

The dashboard highlights SuperSport Live Channels as the top-performing channel, weekday viewing as the majority of consumption, and Early Adults as the largest audience segment. :contentReference[oaicite:4]{index=4} :contentReference[oaicite:5]{index=5}

---

# Dashboard Features

## 📈 Overview

- KPI Cards
- Monthly Trends
- Gender Distribution
- Viewing Patterns

---

## 📺 Channel Performance

- Top Performing Channels
- Watch Time
- Average Duration

---

## 👥 Audience Segments

- Age Groups
- Gender
- Race
- Province

---

## ⏰ Viewer Behaviour

- Time of Day
- Day of Week
- Weekday vs Weekend
- Viewing Duration

---

# Business Insights

The analysis identified several notable trends:

- SuperSport Live Channels generated the highest viewership.
- Weekday viewing exceeded weekend viewing.
- Early Adults formed the largest audience segment.
- Male viewers represented the largest proportion of the audience.
- Viewership increased steadily from January through March. :contentReference[oaicite:6]{index=6}

---

# Recommendations

Based on the analysis:

- Promote premium sports content.
- Schedule advertisements during peak viewing periods.
- Target Early Adults using personalised campaigns.
- Increase marketing aimed at female viewers.
- Expand programming for children and senior audiences.

These recommendations align with the insights presented in the dashboard. :contentReference[oaicite:7]{index=7}

---

# Project Structure

```
BrightTV-Analytics
│
├── Data
│   ├── Bright_TV_Dataset.xlsx
│
├── SQL
│   └── Bright TV Data Processing.sql
│
├── Excel
│   └── Bright TV EDA Visualization.xlsx
│
├── Power BI
│   ├── Bright TV.pbix
│   └── Dashboard.pdf
│
├── Looker Studio
│   └── Dashboard.pdf
│
├── Documents
│   ├── BrightTV Case Study.pdf
│   └── Gantt Chart.pdf
│
├── README.md
│
└── LICENSE
```

---

# Future Enhancements

- Predictive Analytics
- Customer Churn Prediction
- Recommendation Engine
- Real-time Data Pipeline
- Automated ETL
- Azure Data Factory Integration
- Machine Learning Models

---

# Skills Demonstrated

- Business Analysis
- Data Cleaning
- SQL
- Feature Engineering
- Data Modelling
- Dashboard Design
- Excel Analytics
- Power BI
- Looker Studio
- Business Intelligence
- Data Visualization
- KPI Development
- Storytelling with Data

---

# Author

**Mashudu Sivhada**

Data Analyst | Business Intelligence Developer

---

## Acknowledgements

This project was completed as part of the BrightTV Viewership Analytics Case Study to demonstrate end-to-end data analytics skills, from raw data processing through interactive dashboard development and business insight generation. :contentReference[oaicite:8]{index=8}

---

⭐ If you found this project interesting, feel free to fork the repository or use it as inspiration for your own analytics projects.
