from flask import Flask, render_template, jsonify, request
import mysql.connector

app = Flask(__name__)

# === Koneksi ke Database ===
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",        # ganti kalau user MySQL kamu beda
        password="",        # isi password kalau ada
        database="agriadapt"
    )

# === API: Data Cuaca ===
@app.route("/api/cuaca")
def get_cuaca():
    kota = request.args.get("kota", "Kendari")

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT 
            l.nama_kota,
            c.tanggal,
            c.suhu,
            c.kelembapan,
            c.kecepatan_angin,
            c.kondisi
        FROM cuaca c
        JOIN lokasi l ON c.id_lokasi = l.id_lokasi
        WHERE l.nama_kota = %s
        ORDER BY c.tanggal DESC
        LIMIT 1;
    """
    cursor.execute(query, (kota,))
    data = cursor.fetchone()

    cursor.close()
    conn.close()

    if not data:
        return jsonify({"error": f"Data cuaca untuk kota {kota} tidak ditemukan."}), 404

    return jsonify(data)

# === API: Rekomendasi Tanam ===
@app.route("/api/rekomendasi")
def get_rekomendasi():
    musim = request.args.get("musim", "Hujan")
    komoditas = request.args.get("komoditas", "Padi")
    lahan = request.args.get("lahan", "Sawah")

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
        SELECT 
            r.isi_rekomendasi,
            k.nama_komoditas,
            m.nama_musim,
            t.nama_lahan
        FROM rekomendasi r
        JOIN komoditas k ON r.id_komoditas = k.id_komoditas
        JOIN musim m ON r.id_musim = m.id_musim
        JOIN tipe_lahan t ON r.id_lahan = t.id_lahan
        WHERE m.nama_musim = %s
          AND k.nama_komoditas = %s
          AND t.nama_lahan = %s
        LIMIT 1;
    """
    cursor.execute(query, (musim, komoditas, lahan))
    data = cursor.fetchone()

    cursor.close()
    conn.close()

    if not data:
        return jsonify({"error": "Tidak ada rekomendasi untuk kombinasi tersebut."}), 404

    return jsonify(data)

# === Halaman utama ===
@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)
