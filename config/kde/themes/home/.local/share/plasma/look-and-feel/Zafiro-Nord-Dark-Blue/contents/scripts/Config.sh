##[es] Script para mostrar hora con Mayusculas y Minisculas.
#Creator: Adolfo Silerio a.k.a ZAYRONXIO
#mail: zayronxio@gmail.com
###########
resetplasma(){
killall plasmashell & systemctl --user restart plasma-plasmashell &
VerPro(){
proces="$(pgrep plasmashell)"
if [ $proces > 1 ]
then
exit 1
else
systemctl --user restart plasma-plasmashell & exit 0
fi
}
while true; do
    VerPro
    ((i++))
    if [ `VerPro` > 1 ]
    then
        break
    fi
done
}
bash $HOME/.local/share/plasma/look-and-feel/Zafiro-Nord-V2/contents/scripts/RemoveWidget.sh
resetplasma &

