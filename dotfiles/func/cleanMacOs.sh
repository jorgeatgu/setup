# Tareas de mantenimiento del Mac
# http://www.faq-mac.com/2016/12/empieza-el-ano-creando-una-rutina-de-mantenimiento-tu-mac/

function cleanMacOS() {

    osascript -e '
    display notification "Limpiando macOS 🖥" with title "Empezamos!"'
    sudo rm -rf ~/Library/Caches/ &&
    sudo update_dyld_shared_cache -debug &&
    sudo update_dyld_shared_cache -force &&
    osascript -e '
    display notification "Reiniciando 🙋" with title "Ahora volvemos!"
    do shell script "/bin/sleep 3"
    tell application "System Events" to restart'
}
