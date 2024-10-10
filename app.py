from flask import Flask, request, render_template, jsonify
import pyodbc

app = Flask(__name__)

# Database connection settings
server = 'terraform-sql-a2b99a98'
database = 'userdb'
username = 'sqladmin'
password = 'demo!pass123'
driver = '{ODBC Driver 17 for SQL Server}'

def get_db_connection():
    conn = pyodbc.connect('DRIVER='+driver+';SERVER='+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+password)
    return conn

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/add', methods=['POST'])
def add_user():
    name = request.form['name']
    email = request.form['email']
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Users (Name, Email) VALUES (?, ?)", (name, email))
    conn.commit()
    cursor.close()
    conn.close()
    
    return 'User added successfully!'

@app.route('/search', methods=['GET'])
def search_user():
    name = request.args.get('name')
    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT Email FROM Users WHERE Name = ?", (name,))
    email = cursor.fetchone()
    cursor.close()
    conn.close()
    
    if email:
        return jsonify({"email": email[0]})
    else:
        return 'No user found with that name!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
