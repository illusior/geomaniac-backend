# //////////////////////
# ---- Build images ----
# //////////////////////

#
# ---- Base Build Image ----
# Use to set up defaults and to hold sources
#
FROM python:3.11.6-alpine3.18 as requirements_stage

WORKDIR /tmp

# Install Poetry
RUN pip install poetry

COPY ./pyproject.toml ./poetry.lock* /tmp/

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

# //////////////////////
# ---- Build images ----
# //////////////////////

#######################################

# ////////////////////
# ---- App images ----
# ////////////////////

#
# ---- Prod Image ----
# Use for produciton
#
FROM python:3.11.6-alpine3.18 as prod
WORKDIR /app

COPY --from=requirements_stage /tmp/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./ /app/
# COPY ./prestart.sh /app/
# COPY ./tests-start.sh /app/

ENV PYTHONPATH=/app

CMD uvicorn app.main:app --host ${BACKEND_HOST:-0.0.0.0}

# ////////////////////
# ---- App images ----
# ////////////////////
