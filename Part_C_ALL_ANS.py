'''
Using the movies database from Part B:
1. Write a Python script to display all movies.
'''

import psycopg2
import psycopg2.extras

def get_connection():
    return psycopg2.connect(dbname='postgres', user='postgres', password='admin',
                            host='localhost', port='5432', cursor_factory=psycopg2.extras.RealDictCursor)

def fetch_query(query: str) -> list:
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(query)
    rows = cur.fetchall()
    conn.commit()
    conn.close()
    return rows

def movies():
    rows = fetch_query("SELECT * FROM movies")
    if rows:
        for row in rows:
            print(row)
    else:
        print("Something went wrong. Try to write in SQL 'SELECT * FROM movies;'  And then look for your problem.")

get_connection()
movies()


  

'''
2. Write a Python script that accepts a movie name or part of a movie name from the
user and returns all matching movies. (Hint: LIKE query)
o Example: If the user inputs "batman," the output should include "The
Batman."'''

import psycopg2
import psycopg2.extras

def get_connection():
    return psycopg2.connect(dbname='postgres', user='postgres', password='admin',
                            host='localhost', port='5432', cursor_factory=psycopg2.extras.RealDictCursor)

def fetch_query(query: str, params) -> list:
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(query,params)
    rows = cur.fetchall()
    conn.commit()
    conn.close()
    return rows

def movies(movie_selected):
    search_movie = f"%{movie_selected}%"
    rows = fetch_query("SELECT * FROM movies WHERE movie_name ILIKE %s", (search_movie,))
    if rows:
        for row in rows:
            print(row)
    else:
        print("No movies found.")

get_connection()
movie_selected = input("Please Enter a name of movie (or part of the name):\n")
movies(movie_selected)

  

'''
3. Write a Python script that accepts movie details from the user and inserts the movie
into the movies table using an INSERT query
'''

import psycopg2
import psycopg2.extras

def get_connection():
    return psycopg2.connect(dbname='postgres', user='postgres', password='admin',
                            host='localhost', port='5432', cursor_factory=psycopg2.extras.RealDictCursor)

def execute_query(query: str, columns=None):
    with get_connection() as conn:
        with conn.cursor() as cur:
            cur.execute(query, columns)
            conn.commit()
            print("Movie added successfully!")

def new_movie():
    movie_name = input("Enter movie name: ")
    genre = input("Enter genre: ")
    country = input("Enter country: ")
    language = input("Enter language: ")
    year = int(input("Enter year: "))
    revenue = float(input("Enter revenue (millions): "))

    query = """
        INSERT INTO movies (movie_name, genre, country, language, year, revenue)
        VALUES (%s, %s, %s, %s, %s, %s) """
    columns = (movie_name, genre, country, language, year, revenue)

    execute_query(query, columns)


while True:
    new_movie()
    again = input("Add another movie? (yes/no): ").lower()
    if again != "yes":
        break




