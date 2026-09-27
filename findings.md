# E-Commerce Funnel & Conversion Analysis — Findings

---

## 1. Overall Funnel

- **406,863** unique users viewed products.
- **36,952** unique users reached the cart stage.
- **21,304** unique users completed a purchase.

- View → Cart conversion: **9.08%**
- Cart → Purchase conversion: **57.65%**
- View → Purchase conversion: **5.24%**

### Finding

The biggest drop-off happens between **View → Cart**. This is the main stage I would investigate further.

### What could be investigated?

Possible factors include:

- Product-page quality
- Product discovery
- Traffic intent
- Pricing
- Stock availability
- Product information
- Delivery information

The current event data shows **where** the biggest drop-off happens, but it does not tell us exactly **why** it happens.

---

## 2. Price Tier vs. Conversion

| Price Tier | View Users | Cart Users | View → Cart |
|---|---:|---:|---:|
| Under $5 | 4,204 | 594 | 14.13% |
| $5–$25 | 119,885 | 8,149 | 6.80% |
| $25–$100 | 169,192 | 13,374 | 7.90% |
| $100–$500 | 126,347 | 14,768 | 11.69% |
| $500–$2,500 | 18,759 | 1,849 | 9.86% |
| $2,500+ | 734 | 22 | 3.00% |

### Finding

Conversion does not consistently decrease as price increases.

The **Under $5** segment has the highest View → Cart conversion at **14.13%**, although it has much less traffic than the major mid-price segments.

The **$100–$500** segment has both high traffic and a relatively strong **11.69% View → Cart conversion**.

The **$2,500+** segment has the lowest conversion at **3.00%**, but only **734 unique users** viewed products in this tier. Because the sample is small, I would be careful about drawing a strong conclusion from it.

### Interpretation

The results suggest that **price alone does not explain View → Cart behavior**.

Product category, brand, product type, customer intent, traffic source and other factors could also affect conversion.

The current dataset does not provide enough information to identify the exact cause.

---

## 3. Category-Level View → Cart Performance

View → Cart conversion varies a lot across product categories.

### Stronger-Converting Categories

Some of the stronger categories include:

- Video Cards: **27.36%**
- Briefcases: **25.00%**
- Cameras: **23.14%**
- Scanners: **19.54%**
- CPUs: **15.69%**

### Parent Department Performance

Among parent departments with at least 1,000 unique viewers:

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

**Computers** stand out because they have both high traffic and a relatively strong **14.78% View → Cart conversion**.

**Appliances**, on the other hand, received more than 22,000 unique viewers but only **4.18%** reached the cart stage.

This makes Appliances more useful to investigate than a department with very low conversion but almost no traffic.

### High-Traffic / Low-Conversion Categories

Some individual categories also receive meaningful traffic but relatively few cart additions:

- TVs: **11,180 viewers → 469 cart users → 4.19%**
- Coffee Machines: **2,272 viewers → 43 cart users → 1.89%**
- Auto Video Registers: **4,124 viewers → 195 cart users → 4.73%**
- Microwaves: **1,417 viewers → 39 cart users → 2.75%**
- Juicers: **1,355 viewers → 6 cart users → 0.44%**

These categories are more useful to investigate because they combine **meaningful traffic with weak conversion**.

### Low-Sample Categories

Examples include:

- Living Room Chairs: **36 views, 0 carts**
- Refrigerators: **12 views, 0 carts**
- Kitchen Chairs: **12 views, 0 carts**
- Winches: **5 views, 0 carts**

These categories show 0% conversion, but they also have very few viewers.

Because of the small sample size, I would not automatically treat them as poorly performing categories.

### Takeaway

When deciding which categories need attention, I would look at **both traffic and conversion**, rather than simply choosing the categories with the lowest conversion percentage.

---

## 4. Category-Level Cart → Purchase Drop-Off

The next step was to compare how users moved from Cart → Purchase across categories.

This calculation compares the number of unique users observed at the Cart and Purchase stages within each category.

It should **not be treated as true session-level cart abandonment**, because the analysis does not confirm that the same user's cart event directly led to, or failed to lead to, a purchase within a specific session or time period.

### Higher Cart → Purchase Drop-Off

