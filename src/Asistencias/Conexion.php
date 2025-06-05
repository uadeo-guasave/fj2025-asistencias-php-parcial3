<?php
// Conexión procedural a la base de datos
$host = '127.0.0.1';
$usuario = 'root';
$contrasena = '';
$baseDatos = 'asistenciasdb';

$conexion = mysqli_connect($host, $usuario, $contrasena, $baseDatos);

if (!$conexion) {
    throw new Exception('Error de conexión: ' . mysqli_connect_error());
}
