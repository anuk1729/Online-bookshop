FROM python:3.8.3-slim 
RUN apt-get update && apt-get -y install libpq-dev gcc && pip install psycopg2
EXPOSE 8000
WORKDIR /app
COPY .  /app
RUN apt-get install -y  pkg-config && apt-get install libcairo2-dev libjpeg-dev libgif-dev -y 

RUN pip install -r requirements.txt 
RUN pip install pycairo && pip install xhtml2pdf
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver","0.0.0.0:8000"]



