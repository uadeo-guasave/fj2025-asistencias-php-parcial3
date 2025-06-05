<?php
// src/Asistencias/validar_login.php
require_once __DIR__ . '/../src/Asistencias/Conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'] ?? '';
    $password = $_POST['password'] ?? '';

    $stmt = $conexion->prepare('SELECT * FROM usuarios WHERE usuario = ? AND password = ?');
    $stmt->execute([$usuario, $password]);
    $user = $stmt->fetch();

    if ($user) {
        session_start();
        $_SESSION['usuario'] = $usuario;
        header('Location: ../../public/index.php');
        exit();
    } else {
        echo '<script>alert("Usuario o contraseña incorrectos");</script>';
        exit();
    }
}
