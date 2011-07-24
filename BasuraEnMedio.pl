# Script "BasuraEnMedio.pl"  
#
# Este script esta basado en el articulo "Criptografía Clasica (III)" realizado por
# el usuario "darthje" y alojado en Kriptopolis.org en la siguiente URL:
# http://www.kriptopolis.org/criptografia-clasica-iii                          
#                                                                                                    
# Comparto el script bajo licencia Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Spain       
# http://creativecommons.org/licenses/by-nc-sa/3.0/es/                                               
#                                                                                                    
# Si observas algun error o quieres comentar algo, puedes ponerte en contacto conmigo a traves de:             
# http://sites.google.com/site/usrdxt/ 

# Compatibilidad para línea de comandos de WindowsXP
#binmode(STDOUT, ":encoding(cp850)");
#binmode(STDIN, ":encoding(cp850)");    
                                                                                          
print "Introduce aqui el mensaje recibido:\n";

$mensaje = <STDIN>;
chop($mensaje);
$CaracteresMensaje = length($mensaje);

# Aqui introducimos los caracteres que forman parte del mensaje descifrado, segun la clave que tuvieramos para descifrarlo.
#
# El primer caracter tiene la posicion 0. Para que el primer caracter tenga la posición 1, utilizaremos otra variable llamada $ClaveEn1.
# 
print "Introduce las posiciones relevantes para leer el mensaje. Introduce los valores dando al Intro.\n";
print "Cuando hayas terminado de introducir las posiciones relevantes, teclea DESCIFRAR.\n";
for ($i = 1; $i <= $CaracteresMensaje; ++$i)
	{
	$clave = <STDIN>;
	chop($clave);
		if ($clave eq "DESCIFRAR") 
			{
			# Unimos los caracteres para formar el texto plano
			$TextoPlano = join("", @MensajeClaro);
			print "El mensaje descifrado es: $TextoPlano\n";
			exit;	
			}
		else
			{
			# Podriamos eliminar esta variable si queremos que el primer elemento sea 0, en vez de 1.
			$ClaveEn1 = $clave - 1;
			# $clave VS $ClaveEn1
			$elemento = substr($mensaje, $ClaveEn1, 1);
			push(@MensajeClaro, $elemento);
			}
	}
exit;	