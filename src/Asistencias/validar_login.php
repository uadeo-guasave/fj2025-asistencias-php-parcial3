<?php
require_once APP_PATH . '/bootstrap.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'] ?? '';
    $password = $_POST['password'] ?? '';

    $stmt = $conexion->prepare('SELECT * FROM usuarios WHERE usuario = ? AND password = ?');
    $stmt->execute([$usuario, $password]);
    $user = $stmt->fetch();

    if ($user) {
        session_start();
        $_SESSION['usuario'] = $usuario;
        header('Location: ' . APP_PATH . 'home.php');
        exit();
    } else {
        echo '<script>alert("Usuario o contraseña incorrectos");</script>';
        exit();
    }
}
