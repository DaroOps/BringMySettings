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
