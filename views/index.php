<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['status']) {
  header("Location:../");
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bienvenidos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>
  <a class="btn btn-danger btn-sm" href="../controllers/trabajador.controller.php?operacion=destroy">
    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
    Cerrar sesión
  </a>
</body>

</html>