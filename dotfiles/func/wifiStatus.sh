if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "Tenemos internet!"
else
  echo "No hay internet, seguro que el wifi esta apagado"
  networksetup -setairportpower en0 on
fi
