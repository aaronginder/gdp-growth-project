# BigQuery Transformation dbt Data Pipeline

# Navigation
INSERT TABLE HERE
## What is dbt?
The data build tool (dbt) is a CLI that empowers analytics developers, data engineers and scientists to run the transform part of ETL. The rise of cloud providers such as Google Cloud, AWS, Azure and Snowflake that provide products for extraction has led to tools such as dbt or dataform being created.

dbt is responsible for the orchestration of sql queries by abstracting the complexities around DAG creation and allows users with little to minimum coding experience the ability to create complex data pipelines using yaml configuration and sql only.

[Visit the official dbt docs for more information...](https://docs.getdbt.com/docs/introduction)

## Example BigQuery Pipeline
### Introduction
This repository is a good starting point for those just getting to grips with dbt. This repository shows configurations for the gdp_growth_project pipeline. The purpose of the pipeline is to bring together two tables in a format that calculates the GDP per person (yes, not the most exciting).

### Instructions
Below guides you through using this repository to run a dbt pipeline in your Google Cloud Platform environment.

All the instructions should be executed in your terminal...

#### 1. Clone this repository & set up your environment
* Clone this repository by running `git clone <git link>` in your terminal
* Change into the repository directory `cd <directory>`
* Set up your environment by running `. scripts/set_up_env.sh`

#### 2. Run the dbt pipeline
* Run the dbt pipeline by executing `./scripts/run_dbt.sh`

Under the hood, the run_dbt.sh script does two things:
1. Executes the command `dbt deps` to retrieve the package dependencies used in this repo
2. Executes the command `dbt run --project-dir .` so that the configs defined in this repo is used

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


# Instructions
