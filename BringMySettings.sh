#!/bin/bash

welcome(){

echo -e "
 ######                            #     #          
 #     # #####  # #    #  ####     ##   ## #   #    
 #     # #    # # ##   # #    #    # # # #  # #     
 ######  #    # # # #  # #         #  #  #   #      
 #     # #####  # #  # # #  ###    #     #   #      
 #     # #   #  # #   ## #    #    #     #   #      
 ######  #    # # #    #  ####     #     #   #      
                                                    
  #####                                             
 #     # ###### ##### ##### # #    #  ####   ####   
 #       #        #     #   # ##   # #    # #       
  #####  #####    #     #   # # #  # #       ####   
       # #        #     #   # #  # # #  ###      #  
 #     # #        #     #   # #   ## #    # #    #  
  #####  ######   #     #   # #    #  ####   ####   

 Version 0.1 BMS  
" 
}

print_loading_bar() {
    local bar_length=50
    local total_duration=$1/2
    local update_interval=$(awk "BEGIN { print $total_duration / $bar_length }")
    
    for ((i = 0; i <= bar_length; i++)); do
        echo -ne "\r["
        for ((j = 1; j <= bar_length; j++)); do
            if [ "$j" -le "$i" ]; then
                echo -ne "="
            else
                echo -ne "-"
            fi
        done
        echo -ne "] $((i * 100 / bar_length))%"
        sleep $update_interval
    done

    echo -ne "\n"
}

replace_gitconfig(){
    echo "No se encontró un archivo de configuración en $gitconfig_path."
    touch ~/.gitconfig
    echo "Se ha creado un nuevo archivo de configuración en $gitconfig_path."
    echo -e "\n"

    gitconfig_path=~/.gitconfig

    if [ -f "$gitconfig_path" ]; then
        echo "Se ha encontrado un archivo de configuración en $gitconfig_path."
    else
        echo "No se encontró un archivo de configuración en $gitconfig_path."
        touch ~/.gitconfig
        echo "Se ha creado un nuevo archivo de configuración en $gitconfig_path."
    fi

    existing_username=$(git config --global user.name)
    existing_email=$(git config --global user.email)

    if [ -n "$existing_username" ] && [ -n "$existing_email" ]; then
        echo -e "\n"
        echo "Configuraciones existentes:"
        echo "Nombre de usuario: $existing_username"
        echo "Correo electrónico: $existing_email"
        echo -e "\n"
    fi

    read -p "Ingrese su nombre de usuario para Git: " new_username

    read -p "Ingrese su correo electrónico para Git: " new_email

    sed -i "s/\(\[user\]\s*\n\s*name\s*=\s*\).*\$/\1$new_username/" ~/.gitconfig
    sed -i "s/\(\[user\]\s*\n\s*email\s*=\s*\).*\$/\1$new_email/" ~/.gitconfig

    echo "Credenciales actualizadas con éxito."
}