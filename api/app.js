const express = require('express');
const mongoose = require('mongoose');
const helmet = require('helmet');
const app = express();

const PORT = process.env.PORT || 3000;
const DB_URL = process.env.DB_URL;

app.use(helmet()); 
app.use(express.json());

// Endpoint de Salud
app.get('/health', async (req, res) => {
    const dbStatus = mongoose.connection.readyState === 1 ? "Conectado" : "Desconectado";
    res.json({
        status: "Servicio Activo",
        database: dbStatus,
        uptime: process.uptime()
    });
});

app.get('/api/data', (req, res) => {
    res.json({ message: "Datos obtenidos de forma segura", timestamp: new Date() });
});

mongoose.connect(DB_URL)
    .then(() => {
        console.log("Conexión exitosa a MongoDB");
        app.listen(PORT, () => console.log(`API corriendo en puerto ${PORT}`));
    })
    .catch(err => {
        console.error("Error conectando a la base de datos:", err);
        process.exit(1);
    });