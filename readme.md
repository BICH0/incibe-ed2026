# Descripcion
En este repositorio se encuentran todas las practicas de la pagina web del Incibe - [Retos Descargables](https://www.incibe.es/ed2026/talento-hacker/academia-hacker/retosdescargables)

Se encuentran organizados por dificultad y siguiendo el orden original.

El proyecto consta de tres partes
* [JavaScript para descargar los retos](#javascript)
* [Scripts de bash para ordenar y formatear los retos](#bash)
* [Retos](#retos)

## Advertencia
El script de descarga falla al descargar el reto 5-intermedio y 5-9-10-12 avanzado, intentaré arreglarlo en cuanto sea posible pero por limitaciones de Incibe ahora mismo me es imposible

# JavaScript
El codigo usado para descargar todos los retos es el siguiente:
```js
function downloadFiles(){
  const downloads = new Array;
  const containers = [document.getElementById("iniciacion"),document.getElementById("intermedio"),document.getElementById("avanzado")]
  for (let x in containers){
    let count = 1;
    console.log(containers[x].id + "------------------------")
    let container = containers[x];
    if (!container.classList.contains("show")){
      container.classList.add("show")
    }
    let rows = container.getElementsByClassName("row");
    for (let y in rows){
      let row = rows[y]
      let items = row.childNodes
      for (let z in items){
        let item = items[z]
        try{
          let img = item.getElementsByTagName("img")[0].alt.toLowerCase().replaceAll("í","i").replaceAll("á","a");
          if (img == "ingenieria inversa"){
            img = "reverse"
          }
          let src = item.getElementsByTagName("a")[0];
          src.download = container.id + count + "-" + img + "-" + src.href.split("/").pop();
          console.log(src.download)
          //src.click();
          downloads.push(src)
          count++
        }catch{

        }
      }
    }
  }
  downloads.forEach(item => {item.click()});
  console.log("Descargando " + downloads.length);
}
downloadFiles()
```
Para ejecutarlo en la web del Incibe se puede copiar y pegar lo anterior en la consola (F12) o mediante la extension [ViolentMonkey](https://violentmonkey.github.io/)

# Bash
Estos son todos los scripts usados para este proyecto
## Indice
* [checkDownload](#checkdownload.sh)
* [parser.sh](#parser.sh)
* [xtractor.sh](#xtractor.sh)
## checkDownload.sh
Este script comprueba que se han descargado todos los retos y notifica si falta alguno

## parser.sh
Este script se usa para componer este readme (no deberias necesitar usarlo a no ser que renueven los retos)

## xtractor.sh
Este script desempaqueta todos los retos que se encuentran en [retos/originales]() en formato 7z con contraseña y los reempaqueta de la siguiente manera

reto.tgz
 - archivos (Contiene todos los archivos necesarios para el reto)
 - enunciado-reto.pdf (Intrucciones, si es que existen)
 - WalkTrough.pdf (Contiene la solucion del reto, proporcionada por el incibe)

Puedes encontrar este formato en [retos/processed]()

# Retos
A continuacion se van a listar todos los retos

## Dificultad: iniciacion  
### 1-magiccrypto.7z
**Categoria:** criptografia  
 **Tags:**  
 Descifra el mensaje oculto en la imagen MagicCrypto.jpg.  
**Solucion:**  
### 2-hashcracking.7z
**Categoria:** criptografia  
 **Tags:**  
 ¿Cuál es el único resultado que no contiene números?  
**Solucion:**  
### 3-calculator.7z
**Categoria:** reverse  
 **Tags:**  
 Un amigo nos ha pasado el código de las imágenes y cuando lo ejecutamos nos pide un número. Nuestro amigo no nos ha dado el número, que es necesario para que el programa funcione bien.  
**Solucion:**  
### 4-analisiscorreos.7z
**Categoria:** forense  
 **Tags:**  
 Se ha logrado acceder al equipo de D. Furioso y se ha realizado una extracción de su carpeta de correo electrónico. Examina las comunicaciones y encuentra información acerca de un percance sufrido por D. Furioso. Indica la matrícula del coche de D.Furioso.  
**Solucion:**  
### 5-ruta.7z
**Categoria:** criptografia  
 **Tags:**  
 ¿Cuál es el sabor elegido para el nuevo zumo de una conocida marca? El fichero lemon.pdf parece tener la clave.  
**Solucion:**MAREADOS  
### 6-ellibrodelquijote.7z
**Categoria:** criptografia  
 **Tags:**  
 Desde la creación del instituto, algunos alumnos se han encargado de la gestión del periódico local, "El noticiero",
donde se intercambian mensajes y escriben artículos didácticos. En uno de los artículos alguien anónim@ ha
lanzado un reto. Asegura haber escondido un mensaje en el libro más universal de la literatura, pero solo nos
proporciona algunas coordenadas para que las mentes más brillantes del instituto puedan resolverlo.
¿Cuál es el mensaje secreto que ha enviado el alumno anónimo y ha escondido este anónim@?
Datos proporcionados:
Libro: "El quijote de la mancha" (adjunto)
Cada una de etas coordenadas pertenece a una palabra, júntalas mediante un guion bajo _.
Si encuentras palabra1 y palabra2 la solución es flag{palabra1_palabra2}.  
	 10:8:2  
	 23:10:1  
	 30:8:2  
	 30:26:7  
	 35:1:7  
	 151:19:10  
	 151:11:8  
	 152:11:5   
**Solucion:**  
### 7-notacifrada.7z
**Categoria:** criptografia  
 **Tags:**ROT-13   
 Después de muchos años recopilando documentación, fotos y artículos, se ha decidido realizar una limpieza y
llevar la documentación antigua a una nueva sala que le ha cedido el instituto.
En esta sala se pueden archivar de una forma sencilla por fecha todos los documentos del periódico.
Durante este proceso moviendo documentos, una hoja extraña se cae entre los documentos que lleváis. Contiene
un texto ilegible junto a la referencia del emperador Julio César.
 ¿Podrás sacar en claro que quería decir la nota?
  
**Solucion:**  
### 8-enigma.7z
**Categoria:** criptografia  
 **Tags:**  
   
**Solucion:**  
### 9-webofuscate.7z
**Categoria:** web  
 **Tags:**  
 En una de las clases de informática a las que asistes te asignan la tarea de mirar el código de un fichero html que formará parte del aplicativo que están desarrollando otros compañeros. Revísalo y confirma las dudas que tiene el profesor. 
¿Cuál es la contraseña de acceso? El código parece ofuscado.  
**Solucion:**  accessgranted1337

### 10-excursion.7z
**Categoria:** miscelaneo  
 **Tags:**exiftool  
 En próximos días vais a participar en una de las salidas anuales del instituto. Os llega al correo la información de la salida junto a una imagen adjunta. Como sois curiosos, decidís mirar si hay metadatos en la imagen. 

¿Qué fichero oculta la imagen adjunta?   
**Solucion:**perseverance  

### 11-programa.7z
**Categoria:** reverse  
 **Tags:** uncompyle6 python2  
 Ejecuta el fichero main y responde las preguntas para obtener la flag. Utiliza el pdf disponible para analizar el código de ciertas funciones.  
**Solucion:** tengo_esta_clave_entre_mis_papeles  

### 12-exfiltracion.7z
**Categoria:** forense  
 **Tags:**  
 Habláis con el director del instituto y os permite acceder al contenido del disco. Al entrar encontráis un pcap.

¿Qué es un pcap? os preguntáis. No lo sabemos, pero habrá que investigar.
Los datos os suenan codificados en hexadecimal, pero ... ¿Cómo recomponer estas piezas de cada petición?
Además, hay mucho ruido de navegación en el fichero.
  
**Solucion:**  

### 13-crackme.7z
**Categoria:** reverse  
 **Tags:** DnSpy avaloniailspy   
 En el escritorio del usuario de uno de los ordenadores localizáis una aplicación. Os aseguráis de que no sea maliciosa y ejecutáis el fichero exe. Parece contener dos entradas de texto.
 
Hay dos flags en esta prueba, recupera la flag1 del fichero exe.  
**Solucion:** ACCESOHASIDOCONCEDIDO  

### 14-crackme2.7z
**Categoria:** reverse  
 **Tags:**DnSpy avaloniailspy  
 En el escritorio del usuario de uno de los ordenadores localizais una aplicacion. Os aseguráis que no sea maliciosa y ejecutáis el fichero exe. Parece contener dos entradas de texto. 

Hay dos flags en esta prueba, recupera la flag2 del fichero exe.   
**Solucion:**COMPROBADO  
### 15-warmuplevel0.7z
**Categoria:** miscelaneo  
 **Tags:** brainfuck  
 Tienes a alguien enviándote mensajes crípticos que parecen totalmente "random". 
No son muy valientes quienes creen ocultarse bajo el anonimato de la red. 

 ¿Serás capaz de encontrar el mensaje quien esconde esta rara cadena de texto?  
**Solucion:** stop_bullying_sociedad_mejor  

### 16-criptlejana.7z
**Categoria:** criptografia  
 **Tags:** chino 
 Descifra el mensaje.  
**Solucion:** chinatown  

### 17-lafuente.7z
**Categoria:** criptografia  
 **Tags:**  
 Se ha recibido un correo electrónico con un documento de texto adjunto con unos caracteres indescifrables.

¿Puedes recuperar el mensaje original?
  
**Solucion:** una_fuente_puede_ser_un_codificador  

### 18-quehace.7z
**Categoria:** reverse  
 **Tags:**  
 En clase de informática te piden que compruebes qué hace el siguiente trozo de código. 
Aparentemente no realiza ninguna acción

¿Puedes hacerlo funcionar o extraer información de este?
  
**Solucion:**  
### 19-tvradiosignal.7z
**Categoria:** criptografia  
 **Tags:** MMSSTV  
 Una de las salidas que realizáis en el instituto es fuera de la gran ciudad, al campo. En esas salidas pernoctáis en un albergue y si el tiempo acompaña, soléis escuchar al anciano del lugar rememorar algunas historias del pueblo. El anciano saca una radio y reproduce en una cinta magnética de audio unos sonidos que según dice el los grabó años atrás. Esto empieza a parecerse a Stranger Things(tm) !
  
¿Podrías desvelar al anciano que mensaje esconde la cinta?   
**Solucion:** 44258  

### 20-qr.7z
**Categoria:** miscelaneo  
 **Tags:**  
 Se ha implantado en el colegio un sistema para entrar a clase mediante lectura de un código QR. El profesor distribuye varios códigos QR para que los alumnos prueben sus teléfonos

¿Puedes leer el QR?
  
**Solucion:**  

### 21-accesoftp.7z
**Categoria:** forense  
 **Tags:**  
 Parece que alguien desde una cuenta anónima está intentado ayudar en la investigación y os ha enviado otro fichero pcap. Lo ha capturado desde alguna clase de informática que se dio en el instituto.

Pregunta:
Hay varias tramas que se corresponden a una subida FTP. Nos piden encontrar el contenido de lo que se ha descargado para proseguir en la investigación. Se trata de un fichero que se han descargado.  
**Solucion:** karina  

### 22-cadenamagica.7z
**Categoria:** reverse  
 **Tags:** strings->pcap binwalk -e pcap.out  
 En clases de informática, el profesor está distribuyendo unos binarios que necesitan de una cadena mágica como parámetro para probar las habilidades de los alumnos

¿Puedes encontrar la cadena mágica que devuelve la flag?
  
**Solucion:**  

### 23-documents.7z
**Categoria:** criptografia  
 **Tags:**ciberchef  
 Revisando la información en Documents, encontráis un fichero con un mensaje muy extraño. 
 
Se repiten con frecuencia algunos pares de caracteres. Parece hexadecimal. ¿Qué obtienes si lo decodificas?
  
**Solucion:** DISCOVER_HEX_MORSE_CODE  

### 24-ganaenlaruleta.7z
**Categoria:** criptografia  
 **Tags:**  
 En clase de lengua se ha estudiado la táctica a seguir para optimizar juegos del tipo de la ruleta de la fortuna.

¿podrás aplicar esos conocimientos al siguiente texto para encontrar el mensaje oculto?
  
**Solucion:**  


## Dificultad: intermedio  

### 1-cofre.7z
**Categoria:** reverse  
 **Tags:**  
 Un amigo nos ha pasado un fichero cofre.pyc y partes del código. Cuando lo ejecutamos nos pide una contraseña. Nuestro amigo no nos ha dado la contraseña, que es necesaria para que el programa funcione bien. Cuidado, que es un poco troll.  
**Solucion:**  
### 2-pyofuscated.7z
**Categoria:** reverse  
 **Tags:**  
 La profesora de literatura ha olvidado su contraseña y la necesita para poder subir las notas a la plataforma oficial. Tú has aprobado, pero hasta que no estén en la aplicación no será efectivo y es necesario tenerlas subidas antes de 1 semana. 
El personal de sistemas ha proporcionado un script para recuperarla, pero la profesora no recuerda la respuesta a la pregunta de recuperación.

¿podrías ayudarnos a recuperarla?
  
**Solucion:**  
### 3-appexaminar.7z
**Categoria:** reverse  
 **Tags:**  
 Disponemos de una aplicación móvil para examinar: ExtractPermissions.apk. 
Indica el curioso mensaje que lanza la aplicación en circunstancias específicas.
La aplicación todavía está por terminar, pero tenemos acceso a una versión alfa de la misma. 
Es un buen momento para analizar la aplicación y su funcionalidad. Esta aplicación esconde un secreto que puede agradarte mucho. 
  
**Solucion:**  
### 4-tramasenlared.7z
**Categoria:** forense  
 **Tags:**  
 Se ha obtenido una la captura de tráfico donde se ha producido una conexión remota entre dos equipos. Encuentra las credenciales utilizadas en dicha conexión.  
**Solucion:**  
### 6-problematrafico.7z
**Categoria:** forense  
 **Tags:**  
 El fichero traffic.pcap contiene una captura de tráfico que se realizó durante una transferencia de ficheros. Durante el transcurso de la captura de tráfico se ha transferido un fichero con información importante. Localiza alguna pista sobre este fichero en la captura de tráfico.  
**Solucion:**  
### 7-collage.7z
**Categoria:** criptografia  
 **Tags:**  
 La clase de manualidades e informática han preparado de manera conjunta un problema para los alumnos en el que se esconde un mensaje en un collage

¿Eres capaz de encontrar el mensaje oculto?
  
**Solucion:**  
### 8-dnsexfiltration.7z
**Categoria:** miscelaneo  
 **Tags:**  
 Los datos del equipo del director han vuelto a ser robados, el método ha sido por DNS. El atacante ha intentado que estos datos no sean descubiertos y ha ofuscado todo el proceso.

¿Podrías ayudarnos a conseguir los datos exfiltrados?
  
**Solucion:**  
### 9-cadenamagica3.7z
**Categoria:** reverse  
 **Tags:**  
 En clases de informática, el profesor está distribuyendo unos binarios que necesitan de una cadena mágica como parámetro para probar las habilidades de los alumnos

¿Puedes encontrar la cadena mágica que devuelve la flag?
  
**Solucion:**  
### 10-mensajeoculto.7z
**Categoria:** forense  
 **Tags:**  
 Como ejercicio final del módulo de forense, el profesor de informática ha propuesto la siguiente actividad: Descifrar el contenido del mensaje oculto en el fichero Mensaje.zip. Para ellos tenemos una captura de tráfico y el propio fichero. 

¿Aprobarás este módulo?
  
**Solucion:**  
### 11-capturadeepoca.7z
**Categoria:** forense  
 **Tags:**  
 Se ha detenido un sospechoso de ser infiltrado de una gran empresa en España que ha estado enviando un código a un asociado para informar sobre ciertas acciones previamente establecidas. Se necesita encontrar indicios de la supuesta clave que ha enviado. Se ha obtenido una captura de tráfico de su ordenador. Analízala para ver si existe algún tipo de mensaje o palabra clave que haya intentado ocultar con especial cuidado.  
**Solucion:**  
### 12-httprequests.7z
**Categoria:** miscelaneo  
 **Tags:**  
 El Director se ha dejado olvidado en una clase un USB con un fichero dentro, los datos parecen no ser muy relevantes, pero... parece que esconde un mensaje.

¿Cómo podemos obtener el mensaje?   
**Solucion:**  
### 13-reverseme.7z
**Categoria:** reverse  
 **Tags:**  
 En uno de los laboratorios de computación encuentras una máquina apagada con un post-it en el lateral: "/root/Desktop/reto36/reversesecret - Resolver mediante ingeniería inversa". Parece que te animas a encender el ordenador, un viejo pentium que todavía arranca. Guardas el fichero a tu máquina para trabajar cómodamente y empiezas el desafío. 

Al reverso del post-it se puede leer: "Enviar flag a mi número personal, se recompensará"


¿Qué condiciones necesitará este binario para que imprima la flag?
  
**Solucion:**  
### 14-multicrypto.7z
**Categoria:** criptografia  
 **Tags:**  
 Hoy tenemos un examen de matemáticas, concretamente del temario de criptografía y codificación de mensajes. El examen consiste en descifrar el mensaje oculto.

¿Serás capaz de aprobar?
  
**Solucion:**  
### 15-rompecabezas.7z
**Categoria:** miscelaneo  
 **Tags:**  
 Distintos profesores de diversas materias se han puesto de acuerdo para confeccionar un rompecabezas para sus alumnos usando los conocimientos adquiridos para subir la nota global

¿Puedes resolver el rompecabezas y encontrar el mensaje oculto?

  
**Solucion:**  
### 16-campannademarketing.7z
**Categoria:** forense  
 **Tags:**  
 La ingeniería social es la práctica de obtener información confidencial a través de la manipulación de usuarios legítimos. A través del engaño nuestro se ha conseguido que un empleado de una empresa de publicidad envíe por correo ordinario el pendrive de su jefe haciéndonos pasar por él. Dentro encontramos un archivo que parece tener información sobre el personaje en el que basarán su próxima campaña. ¿Puedes averiguar el nombre del personaje?  
**Solucion:**  
## Dificultad: avanzado  
### 1-pracprogramacion.7z
**Categoria:** reverse  
 **Tags:**  
 Ejecuta el fichero main y responde las preguntas para obtener la flag. Utiliza el pdf disponible para analizar el código de ciertas funciones.  
**Solucion:**  
### 2-roca.7z
**Categoria:** criptografia  
 **Tags:**  
 El profesor de matemáticas es alguien muy cercano, se ha interesado por vuestro club de CTF's y os ha enviado un mensaje cifrado donde asegura que con los datos proporcionados se podrá descifrar. 
¡Como premio al primero que lo consiga ... le aumentará 1 punto la nota final!
 
¿Cual es el mensaje cifrado?
  
**Solucion:**  
### 3-retocriptografia.7z
**Categoria:** criptografia  
 **Tags:**  
 Hemos encontrado 2 extraños ficheros. Se trata de un reto exigente de criptografía que están preparando para los alumnos de cursos avanzados. Prueba a resolverlo.
 ¿Puedes obtener el mensaje que ocultan los ficheros?
  
**Solucion:**  
### 4-infected.7z
**Categoria:** forense  
 **Tags:**  
 El profesor de historia ha sido engañado y le han robado datos de su carpeta personal. Hemos capturado el tráfico de red durante el ataque.

¿Podrás analizar y encontrar que datos han sido robados?
  
**Solucion:**  
### 5-stegolsb.7z
**Categoria:** criptografia  
 **Tags:**  
 En la clase de música han reproducido una canción que será el himno de final de curso. Para conseguir aprobar la asignatura es necesario descubrir un código oculto.

¿Serás capaz de descubrir el código?   
**Solucion:**  
### 6-capafrutas.7z
**Categoria:** criptografia  
 **Tags:**  
 ¿Cuál es el sabor elegido para el nuevo zumo de una conocida marca? El fichero lemon.pdf parece tener la clave.  
**Solucion:**  
### 7-evidencias.7z
**Categoria:** forense  
 **Tags:**  
 Para ganar puntos extras, puedes resolver esta práctica de forense digital. Analiza la evidencia que corresponde a un pendrive y recupera la información oculta.  
**Solucion:**  
### 8-powershell.7z
**Categoria:** reverse  
 **Tags:**  
 Un inspector de la administración se ha olvidado un pen drive en la mesa de la sala multiusos. Hemos encontrado en su interior un script en PowerShell ofuscado. 

¿Podrías analizarlo y descubrir que esconde?
  
**Solucion:**  
### 9-paranormalact.7z
**Categoria:** criptografia  
 **Tags:**  
 Sucesos paranormales se están detectando en las oficinas. Necesitamos saber quién es el responsable de ellas. Para poder identificarlo se ha dejado una cámara de vigilancia grabando y se han obtenido las siguiente evidencia, ¿Puedes indicar quién ha sido?  
**Solucion:**  
### 10-discocifrado.7z
**Categoria:** forense  
 **Tags:**  
 El equipo del profesor de tecnología ha sido cifrado y no tiene acceso a sus datos. Tenemos el contenido de la memoria y el disco cifrado.

¿Podríamos ayudarle a recuperar los datos?
  
**Solucion:**  
### 11-milpalabras.7z
**Categoria:** criptografia  
 **Tags:**  
 Una imagen vale más que mil palabras. Pues encuentra el flag.  
**Solucion:**  
### 12-dametuwifi.7z
**Categoria:** forense  
 **Tags:**  
 En las vacaciones de verano estuve en la casa de la playa de mi primo. Yo no quería quedarme sin megas rapidito porque en los stories paso el ratito. Me dio la contraseña de su red WiFi así pude navegar por Internet sin consumir mis megas.
He tenido un accidente con el móvil y ahora no me enciende la pantalla. Por suerte he podido hacer un volcado del sistema de ficheros y he podido sacar todos los datos que tenía.
Ya me he comprado un móvil nuevo y me va estupendo. Me ha dejado la casa para este fin de semana, pero en este móvil no tengo guardada la red WiFi. Tú sabes de esto, ¿no? ¿Puedes obtener la contraseña de la red Wi Fi a la que conecté el teléfono? Así podré conectar también el nuevo móvil. Muchas gracias.
  
**Solucion:**  
### 13-suenabien.7z
**Categoria:** criptografia  
 **Tags:**  
 Los alumnos de un conservatorio musical han sido descubiertos copiando en un examen, la evidencia que el profesor ha descubierto (SuenaBien.png), aparentemente no se trata de una información confidencial, ¿Puedes observar el mensaje que estaban trasmitiendo los alumnos?  
**Solucion:**  
### 14-atmbank.7z
**Categoria:** reverse  
 **Tags:**  
 Te ha llegado por correo un programa que forma parte del desarrollo de un módulo de banca y tus profesores te han pedido que lo analices. Se trata de un binario x64 Windows que intenta enlazar con una pasarela bancaria. Al parecer la información cifrada no está del todo correcta. Averigua exactamente que le ocurre a este programa.  
**Solucion:**  
