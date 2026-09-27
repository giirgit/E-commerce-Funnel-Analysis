# E-Commerce Funnel & Conversion Analysis

## Project Overview

This project analyzes customer behavior across an e-commerce funnel:

**Product View → Add to Cart → Purchase**

The goal is to identify where users drop off and understand how conversion varies across product categories, price ranges, brands, and time of day.

The analysis uses **Python (Pandas)** for data cleaning and exploration, **SQL (SQLite)** for funnel and segmentation analysis, and **Power BI** for visualization.

Detailed findings are available in [`findings.md`](./findings.md).

---

## Business Problem

An e-commerce company wants to understand where users are being lost throughout the purchasing funnel and which areas should be prioritized for further investigation.

The analysis focuses on:

- Where the largest funnel drop-off occurs
- Which categories perform better or worse
- Whether price is related to conversion
- How brands differ in funnel performance
- Which categories show weaker Cart → Purchase progression
- Which brands contribute the most recorded purchase revenue
- How user activity and conversion vary throughout the day

---

## Key Findings

### 1. View → Cart Is the Main Funnel Bottleneck

- **406,863** unique users viewed products
- **36,952** unique users reached the Cart stage
- **21,304** unique users reached the Purchase stage
- View → Cart conversion: **9.08%**
- Cart → Purchase conversion: **57.65%**
- View → Purchase conversion: **5.24%**

Only **9.08% of unique product viewers are observed at the Cart stage**, making View → Cart the largest measured funnel bottleneck.

This makes the pre-cart stage the primary area for further investigation.

---

### 2. Price Does Not Have a Simple Relationship With Conversion

View → Cart conversion varies across price tiers:

| Price Tier | View Users | Cart Users | View → Cart |
|---|---:|---:|---:|
| Under $5 | 4,204 | 594 | 14.13% |
| $5–$25 | 119,885 | 8,149 | 6.80% |
| $25–$100 | 169,192 | 13,374 | 7.90% |
| $100–$500 | 126,347 | 14,768 | 11.69% |
| $500–$2,500 | 18,759 | 1,849 | 9.86% |
| $2,500+ | 734 | 22 | 3.00% |

Higher prices do not consistently result in lower conversion.

The **Under $5** tier has the highest observed View → Cart rate at **14.13%**, although its traffic is much smaller than the major mid-price segments.

The **$100–$500** segment combines substantial traffic with a relatively strong **11.69% conversion**.

The **$2,500+** segment converts at only **3.00%**, but it contains just 734 unique viewers and should therefore be interpreted cautiously.

Overall, **price alone does not appear sufficient to explain the View → Cart bottleneck**.

---

### 3. Category Performance Varies Significantly

Some product categories show much stronger View → Cart performance than others.

Examples of stronger-converting categories include:

- Graphics Cards: **27.36%**
- Cameras/Webcams: **23.14%**
- Scanners: **19.54%**
- CPUs: **15.69%**

At the same time, several categories receive meaningful traffic but show relatively weak conversion:

- TVs: **11,180 viewers → 4.19% conversion**
- Coffee Machines: **2,272 viewers → 1.89%**
- Auto Video Registers: **4,124 viewers → 4.73%**
- Microwaves: **1,417 viewers → 2.75%**
- Juicers: **1,355 viewers → 0.44%**

At the broader department level:

| Parent Department | View Users | Cart Users | View → Cart |
|---|---:|---:|---:|
| Computers | 115,530 | 17,074 | 14.78% |
| Stationery | 23,210 | 2,315 | 9.97% |
| Electronics | 89,740 | 6,983 | 7.78% |
| Construction | 14,971 | 1,040 | 6.95% |
| Furniture | 1,902 | 128 | 6.73% |
| Auto | 17,078 | 1,133 | 6.63% |
| Accessories | 1,173 | 54 | 4.60% |
| Appliances | 22,374 | 936 | 4.18% |
| Country Yard | 1,647 | 39 | 2.37% |

This makes **high-traffic, low-converting categories** more useful targets for investigation than categories with extremely low conversion but very little traffic.

---

### 4. Cart → Purchase Drop-Off Varies by Category

Post-cart progression also differs considerably across product categories.

Some categories show relatively large differences between the number of unique users observed at the Cart and Purchase stages.

Examples include:

