# Multi-Seasons-Football-Performance-Intelligence

A data-driven football analytics project evaluating multi-season player and team performance trends using 1.8 million performance records. The project applies SQL, Python statistical analysis, and Tableau visualization to identify consistent performers, positional performance differences, high-impact players, and club contribution patterns — supporting recruitment, squad planning, and tactical decision-making.

**Executive Summary**

Football clubs increasingly rely on data-driven approaches to improve player recruitment, squad planning, and tactical decision-making. This project developed a Multi-Season Football Performance Intelligence framework to evaluate player and team performance trends using large-scale football data.
The analysis used Kaggle datasets, including a player performance dataset containing 1,878,719 records and a player profile dataset containing 92,671 players. The project evaluated long-term player contribution using performance indicators such as goals, assists, goal contribution, average contribution, goal contribution per 90 minutes, peak contribution, and consistency across multiple seasons.
Data preparation and transformation were performed using SQL to create structured analytical tables for player, position, and club-level evaluation. Python was then used for exploratory and statistical analysis, including descriptive statistics, distribution analysis, skewness, correlation analysis, ANOVA, Tukey HSD testing, and high-performance player classification.
The findings identified significant differences in performance contribution between player positions, confirmed statistically through ANOVA **(F-statistic = 6414.5, p-value = 0)** and Tukey HSD multiple comparisons. The analysis also showed that player contribution is highly concentrated, with a smaller group of elite performers producing exceptionally high outputs, demonstrated by a right-skewed distribution **(skewness = 3.5)**. A goal contribution threshold of **79** was established to identify high-performing players and evaluate their distribution across clubs.
From a sporting and business perspective, this framework supports more objective decision-making. For the Sporting Director, the insights support recruitment, player retention, squad investment, and identification of high-value performers using multi-season evidence rather than short-term performance alone. For the Head Coach, the framework supports position-specific player evaluation, squad selection, tactical planning, and monitoring of player development and performance trends.
By combining SQL data preparation, Python statistical validation, and Tableau visualization, this project transforms football data into actionable performance intelligence to support sustainable squad development and competitive decision-making.
The raw dataset contained 1,878,719 performance records across 92,671 player profiles. After removing duplicates, incomplete records, and players without sufficient multi-season history to support reliable trend analysis, the final analytical population used for statistical testing was 88,375 players.

**Business Impact**

This performance intelligence framework creates business value by improving the quality and efficiency of football decision-making. For the **Sporting Director,** it reduces recruitment and retention risk by providing evidence-based evaluation of player value, identifying sustainable performers, and supporting better allocation of squad investment. Instead of relying only on subjective scouting or short-term performance, decisions can be supported by multi-season performance evidence.

For the **Head Coach,** the framework improves operational decision-making by supporting objective squad selection, tactical planning, and player development strategies. Position-specific benchmarks and performance trends allow coaching staff to evaluate players according to their tactical roles and identify opportunities for improvement.

At an organizational level, the framework helps clubs maximize squad resources, improve talent identification, and build a more sustainable approach to long-term competitive performance.

**Skills demonstrated: SQL (data transformation, analytical table design) · Python (pandas, scipy, statsmodels) · Statistical testing (ANOVA, Tukey HSD, correlation, skewness/distribution analysis) · Tableau (dashboard visualization) · Sports performance evaluation · Stakeholder-specific reporting (coaching vs. recruitment audiences)**

**Project Objective**

To develop a data-driven performance intelligence framework that evaluates multi-seasonal player and team performance trends to support evidence-based decisions in player development, tactical planning, and squad optimization.

**Project Questions**

1. Which players demonstrate sustainable performance growth across multiple seasons and which show signs of performance decline?
Players with longer season records and stronger average-to-peak consistency — such as player IDs 28003 and 8198, who sustained averages of 40 and 37 across 28 seasons — demonstrate genuine long-term reliability, while players showing wide swings between peak and lowest seasonal output (0–3 in low seasons) signal inconsistency or possible decline that raw totals alone would hide.

