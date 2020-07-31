#!/data/data/com.termux/files/usr/bin/bash
#by RedEye
#please run in home
#
function stay_home { 
	clear
	echo -e  "$cyan [!]Veamos si estamos en home! \n"
	sleep 1
	AD=$(pwd) 
	if [ $AD = $HOME/Custom-Termux ]; then
		echo -e "$green [✓]Ok, estamos en home comenzemos$reset \n"
		sleep 1
	else
		echo -e "$red [×]La carpeta Custom-Termux debe estar en home $reset \n"
		sleep 1
		exit
	fi
}

function colorz {
	export negro='\033[1;30m'
	export red='\033[1;31m'
        export green='\033[1;32m'
        export yellow='\033[1;33m'
        export blue='\033[1;34m'
        export magenta='\033[1;35m'
        export cyan='\033[1;36m'
        export reset='\033[0m'
}

function all_in_your_place {
	cp colors $PREFIX/libexec

}

function redeye_banner {

	bash banners/redeye
}

function test_banner4 {
        clear
        bash banners/banner4
        echo -e "$cyan Que tal este banner
        [1]Usar este
        [2]Volver al primer banner$reset\n"
        while read -p ">>> " opt4 && [ -z $opt4 ]; do
                echo -e "$red Selecciina una opcion!!$reset\n"
        done
        case $opt4 in
                1)
                        echo -e "$green Ok, usaremos este "
                        cp banners/banner4 $PREFIX/libexec/wall-banner
                        ;;
                2)

                        test_banner1
                        ;;
        esac
}


function test_banner3 {
        clear
        bash banners/banner3
        echo -e "$cyan Que tal este banner
        [1]Usar este
        [2]Ver el siguiente banner$reset\n"
        while read -p ">>> " opt3 && [ -z $opt3 ]; do
                echo -e "$red Selecciina una opcion!!$reset\n"
        done
        case $opt3 in
                1)
                        echo -e "$green Ok, usaremos este "
                        cp banners/banner3 $PREFIX/libexec/wall-banner
                        ;;
                2)

                        test_banner4
                        ;;
        esac
}

function test_banner2 {
        clear
        bash banners/banner2
        echo -e "$cyan Que tal este banner
        [1]Usar este
        [2]Ver el siguiente banner$reset\n"
        while read -p ">>> " opt2 && [ -z $opt2 ]; do
                echo -e "$red Selecciina una opcion!!$reset\n"
        done
        case $opt2 in
                1)
                        echo -e "$green Ok, usaremos este "
                        cp banners/banner2 $PREFIX/libexec/wall-banner
                        ;;
                2)

                        test_banner3
                        ;;
        esac
}
	
function test_banner1 {
	clear 
	bash banners/banner1
	echo -e "$cyan Que tal este banner
	[1]Usar este 
	[2]Ver el siguiente banner$reset\n"
	while read -p ">>> " opt1 && [ -z $opt1 ]; do
		echo -e "$red Selecciina una opcion!!$reset\n"
	done
	case $opt1 in
		1)
			echo -e "$green Ok, usaremos este "
			cp banners/banner1 $PREFIX/libexec/wall-banner
			;;
		2)

			test_banner2
			;;
	esac

}


function set_banner {
	clear 
	redeye_banner
	echo 
	echo -e "$yellow [+]$cyan Vamos a configurar un banner\n"
	echo -e "Presiona$green ENTER$cyan Para Continuar$reset\n"
	read enter 
	
}
function rm_motd {
	clear 
	sleep 1
	redeye_banner
	echo -e "$cyan Deseas conservar el archivo original 
	de inicio de termux(motd)???

	[1]Si(se renombrara a motd02)
	[2]no(se eliminara!)
	[3]Ya lo elimine(no lo tengo) "
	while read -p ">>> " rmmotd && [ -z $rmmotd ]; do
		echo -e  "$red [!]Seleccioma una opcion!!$reset\n"
	done
	case $rmmotd in
		1)
			echo -e "$green Conservando motd!!$reset"
			mv $PREFIX/etc/motd $PREFIX/etc/motd02
			sleep 1

			;;
		2)
			echo -e "$red Eliminando motd!!$reset"
			rm $PREFIX/etc/motd
			sleep 1

			;;
		3)
			echo -e "$cyan Ok, Sigamos$reset"
			sleep 1

			;;
	esac
}
function bye_bye {
	mv $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc2
	mv bashito $PREFIX/etc/bash.bashrc
	clear
	redeye_banner
	echo -e "$green TERMINAMOS!!(reinicia tu termux porfavor)\n" 
	echo -e "$yellow Pronto mas opciones de pesonalizacion!!$reset\n"
	echo -e "$cyan Gracias por usar mi script apoyame compartiendolo a mas gente"
	echo -e "$reset\n"
	cd $HOME
	rm -rf Custom-Termux 
	
}

function setup_custom {
	colorz
	stay_home
	all_in_your_place
	rm_motd
	set_banner
	test_banner1
	bye_bye

}

#SETUP

setup_custom


#REDEYE
