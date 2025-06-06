<?php

function validar_sesion(string $page)
{
    session_start();
    if (isset($_SESSION['usuario'])) {
        header('Location: ' . APP_PATH . $page . '.php');
        exit();
    }
}