2. Which player characteristics and performance indicators contributed most to long-term team success?
Position was the strongest and most statistically confirmed driver of output (ANOVA F = 6,414.5, p = 0), followed by efficiency (goal contribution per 90) and career consistency; physical characteristics like height and preferred foot showed only minor, secondary effects on performance.

3. How can multi-seasonal performance intelligence support coaching decisions on squad selection, player development, and tactical planning?
By replacing single-season snapshots and blended KPIs with position-specific benchmarks, per-90 efficiency, and peak-vs-average consistency tracking, coaches can select and develop players based on sustained, statistically grounded evidence rather than reputation or a single standout season.

**Data Preparation**

**Data Source**

The datasets used in this project were obtained from Kaggle and consisted of football player performance records, player profile information, and team-related information.

**The main datasets included:**

Player Performance Dataset

Initial dataset size: 1,878,719 records

Contains multi-season performance information including:
goals,
assists,
goal contribution,
minutes played,
season information.
Player Profile Dataset
Dataset size after cleaning: 92,671 players
Contains player characteristics including:
player name,
main position,
preferred foot,
height.

**Data Cleaning Process**

**Duplicate Removal**

Duplicate records were identified and removed to improve data reliability and ensure that player performance records represented valid observations.

Player performance data was cleaned and structured for multi-season analysis, while player profiles were cleaned to maintain unique player-level information.

**Missing Value Assessment**

Missing values were investigated before analysis.

Some variables contained missing information but were retained because they provided important analytical context.

For example:

Minutes Played

Minutes played contained missing values. The variable was not completely removed because playing time is an important indicator when evaluating player involvement and efficiency.

Removing all records with missing minutes would significantly reduce the available performance dataset and remove valuable player observations.

Instead, minutes played was used carefully, especially when calculating efficiency metrics such as goal contribution per 90 minutes, where reliable playing-time information was available.

**Categorical Data Cleaning**

Player categories were reviewed and standardized.

Examples:

Player positions were grouped into:
Forward,
Midfield,
Defender,
Goalkeeper.
Unknown or incomplete categories were reviewed and excluded where they did not contribute meaningful information to performance evaluation.

**Feature Preparation**

New performance indicators were created to support analysis:

**Total goal contribution:**
Goals + assists
**Average contribution:**
Average output across seasons
**Goal contribution per 90:**
Efficiency measurement
**Peak contribution:**
Highest recorded contribution
**Lowest contribution:**
Minimum recorded contribution

These indicators were used to evaluate consistency and long-term performance.

**SQL Preparation**

SQL was used to transform cleaned datasets into analytical tables.

The main SQL objectives were:

**Player Performance Summary**

Created player-level summaries containing:

Player ID,
Seasons played,
Total goals,
Total assists,
Goal contribution,
Total minutes.

This enabled evaluation of long-term player impact.

**Player Efficiency Analysis**

Calculated:

Goal contribution per 90 minutes

This allowed comparison between players with different levels of playing time.

**Player Consistency Analysis**

Created summaries containing:

Lowest contribution
Peak contribution
Average contribution

This supported identification of sustainable performers and performance variation.

**Club Contribution Analysis**

Evaluated:

Total goal contribution by club,
Average contribution per player,
Number of high-performing players.

This allowed comparison of squad contribution patterns.

**Exploratory Data Analysis (EDA)**

EDA was performed to identify important performance patterns before statistical testing.

The analysis examined:

Goal contribution distribution.
Player contribution by position.
Preferred foot contribution differences.
Club contribution patterns.
High-performing player distribution.
Relationship between seasons played and average contribution.

EDA identified that player contribution was highly concentrated, with a smaller number of elite performers producing exceptionally high outputs.

**Statistical Analysis**

Python was used to statistically validate patterns identified during SQL and EDA.

**Descriptive Statistics**

Goal contribution distribution analysis included:

Count: 88,375,
Mean: 28,
Median: 11,
Standard deviation: 44,
Minimum: 0,
Maximum: 1,139.

**Distribution and Skewness Analysis.**

Goal contribution showed:

Skewness: 3.5

This confirmed a strong right-skewed distribution, indicating that a small number of elite players significantly influence overall contribution patterns.

**Correlation Analysis**

Correlation analysis produced:

Correlation coefficient: 0.339
P-value: 0