| Category | Cart Users | Purchase Users | Cart → Purchase Drop-Off |
|---|---:|---:|---:|
| Kitchen Mixers | 51 | 19 | 62.75% |
| CPUs | 1,555 | 693 | 55.43% |
| Auto Video Registers | 195 | 87 | 55.38% |
| Sewing Machines | 165 | 74 | 55.15% |
| PC Coolers | 297 | 137 | 53.87% |
| TVs | 469 | 217 | 53.73% |
| Monitors | 308 | 152 | 50.65% |
| Video Cards | 7,942 | 3,980 | 49.89% |
| Motherboards | 1,493 | 749 | 49.83% |

### Lower Cart → Purchase Drop-Off

| Category | Cart Users | Purchase Users | Cart → Purchase Drop-Off |
|---|---:|---:|---:|
| Vacuum Cleaners | 263 | 194 | 26.24% |
| TV Remotes | 55 | 40 | 27.27% |
| Kettles | 56 | 40 | 28.57% |
| Cameras/Webcams | 479 | 328 | 31.52% |
| Meat Grinders | 63 | 43 | 31.75% |
| Printer Cartridges | 2,181 | 1,475 | 32.37% |
| Laptops/Notebooks | 1,287 | 856 | 33.49% |

### Finding

Strong View → Cart performance does not always mean equally strong Cart → Purchase performance.

For example, **Video Cards** perform strongly at View → Cart, but show approximately **49.89% Cart → Purchase drop-off**.

Similarly, **CPUs** have relatively strong initial conversion but approximately **55.43% Cart → Purchase drop-off**.

### What could be investigated?

Possible factors include:

- Final basket price
- Shipping costs
- Product compatibility concerns
- Delivery information
- Checkout friction
- Payment options

These are possible explanations to investigate further. The current dataset does **not** prove that any of them caused the drop-off.

---

## 5. Brand-Level Funnel Performance

Conversion also varies across brands.

### Strong View → Cart Brands

| Brand | View Users | Cart Users | View → Cart |
|---|---:|---:|---:|
| Saitek | 335 | 99 | 29.55% |
| Sapphire | 3,636 | 1,074 | 29.54% |
| MSI | 7,716 | 2,202 | 28.54% |
| Gigabyte | 9,425 | 2,353 | 24.97% |
| SteelSeries | 708 | 173 | 24.44% |
| PowerColor | 1,732 | 381 | 22.00% |

Several brands have View → Cart conversion above 20%.

### High-Traffic Brands With Lower Conversion

Some brands receive more than 1,000 unique viewers but have relatively low View → Cart conversion:

- Hammer: **1,409 viewers → 0.64%**
- Lexmark: **1,492 viewers → 1.47%**
- Nokia: **1,525 viewers → 2.16%**
- Orient: **1,585 viewers → 2.52%**
- Honor: **1,207 viewers → 2.73%**
- Deepcool: **2,501 viewers → 3.20%**
- Redmond: **3,257 viewers → 3.59%**
- Samsung: **13,845 viewers → 6.10%**

### Interpretation

I would not automatically assume these differences are caused by brand preference or loyalty.

Differences in product category, price, product mix and customer intent could also affect brand-level conversion.

---

## 6. Brand Revenue

Top identified brands by recorded purchase-event revenue:

| Brand | Purchase Events | Revenue |
|---|---:|---:|
| MSI | 1,788 | $643,492.34 |
| Gigabyte | 1,741 | $556,183.04 |
| Palit | 1,077 | $484,210.58 |
| ASUS | 1,261 | $330,147.11 |
| Sapphire | 917 | $306,192.94 |
| AMD | 1,020 | $191,987.40 |
| Canon | 1,045 | $137,964.79 |

There is also a large **Unknown brand** group with **9,500 purchase events and $594,720.15 in recorded revenue**.

This represents missing brand information in the data and should **not** be treated as an actual brand.

### Finding

Among the identified brands, **MSI has the highest recorded purchase-event revenue**.

However, revenue and conversion tell us different things.

A brand with high conversion may still have low overall revenue if it receives little traffic. Similarly, a brand with high revenue is not automatically the strongest performer in every area.

A fuller comparison could include:

- Traffic
- Conversion
- Purchase revenue
- Average Order Value
- Profitability / margin
- Customer acquisition cost

The last two measures are not available in the current dataset.

---

## 7. Hourly Activity & Conversion

View → Cart conversion also changes across different event hours.

### Strongest Conversion Window

The strongest observed period is around:

**09:00–11:00 UTC**

All three hours show approximately **9.21% View → Cart conversion**.

Examples:

