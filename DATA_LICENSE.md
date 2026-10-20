# Data License and Attribution

This file covers the data in this repository (`data/cleaned/`) and the copy of that data embedded in `dashboard/HR_Attrition_Dashboard.pbix`. The code and documentation are covered separately by the [MIT License](LICENSE).

*This is a practice project, and this file is not legal advice.*

## Attribution notice

> Contains information from the **IBM HR Analytics Employee Attrition & Performance** dataset (a fictional dataset created by IBM data scientists), obtained through the Kaggle upload **HR Analytics Case Study** by vjchoudhary7, and made available under the **Open Database License (ODbL) v1.0**. Individual contents are licensed under the **Database Contents License (DbCL) v1.0**.

If you reuse the data in `data/cleaned/`, you must keep this notice and offer your adapted version under the ODbL as well.

## Licenses that apply

| Part | License | Where |
|---|---|---|
| The database (the cleaned tables as a whole) | Open Database License (ODbL) v1.0 | https://opendatacommons.org/licenses/odbl/1-0/ |
| The individual contents | Database Contents License (DbCL) v1.0 | https://opendatacommons.org/licenses/dbcl/1-0/ |

In plain terms (from the [official ODbL summary](https://opendatacommons.org/licenses/odbl/summary/)): you may share, create works from, and adapt the database, as long as you **attribute** it, **share adapted versions under the ODbL**, and **keep it open**. Charts, dashboards, and reports produced from the data are "produced works": they need the attribution notice above but are not themselves required to be ODbL.

## Provenance

- The IBM HR Analytics Employee Attrition & Performance dataset on Kaggle (https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) is labeled by Kaggle as Database: Open Database, Contents: Database Contents. IBM's own repository for this dataset lists the ODbL for the database and the DbCL for the contents: https://github.com/IBM/employee-attrition-aif360
- This project used a different Kaggle upload, **HR Analytics Case Study** (https://www.kaggle.com/datasets/vjchoudhary7/hr-analytics-case-study), which splits the employee data into several files and adds attendance logs. Its employee records appear to derive from the IBM sample (1,470 base employees and 237 leavers).

## What could not be verified

- **The case-study upload did not show a license** on its Kaggle page, so the IBM license is relied on for the employee records.
- **The origin of the attendance logs** (in and out times) is unknown. They appear to be artificially generated, because each employee profile appeared three times in the source with different logs. Whatever terms apply to them were not visible.

If you are a rights holder and want something changed or removed, please open an issue on this repository.

## Changes made to the data

The files in `data/cleaned/` are modified from the Kaggle download:

- Removed duplicate employee records (4,410 rows reduced to 1,470 unique employees).
- Replaced "NA" text with blanks, and filled 30 missing survey ratings with the most common rating in each column.
- Dropped three columns that contained a single constant value.
- Aggregated the daily attendance logs into one row per employee (`attendance_summary`: average daily hours worked and an overtime flag).

Full detail is in `reports/Cleaning_Log.md`.
