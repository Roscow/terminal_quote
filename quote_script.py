import random
import os

dir_act = os.getcwd()
path_quotes = dir_act+"/terminal_quotes/quotes_list.txt"


# abrir el listado de citas y escoger uno


archivo=open(path_quotes,'r')
lista_citas = archivo.readlines()
num_citas=len(lista_citas)
num_linea_random= random.randint(0, num_citas-1)
cita_nueva = lista_citas[num_linea_random]
archivo.close()





# modificar el bash 

cad_split = dir_act.split('/')
dir_bash_final = '/'+ cad_split[1] +'/' +cad_split[2]+ '/.bashrc'

archivo2=open(dir_bash_final,'r')
lista_lineas = archivo2.readlines()
lista_final=[]

for i in lista_lineas:
	cad_en_linea = i[0:8]
	cad_busqueda = 'var_cita'
	
	if(cad_en_linea != cad_busqueda):
		lista_final.append(i)
	else:
		cita_nueva2=cita_nueva[:-1]
		var_cita="var_cita='"+cita_nueva2+"'\n"
		lista_final.append(var_cita)
archivo2.close()





# guardar la lista nueva en el archivo

archivo3=open(dir_bash_final,'w')
archivo3.writelines(lista_final)
archivo3.close()
		
		
		
		
		
		
		