This confirmed a statistically significant relationship between the analyzed performance variables.

**One-Way ANOVA**

ANOVA tested differences in goal contribution across player positions.

Results:

F-statistic: 6414.5
P-value: 0

The result confirmed statistically significant differences between positions.

**Tukey HSD Multiple Comparison**

Post-hoc analysis confirmed significant differences between all positional comparisons.

All comparisons:

Adjusted p-value = 0,
Reject null hypothesis = True

This confirmed that performance contribution differs significantly depending on player role.

**High-Performance Classification**

A threshold of:

Goal Contribution ≥79

was established to identify high-performing players.

This classification was used to evaluate:

elite player distribution,
club concentration of high performers.

**Insights**

1. Career Longevity Is Rare

The longest recorded careers reached 38 seasons (player IDs 112589 and 38389), followed by 37 seasons (IDs 32899, 87262). Only 17 players across the full dataset recorded 33–38 seasons — roughly 0.02% of the 88,375-player population.

So what: Extreme longevity is a statistical outlier, not a benchmark. It's useful for studying sustainability but shouldn't be treated as a normal target when evaluating current squads.

2. Elite Long-Term Output Is Concentrated in a Handful of Players

The highest cumulative goal contribution was 1,139 (player ID 28003, 28 seasons), followed by 1,053 (player ID 8198, 28 seasons). Across the top 10 performers, totals ranged from 542–1,139 contributions over 19–28 seasons and 8,146–14,711 minutes played — multiple players exceeded 500 career contributions.

3. Efficiency (Per-90) Tells a Different Story Than Career Totals

Player ID 42538 posted the highest per-90 efficiency (13) despite only 11 seasons and 1,552 total minutes — a fraction of the career length of the top cumulative scorers. Other high-efficiency performers (8–10 per 90) included IDs 28003 and 8198, who also led in total output.

So what: Total contribution and efficiency are different lenses. A short career with high efficiency can be as valuable a signal as decades of cumulative output — one favors proven durability, the other favors current productivity.

4. Consistency Varies Even Among Elite Players

Player ID 28003 combined the highest average contribution (40) with the highest peak (102) across 28 seasons; ID 8198 averaged 37 with an 82 peak over the same span. Other players posted high peaks (44352: 78, 3455: 70, 7893: 70, 38253: 65), but many elite performers still recorded seasons as low as 0–3 contributions.

So what: Peak output shows ceiling; average output shows reliability. Evaluating players on peak alone risks overrating someone who spikes once and fades.

5. Position Is the Single Strongest Driver of Output

Forwards (23,257 players) averaged 56.2 contributions, midfielders (26,914) averaged 29.3, defenders (28,483) averaged 13.97, and goalkeepers (9,720) averaged 0.24 — forwards outproduced both midfielders and defenders roughly 4x. This was confirmed statistically: one-way ANOVA returned F = 6,414.5 (p = 0), and Tukey HSD confirmed every positional pairing was significantly different (all p-adjusted = 0), with mean gaps of +42 (forwards vs. defenders), +56 (forwards vs. goalkeepers), +26 (forwards vs. midfielders), +15.3 (midfielders vs. defenders), and +13.7 (defenders vs. goalkeepers).

So what: These aren't just observed averages — they're statistically confirmed. Any performance benchmark must be position-adjusted, or defenders and goalkeepers will always look artificially "underperforming."

6. Preferred Foot Has a Smaller, Secondary Effect

Both-footed players averaged the highest contribution (47.62) but represent only 3,089 of ~88,000 players. Right-footed players (48,521, the largest group) averaged 32.77; left-footed players (16,630) averaged 31.16 but included the single highest individual output (1,139). Unknown-foot players (20,135) averaged lowest at 12.04.

7. Top-10 Performers Share a Profile — With Notable Exceptions

Messi (1,139) and Ronaldo (1,053) lead the top 10, both over 28 seasons. 9 of the top 10 are forwards, with careers spanning 19–28 seasons. Foot preference: 6 right, 3 left, 1 both. Height ranged 170–195 cm.

So what: Elite performance clusters around the forward position and long careers, but height and foot preference don't gatekeep it — exceptional players emerge across different physical profiles.

