<?php
session_start();
if (isset($_SESSION["activo"])) {
    $_SESSION['id_user'] = $_GET['id'];
    // Incluyendo cabecera y barra de navegacion del sitio
    require_once("template/header.php");
    require_once("template/navbar.php");
?>
<body>
    <div class="container">
        <form action="../controladores/controlador.php" method="post">
            <div class="form-row" style="padding-top: 1rem;">
                <div class="form-group col-md-6">
                    <label for="inputNombre">Usuario</label>
                    <input type="text" class="form-control" id="inputNombre" name="modUsuario" placeholder="Ingrese su usuario" required autofocus>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputApellido">Password</label>
                    <input type="password" class="form-control" id="inputApellido" name="modPassword" placeholder="Ingrese la contraseña" required>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Agregar</button><br>
        </form>
    </div>
    <?php 
    // Incluyendo pie de pagina
    require_once("template/footer.php");
    ?>
</body>
</html>
<?php
} else {
    header("Location:../index.php");
    exit;
}
?>