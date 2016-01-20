$Id: readme.txt 3758 2014-10-08 10:29:50Z mic $

Readme für OpenCart Lokalisierungsprojekt bei crowdin
===================================================

Paquete/paquete de idiomas (usuario/admin) - Idiomas (Admin/Usuario)
Requerimientos de Opencart 2.x
Copyright		OpenCart http://www.opencart.com
License			GNU/GPL http://www.gnu.org/copyleft/gpl.html
Contexto de solicitud

**********************************************************************************
General
* *******	*
* Este archivo es solo para ser usado en OpenCart Version 2.					 *
* Cada directorio (admin & Catálogo) tiene un archivo llamado 'maestro'.				 *
* En el proyecto se muestra siempre como english.php.							 *
* Estos 2 archivos serán exportados en formato localizado. Por ejemplo si *
* selecciona fr-FR (Francés) serán renombradas automáticamente como fr-FR.php *
**
* Lenguaje de Instalación *
* *********************                *
* Si desea instalar OpenCart en su propio idioma, por favor lea notas siguientes. *
**
* Traductores *
* *********** *
* Para proporcionar las traducciones más exactas, por favor vuelva a revisar sus traducciones *
* antes de enviar.																 *
* Y - si desea ofrecer un proceso de instalación en su idioma, traduzca*
* también el archivo de la carpeta de instalación.											 *
**
* Y no olvides añadir la configuración de instalación para tu idioma debajo *
*(crea tu propia sección de localización debajo)*
**
**********************************************************************************

Nota: ajustes como el código y configuración regional (véase abajo) dependen del idioma
que estés utilizando.
Si no estás seguro de qué variables se pueden o deben utilizar, por favor busca en Internet
los valores adecuados.

Inglés
=======

Descripción
***********
Paquete completo de traducción para el Panel de control (Backend) y usuario (Frontend / tienda)
y el idioma de instalación.

Instalación
************

Para instalar este paquete de idioma, descomprima localmente el paquete comprimido
y transfiera los archivos (con la misma estructura que ve) con FTP
a su servidor (actual instalación de tienda).
Después de eso, abra su backend OpenCart y siga estos pasos:

1. Desplácese a Sistema-> Localización-> Idiomas
2. Haga clic en el botón Editar
3. Rellene los siguientes valores:

	3.1 idioma inglés
	3.2 Code		en-DB
	3.3 Locale		en-gb,en_gb,en-GB,english
	3.4 Image es.png
	3.5 Directory es-ES
	3.6 Estado habilitado
	3.7 Sort Order	1

    Guardar

4. Desplácese a Sistema-> Configuración
5. Clic en la pestaña Local para definir su lenguaje estándar
    front- y back-end (el idioma de backend no va a cambiar antes de este paso!)
6. Guardar
7. Listo

Alemán
=======

Descripción
************
Komplette deutsche Übersetzung für Admin (Backend) und Benutzer (Frontend / Shop)
inklusive Installationssprache

Instalación
************

Um dieses Sprachenpaket zu installieren, das gezippte Paket Lokal entpacken.
Anschließend die Dateien (gleiche Verzeichnisstruktur wie sichtbar
im Ordner upload) per FTP auf den Server (Shopinstallation) kopieren.

Hinweis: das System zeigt noch die englische Sprache an, daher sind im Folgenden
etliche Begriffe in Englisch (wie im Shop angezeigt) angegeben:

1.	Backend aufrufen -> System -> Localisation -> Languages
2.	Button "Insert" anklicken
3.	Folgende Werte eingeben:

	3.1 Language	Deutsch (German)
	3.2 Code		de-DE
	3.3 Locale		de_DE.UTF-8,de_DE,de-de,german
	3.4 Image		de.png
	3.5 Directory	de-DE
	3.6 Estado habilitado
	3.7 Sort Order	1

    Sichern (Button Save rechts oben anklicken)

4.	System -> Settings aufrufen
5.	Reiter "Locale" anklicken und die Standardsprache für Admin und Benutzer
	festlegen > erst dann schaltet das Backend auf die hier eingestellte Sprache
    um!
6.	Speichern (Button Sichern rechts oben anklicken)
7.	Fertig

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! WICHTIG !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Um den verschiedenen Gesetzen zu entprechen (speziell EU-Raum, AT, DE),         !
! kann es erforderlich sein, dass verschiedene Variablen (z.B. $_['text_price'] ) !
! angepasst werden müssen!                                                        !
! Näheres dazu auf http://osworx.net wo wir ein spezielles Paket zur Verfügung    !
! stellen, mit welchem die rechtlichen Anforderungen abgedeckt werden.            !
!                                                                                 !
! Siehe dazu Module LEGAL sowie EUCookie auf http://osworx.net                    !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! WICHTIG !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Idioma de instalación
********************
In diesem Paket ist auch die dt. Sprache für eine Installation in Deutsch enthalten.
Wird das Sprachenpaket VOR der Installation auf den Server kopiert, kann
der Installationsvorgang in Deutsch durchgeführt werden.

Soporte
*******
http://osworx.net y http://forum.opencart.com/viewforum.php?f=189

Garantía
********************
Esta extensión se crea bajo nuestro mejor esfuerzo.
Desafortunadamente no podemos garantizar cualquier pérdida de datos o mal funcionamiento.

Licencia
*******
Notas:
    > Este paquete puede ser utilizado en trabajos propios / derivado de las siguientes condiciones:
    -cabeceras:
		-deben permanecer intactas
        - you are allowed to add your own lines
        - you are NOT allowed to delete any line of the headers
    - this readme has always to be included in further packages
    - building own commercial packages with this as base is strictly forbidden!

Hinweise:
    > dieses Paket kann für eigene Werke zu folgenden Konditionen verwendet werden:
    - Kopfzeilen:
		- müssen intakt bleiben
        - es können eigene Zeilen hinzu gefügt werden
        - es dürfen KEINE Kopfzeilenzeilen gelöscht werden
    - diese Datei (readme.txt) muss in allen zukünftigen Paketen inkludiert sein
    - eigene kommerzielle Pakete damit zu erstellen ist strikt verboten!

Versión/Lista de cambios (rev)
*************************
Leyenda
*-> Parche de seguridad
# -> Corrección de errores
+-> Añadido
^-> Cambio
--> Eliminado
! -> Nota
-------------------------
1.0.7
1.0.6	2014.10.08	Versión inicial