8. Club Contribution Depends on Both Squad Size and Player Quality

Inter Miami CF led total output (2,643 from 26 players, 101.6 avg). Arsenal FC produced a similar total (2,437) but spread across 58 players (avg 42) — the opposite model from Bayern Munich (2,081 from 23 players, avg 90.4) or Al Nassr FC (215 avg from just 9 players, the highest concentration in the dataset). SSC Napoli (2,172, avg 80) and Liverpool FC (2,161, avg 83) sit between these extremes.

So what: The same total output can come from very different squad-building approaches — a few elite players versus a broad contributor base. Total and average must be read together.

9. A Data-Driven Elite Threshold: 79+

A goal contribution of 79 or above statistically separates elite performers from the wider population. By this threshold, Liverpool has the deepest pool of elite contributors (14), followed by Medialiga RU (12) and Arsenal FC (11); US Cremonese, Atletico Madrid, CR Flamengo, and AEK Athens each have 10; Panathinaikos, Inter Milan, and Bayern Munich each have 9.

So what: This threshold gives clubs an objective screening filter for recruitment and a way to compare squad depth of elite talent, not just star power at the very top.

10. Small Samples Are Unreliable — Multi-Season Data Matters

Players with only 1 recorded season averaged just 0.3 contributions, far below multi-season elite performers. This isn't necessarily a talent gap — it reflects an incomplete performance history rather than a fair assessment of ability.

So what: Single-season stats should be treated as provisional. Reliable evaluation requires several seasons of data.

11. Overall Distribution Is Heavily Right-Skewed

Across 88,375 records: mean = 28, median = 11, standard deviation = 44, max = 1,139, skewness = 3.5. The middle 50% of players fall between 2 and 35 contributions. The gap between mean and median confirms a small number of elite performers pull the average well above what a typical player achieves.

So what: Average-based evaluation alone is misleading here — most players sit far below the mean, so distribution-aware analysis (percentiles, thresholds) is necessary to fairly assess where a player ranks.

12. A Moderate but Significant Correlation Exists Between Key Variables

Correlation analysis returned r = 0.339 (p = 0) — statistically significant, but only moderate in strength.

**Recommendations**

**For the Head Coach**

1. Evaluate players against position-specific benchmarks, not a single standard

With Tukey HSD confirming significant differences between every positional pair (forwards +42 over defenders, +56 over goalkeepers, +26 over midfielders), grading a squad on one contribution scale misrepresents defensive and goalkeeping performance. Action: Build separate performance dashboards and review criteria for forwards, midfielders, defenders, and goalkeepers rather than a blended KPI.

2. Prioritize per-90 efficiency over cumulative totals in team selection

Player 42538 posted the highest per-90 efficiency (13) despite only 11 seasons and 1,552 minutes — proof that high-output players aren't always the highest-minutes players. Action: When rotating squads or assessing impact substitutes, weight efficiency metrics alongside total output, especially for players returning from injury or with limited minutes.

3. Use peak-vs-average gap as an in-season form indicator

Elite players still show wide swings between peak (e.g., 102, 82) and lowest seasonal output (0–3). Action: Track each player's rolling average against their career peak to flag dips in form early, rather than relying on season-total contribution, which can mask mid-season slumps.

4. Don't over-index on career length when picking starters

Longest careers (33–38 seasons) represent only ~0.02% of the dataset and don't correlate directly with current output. Action: Treat longevity as a durability/experience factor in squad balance decisions, not as a proxy for present-day form.

**For the Sporting Director**

1. Recruit against the data-driven "elite" threshold, not reputation alone

A goal-contribution threshold of 79 statistically separates elite performers from the rest of the population. Action: Formalize this threshold (or a position-adjusted equivalent) as a screening filter in scouting reports, and flag any target above it for priority evaluation.

2. Target clubs with a strong pipeline of high performers

Liverpool (14), Medialiga RU (12), and Arsenal FC (11) currently hold the deepest pools of players above the elite threshold, alongside US Cremonese, Atletico Madrid, CR Flamengo, and AEK Athens (10 each). Action: These clubs' academies/scouting networks and player-development pathways are worth deeper due diligence as recruitment sources or benchmarking partners.

