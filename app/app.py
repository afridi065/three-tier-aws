import os
import pymysql
from flask import Flask, request, jsonify

app = Flask(__name__)

def get_conn():
    return pymysql.connect(
        host=os.environ.get("DB_HOST", "localhost"),
        user=os.environ.get("DB_USER", "root"),
        password=os.environ.get("DB_PASSWORD", "password"),
        database=os.environ.get("DB_NAME", "appdb"),
        cursorclass=pymysql.cursors.DictCursor,
    )

def init_db():
    conn = get_conn()
    with conn.cursor() as cur:
        cur.execute(
            "CREATE TABLE IF NOT EXISTS items ("
            "id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100))"
        )
    conn.commit()
    conn.close()

@app.route("/health")
def health():
    return jsonify(status="ok"), 200

@app.route("/items", methods=["GET"])
def list_items():
    conn = get_conn()
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM items")
        rows = cur.fetchall()
    conn.close()
    return jsonify(rows)

@app.route("/items", methods=["POST"])
def add_item():
    name = request.json.get("name")
    conn = get_conn()
    with conn.cursor() as cur:
        cur.execute("INSERT INTO items (name) VALUES (%s)", (name,))
    conn.commit()
    conn.close()
    return jsonify(message="added"), 201

if __name__ == "__main__":
    try:
        init_db()
    except Exception as e:
        print("DB init failed:", e)
    app.run(host="0.0.0.0", port=5000)
