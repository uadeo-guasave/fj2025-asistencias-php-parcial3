<?php
// si tu archivo solo tiene codigo php no lo cierres
echo "<h1>Hola desde PHP sin Apache</h1>";

require_once __DIR__ . '/../src/Asistencias/Conexion.php';

$sql = 'select * from docentes';
$rst = $conexion->query($sql);
if (!$rst) {
    exit('Error en la consulta: ' . $conexion->error);
}

if ($rst->num_rows > 0) {
    while ($fila = $rst->fetch_assoc()) {
        echo "<br>Id: " . $fila['id_docente'] . ", Nombre: " . $fila['nombre'];
    }
} else {
    echo "<br>No se encontraron docentes.";
}

$conexion->close();
