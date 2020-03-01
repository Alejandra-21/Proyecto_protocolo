<?php

define('EMAIL_FOR_REPORTS', '');
define('RECAPTCHA_PRIVATE_KEY', '@privatekey@');
define('FINISH_URI', 'http://');
define('FINISH_ACTION', 'message');
define('FINISH_MESSAGE', 'Thanks for filling out my form!');
define('UPLOAD_ALLOWED_FILE_TYPES', 'doc, docx, xls, csv, txt, rtf, html, zip, jpg, jpeg, png, gif');

define('_DIR_', str_replace('\\', '/', dirname(__FILE__)) . '/');
require_once _DIR_ . '/handler.php';

?>

<?php if (frmd_message()): ?>
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-solid-dark.css" type="text/css" />
<span class="alert alert-success"><?php echo FINISH_MESSAGE; ?></span>
<?php else: ?>
<!-- Start Formoid form-->
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-solid-dark.css" type="text/css" />
<script type="text/javascript" src="<?php echo dirname($form_path); ?>/jquery.min.js"></script>
<form enctype="multipart/form-data" class="formoid-solid-dark" style="background-color:#FFFFFF;font-size:14px;font-family:'Roboto',Arial,Helvetica,sans-serif;color:#34495E;max-width:480px;min-width:150px" method="post"><div class="title"><h2>Registro protocolo</h2></div>
	<div class="element-separator"><hr><h3 class="section-break-title">Datos Personales</h3></div>
	<div class="element-name<?php frmd_add_class("name"); ?>"><label class="title"></label><span class="nameFirst"><input placeholder=" Nombre" type="text" size="8" name="name[first]" /><span class="icon-place"></span></span><span class="nameLast"><input placeholder=" Apellidos" type="text" size="14" name="name[last]" /><span class="icon-place"></span></span></div>
	<div class="element-input<?php frmd_add_class("input"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input" placeholder="Boleta"/><span class="icon-place"></span></div></div>
	<div class="element-email<?php frmd_add_class("email"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="email" name="email" value="" placeholder="Email"/><span class="icon-place"></span></div></div>
	<div class="element-password<?php frmd_add_class("password"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="password" name="password" value="" placeholder="Contraseña"/><span class="icon-place"></span></div></div>
	<div class="element-separator"><hr><h3 class="section-break-title">Protocolo</h3></div>
	<div class="element-file<?php frmd_add_class("file"); ?>"><label class="title"></label><div class="item-cont"><label class="large" ><div class="button">Hecho</div><input type="file" class="file_input" name="file" /><div class="file_text">Selecciona un archivo</div><span class="icon-place"></span></label></div></div>
	<div class="element-input<?php frmd_add_class("input3"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input3" placeholder="Palabras clave"/><span class="icon-place"></span></div></div>
	<div class="element-input<?php frmd_add_class("input2"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input2" placeholder="Palabras clave"/><span class="icon-place"></span></div></div>
	<div class="element-input<?php frmd_add_class("input1"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input1" placeholder="Palabras clave"/><span class="icon-place"></span></div></div>
	<div class="element-separator"><hr><h3 class="section-break-title">Integrantes</h3></div>
	<div class="element-name<?php frmd_add_class("name1"); ?>"><label class="title"></label><span class="nameFirst"><input placeholder=" Nombre" type="text" size="8" name="name1[first]" /><span class="icon-place"></span></span><span class="nameLast"><input placeholder=" Apellido" type="text" size="14" name="name1[last]" /><span class="icon-place"></span></span></div>
	<div class="element-input<?php frmd_add_class("input4"); ?>"><label class="title"></label><div class="item-cont"><input class="large" type="text" name="input4" placeholder="Boleta"/><span class="icon-place"></span></div></div>
<div class="submit"><input type="submit" value="Registrarse"/></div></form><script type="text/javascript" src="<?php echo dirname($form_path); ?>/formoid-solid-dark.js"></script>

<!-- Stop Formoid form-->
<?php endif; ?>

<?php frmd_end_form(); ?>