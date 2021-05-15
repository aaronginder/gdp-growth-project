FROM fishtownanalytics/dbt:0.19.1
LABEL pipeline="dbt"

# Update system packages
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y -q \
    git libpq-dev python-dev && \
    apt-get clean

# Install DBT
RUN pip install -U pip
RUN pip install -r requirements.txt

# Set executable scripts
RUN chmod 775 /scripts/set_up_env.sh

# Set envs
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

#Run dbt
CMD [ "dbt run --project-dir ." ]