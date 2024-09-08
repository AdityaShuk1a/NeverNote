import psycopg2

def db_connect(query, value=None):
    conn = None
    cur = None


    try:

        conn = psycopg2.connect(
            host = 'ep-lucky-bush-a1g2oytk.ap-southeast-1.aws.neon.tech',
            dbname = 'neondb',
            user = 'neondb_owner',
            password = 'YVE32adcAbvi',
            port = 5432

        )
        cur = conn.cursor()
        
        if(value == None):
            cur.execute(query)
        else:
            cur.execute(query, value)

        
        conn.commit()
        print("Data inserted successfully")

    except psycopg2.DatabaseError as error:
        print(error)
    finally:
        if cur is not None:
            cur.close()
        if conn is not None:
            conn.close()