- 09:00 → **29,415 viewers, 2,710 cart users**
- 10:00 → **29,899 viewers, 2,753 cart users**
- 11:00 → **30,227 viewers, 2,784 cart users**

### Secondary Peak

At **19:00 UTC**, View → Cart conversion is approximately **9.14%**.

### Lower-Conversion Periods

Late-night and early-morning hours show lower observed conversion:

- 23:00 → **7.50%**
- 00:00 → **7.32%**
- 02:00 → **7.11%**
- 01:00 → **6.70%**

### Interpretation

The data shows a **relationship between event hour and funnel performance**, but it does not prove that the time of day itself causes the difference.

Traffic mix, geography, customer intent and other factors could also affect these patterns.

---

# 8. Business Recommendations

## 8.1 Focus on High-Traffic, Low-Conversion Areas

The biggest measured funnel problem is **View → Cart**.

Instead of simply looking for the lowest conversion percentage, I would first investigate categories that have:

**High traffic + weak conversion**

Examples include TVs, Coffee Machines, Auto Video Registers, Microwaves and Juicers.

Possible areas to test include:

- Product specifications
- Ratings and reviews
- Product images
- Product demonstrations
- Product-comparison features
- Stock availability
- Delivery information
- Traffic quality

These are areas that could be tested. The current analysis does not prove that they are causing the low conversion.

---

## 8.2 Investigate Cart → Purchase Drop-Off

Categories such as CPUs, TVs and several PC-component categories show noticeable Cart → Purchase drop-off.

Possible areas to investigate include:

- Shipping costs
- Final basket price
- Delivery timing
- Payment options
- Checkout complexity

For PC components, compatibility information could also be worth testing because customers may want to confirm that products work together before purchasing.

Again, these are possible explanations, not confirmed causes.

---

## 8.3 Look at Revenue and Conversion Together

Brands should not be judged using conversion rate or revenue alone.

A better comparison would look at:

**Traffic + Conversion + Revenue + Profitability**

For example, a brand with very high conversion but very little traffic may generate less overall value than a brand with moderate conversion and much higher traffic.

Profitability data is not available in the current dataset, so it could not be included in this analysis.

---

## 8.4 Test Hourly Patterns

The hourly patterns could be used to plan further tests.

During lower-converting periods, possible tests could include:

- Personalized recommendations
- Cart reminders
- Product discovery campaigns
- Carefully designed promotional offers

These should be tested before assuming that they will improve conversion.

---

# 9. Main Takeaways

### 1. View → Cart is the biggest measured funnel bottleneck

Only **9.08%** of unique viewers are observed at the Cart stage.

### 2. Price alone does not explain conversion

View → Cart conversion does not consistently decrease as price increases.

### 3. Category performance varies

Some categories have both strong traffic and conversion, while others receive meaningful traffic but have weak View → Cart performance.

### 4. Strong initial interest does not always lead to a purchase

Some PC-hardware categories perform strongly at View → Cart but show much weaker Cart → Purchase progression.

### 5. Brand performance varies

Some brands have strong View → Cart conversion, while others receive high traffic but relatively few cart users.

### 6. Revenue and conversion measure different things

High conversion does not automatically mean high revenue, and high revenue does not automatically mean strong performance in every area.

---

# 10. Limitations

The dataset contains behavioral event data, so it shows what users did but does not directly explain **why** they did it.

It does not include information such as:

- Reasons for not adding products to cart
- Reasons for Cart → Purchase drop-off
- Competitor pricing
- Shipping costs shown to individual customers
- Customer demographics
- Marketing or acquisition channel
- Inventory availability at the time of interaction
- Device type
- Checkout errors
- Profit margins
- Customer acquisition costs

The conversion calculations compare unique users observed at each event stage. They do not reconstruct every user's complete journey in sequence.

Because of this, the analysis identifies **patterns and areas worth investigating, rather than proving what caused the behavior**.

---

# 11. Next Steps

1. Investigate high-traffic categories with weak View → Cart conversion.
2. Use additional product and behavioral data to understand why users drop off before adding products to cart.
3. Investigate Cart → Purchase drop-off in categories where the difference is larger.
4. Test improvements to product pages and product discovery.
5. Compare revenue and conversion together when evaluating brands.
6. Check whether the hourly patterns remain after accounting for differences in traffic and product mix.
7. Measure whether any changes made actually improve View → Cart and overall purchase conversion.