- Kitchen Mixers: **62.75% Cart → Purchase drop-off**
- CPUs: **55.43%**
- Auto Video Registers: **55.38%**
- Sewing Machines: **55.15%**
- TVs: **53.73%**
- Video Cards: **49.89%**

Other categories show considerably stronger post-cart progression:

- Vacuum Cleaners: **26.24% drop-off**
- TV Remotes: **27.27%**
- Kettles: **28.57%**
- Cameras/Webcams: **31.52%**
- Printer Cartridges: **32.37%**
- Laptops/Notebooks: **33.49%**

This metric compares unique users observed at the Cart and Purchase stages within each category.

It should **not be interpreted as true session-level cart abandonment**, because individual user journeys were not reconstructed sequentially within a defined session or time window.

The analysis identifies where post-cart progression is weaker, but additional data would be required to determine the causes.

---

### 5. Brand Performance Differs Across the Funnel

Several brands show particularly strong View → Cart conversion:

- Sapphire: **29.54%**
- MSI: **28.54%**
- Gigabyte: **24.97%**
- PowerColor: **22.00%**
- Palit: **18.27%**

At the same time, several brands receive substantial traffic while showing considerably weaker View → Cart conversion.

Examples include:

- Hammer: **1,409 viewers → 0.64%**
- Lexmark: **1,492 viewers → 1.47%**
- Nokia: **1,525 viewers → 2.16%**
- Deepcool: **2,501 viewers → 3.20%**
- Samsung: **13,845 viewers → 6.10%**

Brand-level differences should not automatically be attributed to brand preference or loyalty.

Different brands may have different product-category, price and product-mix distributions, which can influence observed conversion.

---

### 6. Revenue and Conversion Tell Different Stories

Purchase-event revenue analysis shows the highest recorded revenue among identified brands:

| Brand | Purchase Events | Revenue |
|---|---:|---:|
| MSI | 1,788 | $643,492.34 |
| Gigabyte | 1,741 | $556,183.04 |
| Palit | 1,077 | $484,210.58 |
| ASUS | 1,261 | $330,147.11 |
| Sapphire | 917 | $306,192.94 |
| AMD | 1,020 | $191,987.40 |
| Canon | 1,045 | $137,964.79 |

The dataset also contains an **Unknown / Unbranded** bucket with **9,500 purchase events and $594,720.15 in recorded revenue**.

This should be treated as a data-quality or missing-brand bucket rather than as an actual brand.

Among identified brands, **MSI generates the highest recorded purchase-event revenue**.

However, the highest-revenue brand is not necessarily the highest-converting brand.

This highlights the difference between:

- **Conversion efficiency**
- **Revenue contribution**
- **Commercial scale**

A more complete business evaluation would ideally consider traffic, conversion, revenue and profitability together.

---

### 7. Conversion Varies Throughout the Day

Hourly View → Cart conversion varies throughout the day.

The strongest observed period occurs between:

**09:00–11:00 UTC — approximately 9.21% View → Cart conversion**

A second strong period appears at:

**19:00 UTC — 9.14%**

Lower conversion is observed during several late-night and early-morning hours:

- 23:00 → **7.50%**
- 00:00 → **7.32%**
- 02:00 → **7.11%**
- 01:00 → **6.70%**

These results show an **association between event hour and funnel performance**.

They do not establish that time of day itself causes the differences in conversion.

---

## Core Funnel Metrics

| Funnel Stage | Unique Users | Conversion |
|---|---:|---:|
| Product View | 406,863 | 100.00% |
| Add to Cart | 36,952 | 9.08% of View |
| Purchase | 21,304 | 57.65% of Cart |
| View → Purchase | 21,304 | 5.24% |

---

## Analytical Approach

### 1. Data Exploration

Python and Pandas were used to:

- Inspect the dataset structure
- Check data types
- Identify missing values
- Check duplicate records
- Analyze event distribution
- Examine price statistics

The processed Pandas DataFrame was then loaded into a SQLite database for SQL analysis.

### 2. Funnel Analysis

SQL was used to calculate:

- Unique users at each funnel stage
- View → Cart conversion
- Cart → Purchase conversion
- View → Purchase conversion

### 3. Segmentation

The funnel was analyzed across:

- Product category
- Parent department
- Price tier
- Brand
- Time of day

