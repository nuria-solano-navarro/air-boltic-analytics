# Air Boltic Data Model - Analytics

This repo hosts a mock dbt-style project, depicting the designed data model as per the asignment.

## Project Folder Structure

- `models/staging/` - from raw layer, we import, clean and format the data
- `models/marts/facts/` - then creating the fact tables for the relevant events
- `models/marts/dims/` - and the dim tables for the relevant info

## Notes

- This project is a mere logical representation of my logical process and WoW, and it's not intended to run against any database or perform as a dbt project. 
- fact_trips and dim_aeroplane contain developed dbt models corresponding with the proposed design. Again, these models are not intended to be run against any database. They are a sample of coding methodology. 
- When possible and within reason, the dbt style and best practices have been followed.
- In the `schema.yml` file, sample testing has been included.
- An 'aeroplane_model.csv' has been assumed for clarity and brevity purposes. The proposed file was a .json, which would need to be loaded into db differently, or referenced directly in the dim_aeroplane model. 
- Any other outstanding points, I'll be glad to explain the reasoning behind in a further meeting. I've tried to cover all major points of the task. 

## Tools 
- dbt 
- Warehouse: databricks
- BI: Looker

# Nuria Solano Navarro - 02.05.2025