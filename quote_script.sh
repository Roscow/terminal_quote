

#guardar direccion actual
dir_act=$(pwd)

#formar las rutas 
archivo_leeme='/leeme.txt'
ruta_leeme=$dir_act$archivo_leeme

archivo_python='/quote_script.py'
ruta_python=$dir_act$archivo_python

archivo_quotes='/quotes_list.txt'
ruta_quotes=$dir_act$archivo_quotes

c=$dir_act$dir_aux

#crear carpeta en home 
cd ~ 
dir_home=$(pwd)
mkdir terminal_quotes
cd ~/terminal_quotes

#movemos archivos a home/carpeta creada
mv $ruta_leeme ~/terminal_quotes
mv $ruta_python ~/terminal_quotes
mv $ruta_quotes ~/terminal_quotes


#creacion de variables en .bashrc
echo "var_cita='prueba'" >> ~/.bashrc
echo 'echo -e "\e[44m $var_cita \e[0m"' >> ~/.bashrc

user_name=$(whoami)

#modificar permisos de crontab 
sudo chmod 777 /var/spool/cron/crontabs


#modificar archivo contrab 

cron_p1='*/20 * * * * python3 '
cron_p2='/terminal_quotes/quote_script.py'
cron_final=$cron_p1$dir_home$cron_p2

cron_path_p1="/var/spool/cron/crontabs/"
cron_path_final=$cron_path_p1$user_name

echo "$cron_final" >> $cron_path_final 

#reiniciar serivio del cron
/etc/init.d/cron restart

#devolver los permisos a la carpeta   drwx-wx--T root crontab 730(t)
sudo chmod 735 /var/spool/cron/crontabs



