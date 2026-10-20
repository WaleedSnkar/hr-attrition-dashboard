# Business Summary: What Is Driving Employee Attrition

## Summary

Company-wide attrition is 16.12% (237 of 1,470 employees). Three factors stand out:

1. **Overtime.** Employees who average more than 8 hours a day leave at 28.97%, against 10.72% for everyone else.

2. **The first year.** Employees with 0–1 years of tenure leave at 34.88%, and the 1–3 year group (18.43%) is also above the company average.

3. **The lowest satisfaction ratings.** Employees who rate work-life balance Bad (31.25%), environment satisfaction Low (25.27%), or job satisfaction Low (22.65%) leave at well above the company average.

Performance rating, job involvement, time since last promotion, and pay do not show a clear relationship with attrition.

## 1. Where is attrition highest?

* **Department:** Human Resources has the highest rate at 30.16% (63 employees). Research & Development (15.71%, 961 employees) and Sales (15.02%, 446 employees) sit just below the company average.

* **Job role:** Four roles are above the company average: Research Director 23.75% (80 employees), Research Scientist 18.15% (292), Sales Executive 16.87% (326), and Laboratory Technician 16.22% (259). The other five roles are below it, from Manufacturing Director (11.03%) to Healthcare Representative (14.50%).

* **Tenure:** Attrition falls steadily with time at the company:

| Tenure | Attrition rate | Employees | 
| ----- | ----- | ----- | 
| 0–1 years | 34.88% | 215 | 
| 1–3 years | 18.43% | 255 | 
| 3–5 years | 13.07% | 306 | 
| 5+ years | 10.81% | 694 | 

Leavers had an average tenure of 5.13 years, against 7.37 years for stayers.

## 2. Do employees who work overtime leave at a higher rate?

Yes. The 435 employees averaging more than 8 hours a day leave at 28.97%, against 10.72% for the other 1,035. Grouping employees by average daily hours shows a step. Attrition is 9.94% for the 6-hour group and 10.93% for the 7-hour group. It jumps to 28.66% at 8 hours and stays high at 26.83% (9 hours) and 31.51% (10 hours). Groups under 30 employees are hidden.

Average job satisfaction is nearly identical in the two groups (2.77 for overtime, 2.72 for others). Overtime employees therefore don’t seem to be leaving because they are generally less satisfied, which points to workload itself. This analysis can’t prove cause.

## 3. Are low satisfaction and pay or promotion stagnation related to attrition?

* **Satisfaction:** Weakly. The linear correlations with attrition are small and negative (environment −0.102, job satisfaction −0.100, work-life balance −0.065). The breakdown shows why: the effect is concentrated at the lowest rating.

| Rating level | Environment | Job satisfaction | Work-life balance | 
| ----- | ----- | ----- | ----- | 
| 1 (lowest) | 25.27% (281) | 22.65% (287) | 31.25% (80) | 
| 2 | 14.79% (284) | 16.43% (280) | 17.06% (340) | 
| 3 | 14.07% (462) | 16.55% (441) | 14.14% (898) | 
| 4 (highest) | 13.32% (443) | 11.47% (462) | 17.76% (152) | 

Environment satisfaction falls steadily. Work-life balance is the exception: the top rating (Best, 17.76%) has higher attrition than the one below it (Better, 14.14%). The Bad work-life balance group is small (80 employees).

* **Promotion:** No consistent pattern. The SQL correlation was close to zero. By band, attrition is 16.95% (0–1 years), 17.06% (2–3), 9.42% (4–6), and 15.85% (7+), so it does not rise with time since promotion.

* **Pay:** No steady gradient. The three lower income bands are within about one point of each other (\$0–30K 17.47%, $30–60K 16.57%, $60–90K 17.04%). The highest band ($90K+) is lower at 13.21%.

## 4. Do low performance rating and low manager involvement relate to attrition?

Not in a linear way (performance $r = 0.023$, job involvement $r = -0.016$).

* **Performance:** Only ratings 3 (Excellent, 15.76%) and 4 (Outstanding, 18.14%) exist in the data, so low performers cannot be assessed.

* **Job involvement** is U-shaped: Low 21.69%, Medium 16.00%, High 15.32%, Very High 18.06%. The two ends offset each other in the correlation. The Low group is the smallest of the four, so treat this as a signal to monitor, not a firm conclusion.

## Recommendations

1. **Address workload first.** Review staffing and scheduling for employees averaging more than 8 hours a day, and track average hours monthly. The aim is to bring their 28.97% attrition toward the 10.72% seen elsewhere.

2. **Support new hires through their first three years.** Add structured onboarding and check-ins in year one (34.88% attrition) and keep them going through year three, since the 1–3 year group (18.43%) is also above average.

3. **Target the lowest ratings, not everyone.** Because the effect sits at the bottom of each scale, follow up with employees who give the lowest score on work-life balance, environment, or job satisfaction, instead of running a company-wide program.

4. **Validate before investing in the hot spots.** Human Resources (30.16%) and Research Director (23.75%) are small groups, so use exit and stay interviews to confirm the cause first.

Based on this data, don’t direct retention budget toward pay increases, promotion fast-tracking, or performance-based programs.

## Limitations

* The analysis is descriptive. Each factor was examined on its own, and factors overlap (new employees may also be the ones working overtime), so it cannot show cause.

* Small groups swing more by chance: Human Resources (63 employees), Bad work-life balance (80), and Research Director (80).

* Overtime means average daily hours above 8, taken from the 2015 attendance logs. The data has no dates for when employees left.

* Source: the public HR Analytics Case Study (Kaggle). 4,410 source records were de-duplicated to 1,470 unique employees. Missing survey ratings (11, 7, and 12 across the three survey columns) were filled with the most common rating.

## Notes for you (not part of the memo)

* **Numbers I removed from my earlier draft.** I took out the figures I had calculated myself that weren’t in your files: leaver counts per group, the share of leavers, the “2.7x” multiplier, the “about 79 avoided departures,” the pay and promotion correlation values, and the group sizes for performance and involvement. The memo uses comparisons (“well above,” “just below”) instead.

* **Numbers that need a source in your SQL file.** The hours bins, promotion bands, income bands, and performance and involvement breakdowns appear on your dashboard but have no query behind them in `attrition_sql_analysis_1.sql`. Add them so every figure in the memo traces to your script.

* **Missing chart labels.** The promotion and income charts have no data labels in your latest screenshots. The memo’s values for them come from your earlier screenshots, so turn the labels back on and confirm the values match.

* **Where to add the missing counts.** If you want the Low involvement group size in the memo, take it from the chart tooltip and add it to the sentence.