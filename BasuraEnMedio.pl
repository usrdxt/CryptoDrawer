# Script "BasuraEnMedio.pl"  
#
# Este script está basado en el artículo "Criptografía Clásica (III)" realizado por
# el usuario "darthje" y alojado en Kriptopolis.org en la siguiente URL:
# http://www.kriptopolis.org/criptografia-clasica-iii                          
#                                                                                                    
# Comparto el script bajo licencia Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Spain       
# http://creativecommons.org/licenses/by-nc-sa/3.0/es/                                               
#                                                                                                    
# Si observas algún error o quieres comentar algo, puedes ponerte en contacto conmigo a través de:             
# http://sites.google.com/site/usrdxt/ 

# Compatibilidad para línea de comandos de WindowsXP
binmode(STDOUT, ":encoding(cp850)");
binmode(STDIN, ":encoding(cp850)");    
                                                                                          
print "Introduce aquí el mensaje recibido:\n";
# Ejemplo: TE AMARE HASTA EL FIN DEL MUNDO MI CORAZON AÑORA TU PRESENCIA
$mensaje = <STDIN>;
chop($mensaje);
$CaracteresMensaje = length($mensaje);

# Aquí señalamos los caracteres que forman parte del mensaje descifrado, según la clave que tuvieramos para descifrarlo.
#
# El primer carácter tiene la posición 0. Para que el primer carácter tenga la posición 1, utilizaremos otra variable llamada $ClaveEn1.
# 
# Ejemplo: 5 6 13 14 17 31 33 39 45 48 58 61 ($ClaveEn1) -  4 5 12 13 16 30 32 38 44 47 57 60 ($Clave)
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
			# Ejemplo: MATALO MAÑANA
			print "El mensaje descifrado es: $TextoPlano\n";
			exit;	
			}
		else
			{
			# Podríamos eliminar esta variable si queremos que el primer elemento sea 0, en vez de 1.
			$ClaveEn1 = $clave - 1;
			# $clave VS $ClaveEn1
			$elemento = substr($mensaje, $ClaveEn1, 1);
			push(@MensajeClaro, $elemento);
			}
	}
exit;	