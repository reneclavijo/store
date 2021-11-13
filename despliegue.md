# PASOS PARA EL DESPLIEGUE

1. Crear la máquina virtual en AWS

2. Habilitar en el grupo de seguridad los puerto 80 y 443

3. Personalizar los archivos de la carpeta *despliegue*

4. Copiar los archivos a la MV de AWS

5. Ejecutar el archivo *1_instalador_ruby.sh*

    ```bash
    # comando para ejecutar el archivo
    ./despliegue/1_instalador_ruby.sh
    ```

    ```bash
    # en caso de solicitud de permisos
    sudo chmod -R 777 despliegue
    ```

    ! Ejecutar comando `exec $SHELL` en caso de no haber instalado ruby
    
    Volver a ejecutar el archivo SIN reemplazar la llave ssh

6. Ejecutar el archivo *2_instalador_nginx_passenger.sh*

    ```bash
    # PARA VERSIONES CON UBUNTU 20.04
    [https://gorails.com/deploy/ubuntu/20.04#nginx](Guia GoRails) hacer otro instalador
    ```

    ```bash
    ./despliegue/2_instalador_nginx_passenger.sh
    ```
    
    Configurar los archivos de nginx

7. Ejecutar el archivo 3 para configurar y crear el Postgresql en AWS

    ```bash
    ./despliegue/3_instalador_postgresql
    ```

8. Instalar y configurar Capistrano siguiendo el archivo de *4_instalacion_capistrano.md*