### 4. Post-Cart Analysis

Cart and Purchase stage activity was compared across categories to identify segments with weaker post-cart progression.

### 5. Revenue Analysis

Purchase events were used to compare recorded revenue contribution across brands.

### 6. Business Interpretation

Observed patterns were used to identify areas for further investigation and potential business experiments.

The analysis avoids treating correlations or behavioral patterns as proven causes.

---

## Business Recommendations

### 1. Investigate High-Traffic, Low-Converting Segments

Since View → Cart is the largest measured funnel bottleneck, high-traffic categories with weak conversion should be prioritized for further investigation.

Potential areas to test include:

- Clearer product specifications
- More visible reviews and ratings
- Better product images and demonstrations
- Product comparison features
- Clear stock availability
- Clear delivery information

Other factors such as traffic quality, pricing and product mix should also be investigated before attributing weak conversion specifically to product-page performance.

---

### 2. Investigate Categories With High Cart → Purchase Drop-Off

Categories such as Kitchen Mixers, CPUs, TVs and several PC-component categories show weaker post-cart progression.

Potential factors to investigate include:

- Shipping costs
- Final basket value
- Delivery timelines
- Checkout complexity
- Payment options
- Product-specific concerns

For PC components, product compatibility information could also be tested.

These are **hypotheses to investigate rather than confirmed causes**.

---

### 3. Use Both Conversion and Revenue When Prioritizing Brands

Brands should not be evaluated using only one metric.

Revenue analysis identifies commercially important brands, while conversion analysis shows how efficiently users move through the funnel.

Future prioritization should ideally consider:

**Traffic + Conversion + Revenue + Profitability**

Brands with substantial commercial scale but relatively weak conversion may represent useful optimization opportunities.

---

### 4. Test Time-Based Engagement Strategies

Higher and lower-converting periods can be used to generate controlled experiments.

Potential tests include:

- Personalized recommendations
- Cart reminders
- Product discovery campaigns
- Carefully designed promotional offers

The effectiveness of these strategies should be measured against a suitable control group before wider implementation.

---

## Limitations

The dataset contains behavioral event data but does not directly explain **why** users behave differently.

Important variables not available in the dataset include:

- Marketing / acquisition channel
- Device type
- Inventory availability
- Shipping costs shown to individual users
- Checkout errors
- Competitor pricing
- Customer motivations
- Profit margins
- Customer acquisition costs

The funnel calculations compare unique users observed at each event stage rather than reconstructing every user's complete sequential journey.

Similarly, the Cart → Purchase drop-off metric should not be interpreted as true session-level cart abandonment.

Therefore, the analysis identifies **patterns and areas for further investigation rather than proving causation**.

---

## Power BI Dashboard

The analysis is visualized in an interactive Power BI dashboard covering:

- Overall funnel performance
- View → Cart conversion
- Category performance
- Brand performance
- Price-tier conversion
- Post-cart progression
- Revenue contribution

> Dashboard preview will be added here.

<!--
After adding a dashboard screenshot to the repository, replace the line above with:

![Power BI Dashboard](dashboard/dashboard_preview.png)
-->

---

## Tools & Technologies

- **Pandas**
- **SQL**
- **SQLite**
- **Power BI**
- **Git / GitHub**
- **Markdown**

---

## Project Structure

ecommerce-funnel-analysis/
│
├── README.md
├── findings.md              # Detailed business findings
├── funnel_analysis.ipynb    # Python/Pandas exploration
├── queries.sql              # SQL analysis
├── connect.py               # Loads the dataset into SQLite
├── funnel.db                # SQLite database
├── events.csv               # Raw dataset
└── events.csv.zip           # Compressed dataset

---

## Conclusion

The analysis identifies **View → Cart as the largest measured funnel bottleneck**, with only **9.08% of unique product viewers observed at the Cart stage**.

Price does not show a simple relationship with conversion, while substantial differences appear across product categories, brands and post-cart progression.

The results suggest prioritizing **high-traffic, low-converting product segments**, investigating categories with weaker Cart → Purchase progression, and evaluating commercial performance using multiple metrics rather than conversion or revenue alone.

Potential causes identified throughout the analysis should be validated using additional data and controlled experiments before business interventions are implemented.

For more detailed analysis, see [`findings.md`](./findings.md).