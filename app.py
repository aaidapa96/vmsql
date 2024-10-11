from flask import Flask, request, render_template, jsonify
import pyodbc

app = Flask(__name__)

# Database connection settings
server = 'aaidapasql89712.database.windows.net'  # You may want to replace this with the server's IP address
database = 'userdb'
username = 'sqladmin'
password = 'demo!pass123'
driver = '{ODBC Driver 17 for SQL Server}'

def get_db_connection():
    try:
        conn = pyodbc.connect(
            f'DRIVER={driver};'
            f'SERVER={server};'
            'PORT=1433;'
            f'DATABASE={database};'
            f'UID={username};'
            f'PWD={password}'
        )
        return conn
    except pyodbc.Error as e:
        print("Error connecting to the database:", e)
        return None

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/add', methods=['POST'])
def add_user():
    name = request.form['name']
    email = request.form['email']

    conn = get_db_connection()
    if conn is None:
        return 'Database connection failed!', 500

    try:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Users (Name, Email) VALUES (?, ?)", (name, email))
        conn.commit()
        cursor.close()
    except pyodbc.Error as e:
        print("Error inserting into the database:", e)
        return 'Failed to add user!', 500
    finally:
        conn.close()

    return 'User added successfully!'

@app.route('/search', methods=['GET'])
def search_user():
    name = request.args.get('name')

    conn = get_db_connection()
    if conn is None:
        return 'Database connection failed!', 500

    try:
        cursor = conn.cursor()
        cursor.execute("SELECT Email FROM Users WHERE Name = ?", (name,))
        email = cursor.fetchone()
        cursor.close()
    except pyodbc.Error as e:
        print("Error querying the database:", e)
        return 'Failed to search user!', 500
    finally:
        conn.close()

    if email:
        return jsonify({"email": email[0]})
    else:
        return 'No user found with that name!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
