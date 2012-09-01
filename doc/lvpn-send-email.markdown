# Envía un nodo por correo

Genera un email con el archivo de host del nodo especificado y lo envía al
destinatario.

Necesita la utilidad `sendmail` o compatible configurada en el sistema.

* Flags:

    -h  Ayuda
    -t  Destinatario (por defecto vpn@hackcoop.com.ar)
    -f  Remitente (por defecto email de git o usuario@hostname)
    -s  Asunto alternativo
    -m  Mensaje alternativo

* Variables de entorno:

    SENDMAIL    programa alternativo a sendmail