3. Decide squad-building philosophy: concentrated stars vs. distributed depth

Inter Miami CF (26 players, 101.6 avg) and Bayern Munich (23 players, 90.4 avg) generate high output from smaller, more productive groups, while Arsenal FC spreads similar total output (2,437) across 58 players (avg 42). Action: Clarify recruitment strategy — a "fewer, elite" model reduces squad-depth risk but raises injury/rotation exposure; a "broad contributor base" model is more resilient but costs more in total wage/roster spend. Recommend Sporting Director present both models to ownership with associated budget implications.

4. Don't let preferred foot or height narrow the recruitment funnel

Both-footed players had the highest average contribution (47.62) but represent only 3,089 of ~88,000 players — too small a pool to recruit from exclusively. Elite performers in the top 10 ranged from 170–195 cm and included right-, left-, and both-footed players. Action: Keep technical versatility (both-footedness) as a positive tiebreaker in scouting, not a hard filter, since exceptional output clearly occurs across all foot/height profiles.

5. Treat single-season performance data as provisional

Players with only 1 recorded season averaged just 0.3 contributions — far below multi-season elite performers — because a single season is a weak sample. Action: Require a minimum 3–4 season track record (or equivalent minutes threshold) before making high-value transfer commitments based on output stats alone; use single-season data only in combination with scouting/eye-test evidence.

6. Use the moderate positive correlation (r = 0.339) as a supporting signal, not a decision rule

The relationship between the two correlated performance variables is real but only moderate. Action: Continue building a multi-metric recruitment scorecard (total contribution, per-90 efficiency, consistency, position, age/career stage) rather than relying on any single statistic to justify a signing.

**Relevance to AFCON 2027**

While this project used club-level data, the same framework — multi-season consistency tracking, position-specific benchmarking, efficiency-adjusted output, and statistically derived performance thresholds — applies directly to national team and tournament preparation. In an AFCON context, this approach supports squad selection based on sustained form rather than reputation, identification of in-form vs. declining players ahead of a tournament window, and objective comparison of players across different leagues and playing conditions using standardized per-90 metrics.

**Limitations**

This project has several limitations:

Dataset limitations

The analysis depends on publicly available Kaggle datasets, which may not contain all professional football performance variables required for complete evaluation.

Limited tactical information

The dataset does not include detailed tactical variables such as:

expected goals (xG),
pressing actions,
defensive actions,
tactical roles,
team formations.
Missing values

Some variables contained missing information, including minutes played. These variables were retained when they provided analytical value, but missing data may influence some calculations.

Goal contribution bias

Goal contribution mainly reflects attacking output and may undervalue players whose impact is primarily defensive or tactical.

Team success measurement

The project evaluates team contribution patterns but does not directly include trophies, league positions, or points because those variables were not available in the dataset.

Threshold Limitation

The 79-contribution elite threshold was calculated across all positions combined. Because forwards structurally produce far higher goal contributions than defenders or goalkeepers, this threshold naturally favors attacking players. A position-adjusted threshold would provide a fairer standard for identifying elite defenders and goalkeepers in future iterations of this work.

**Conclusion**

This project set out to answer three questions: which players sustain performance, what drives long-term output, and how that intelligence should shape coaching decisions. The answer to all three converges on one idea — evaluation only becomes reliable once it's adjusted for position, playing time, and career stage. Raw totals reward longevity and exposure; the metrics that actually separate sustainable performers from one-off spikes are efficiency, consistency, and position-relative benchmarking.

That shift — from "how much did a player produce" to "how reliably, and relative to what's expected of their role" — is the practical takeaway for both audiences. For the Head Coach, it changes how form and selection are read week to week. For the Sporting Director, it changes how recruitment risk is assessed before money moves. And for a tournament context like AFCON, where squads are assembled from players across different leagues and conditions, that same adjustment is what makes cross-league comparison fair in the first place.

The statistics here don't replace scouting or coaching judgment — they narrow where that judgment needs to be spent.

Mwanahamisi Juma
mwanahamis050@gmail.com
+255787338398
