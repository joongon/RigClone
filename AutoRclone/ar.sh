#! /bin/bash

######## AutoRclone Intercative Executioner ########## 
#                                                    #
# made by RigidBody as of Aug 30th 2021 for NAS Dang #
# mk8283541@gmail.com                                #
######################################################


cd /volume1/homes/AutoRclone

echo "Select Number you want to do with AutoRclone between 1(Remote)  and 2(Local) action or Just Enter(Remote) : "

read rl_action
[ -z $rl_action ] && rl_action=1

if [ $rl_action = 1 ]; then
	echo "Select between c(Copy, Default(Just Enter)) and m(Move) action : "
	read cm_action

        [ -z $cm_action ] && cm_action="c"
	
	if [ $cm_action = "c" ]; then
		echo "We are getting started to do Server Side Copy Action."
		echo "Input Source Folder ID : "
		read r_source
		echo "Input Destination Folder ID :"
		read r_destination
		echo "Input Destination Path under the Folder(Target) or default(no dp, just ENTER) : "
		read r_dp
	
		echo "Input Min.no of SA(Service Account) or default(1, just Enter) : "
		read min_sa
		[ -z $min_sa ] && min_sa=1

		echo "Input Max.no of SA(Service Account) or default(100, just Enter) : "
		read max_sa
		[ -z $max_sa ] && max_sa=100

		
		if [ -z $r_dp ]; then
			python3 rclone_sa_magic.py -s $r_source -d $r_destination -b $min_sa -e $max_sa
		else
			python3 rclone_sa_magic.py -s $r_source -d $r_destination -dp $r_dp -b $min_sa -e $max_sa
		fi

	        
	elif [ $cm_action = "m" ]; then
                echo "We are getting started to do Server Side move Action."
                echo "Input Source Folder ID : "
                read rm_source
                echo "Input Destination Folder ID :"
                read rm_destination
                
		echo "Input Destination Path under the Folder(Target) or default(no dp, Just ENTER) : "
                read rm_dp

                echo "Input Min.no of SA(Service Account) or default(1, Just Enter) : "
                read min_sa
                [ -z $min_sa ] && min_sa=1

                echo "Input Max.no of SA(Service Account) or default(100, Just Enter) : "
                read max_sa
                [ -z $max_sa ] && max_sa=100


                if [ -z $rm_dp ]; then
                        python3 rclone_sa_magic_m.py -s $rm_source -d $rm_destination -b $min_sa -e $max_sa
                else
                        python3 rclone_sa_magic_m.py -s $rm_source -d $rm_destination -dp $rm_dp -b $min_sa -e $max_sa
                fi

	else
 		echo "Your input is not valid, please do the right selection"
		exit
	fi

elif [ $rl_action = 2 ]; then
        echo "Select among c(Copy), m(Move) action or s(Sync) action : "
        read lcm_action
        [ -z $lcm_action ] && lcm_action="c"
        
        if [ $lcm_action = "c" ]; then
                echo "We are getting started to do Local to Server Copy Action."
                echo "Input Source Folder path(Local) : "
                read l_source
                echo "Input Destination Folder ID :"
                read lr_destination

		echo "Input Destination Path under the Folder(Target) or default(no dp, Just ENTER) : "
                read lr_dp

                echo "Input Min.no of SA(Service Account) or default(1, Just Enter) : "
                read min_sa
                [ -z $min_sa ] && min_sa=1

                echo "Input Max.no of SA(Service Account) or default(100, Just Enter) : "
                read max_sa
                [ -z $max_sa ] && max_sa=100


                if [ -z $lr_dp ]; then
                        python3 rclone_sa_magic.py -sp $l_source -d $lr_destination -b $min_sa -e $max_sa
                else
                        python3 rclone_sa_magic.py -sp $l_source -d $lr_destination -dp $lr_dp -b $min_sa -e $max_sa
                fi


        elif [ $lcm_action = "m" ]; then        
                echo "We are getting started to do Local to Server move Action."
                echo "Input Source Folder path(Local) : "
                read lm_source
                echo "Input Destination Folder ID :"
                read lm_destination

                echo "Input Destination Path under the Folder(Target) or default(no dp, Just ENTER) : "
                read lm_dp

                echo "Input Min.no of SA(Service Account) or default(1, Just Enter) : "
                read min_sa
                [ -z $min_sa ] && min_sa=1

                echo "Input Max.no of SA(Service Account) or default(100, Just Enter) : "
                read max_sa
                [ -z $max_sa ] && max_sa=100


                if [ -z $lm_dp ]; then
                        python3 rclone_sa_magic_m.py -sp $lm_source -d $lm_destination -b $min_sa -e $max_sa
                else
                        python3 rclone_sa_magic_m.py -sp $lm_source -d $lm_destination -dp $lm_dp -b $min_sa -e $max_sa
                fi

        elif [ $lcm_action = "s" ]; then
                echo "We are getting started to do Local to Server sync Action."
                echo "Input Local Path : "
                read ls_source
                echo "Input Destination Folder ID :"
                read ls_destination
                
		echo "Input Destination Path under the Folder(Target) or default(no dp, Just ENTER) : "
                read ls_dp

                echo "Input Min.no of SA(Service Account) or default(1, Just Enter) : "
                read min_sa
                [ -z $min_sa ] && min_sa=1

                echo "Input Max.no of SA(Service Account) or default(100, Just Enter) : "
                read max_sa
                [ -z $max_sa ] && max_sa=100


                if [ -z $ls_dp ]; then
                        python3 rclone_sa_magic_s.py -sp $ls_source -d $ls_destination -b $min_sa -e $max_sa
                else
                        python3 rclone_sa_magic_s.py -sp $ls_source -d $ls_destination -dp $ls_dp -b $min_sa -e $max_sa
                fi        

        else
                echo "Your input is not valid, please do the right selection"
                exit 
        fi

else
       echo "Your input is not valid, please do the right selection"
             exit 
 
fi


