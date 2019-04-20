FROM jwilder/whoami

RUN echo $(date) > daniel.txt

HEALTHCHECK --start-period=5s --interval=10s --timeout=3s --retries=5 CMD wget -O - -q localhost:8000