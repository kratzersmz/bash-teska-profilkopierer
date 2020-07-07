#!/bin/bash
# AK Skeleton Script grabbed from somewhere on the internet

LEHRERRAW=$(getent group lehrer-schule)
IFS=':' read -ra ADDR <<< "$LEHRERRAW"
LEHRERS="${ADDR[-1]}"


IFS=',' read -ra ADDR2 <<< "$LEHRERS"
for i in "${ADDR2[@]}"; do
  if [ "$i" != "aproflehrer" ]; then
      echo "Processing $(echo $i)"
      mkdir -p /home/lehrer/$i/AppData/
      cp -R -p /home/aproflehrer/AppData/ /home/lehrer/$i/AppData
      chown -R $i:"Domain Users schule" /home/lehrer/$i/AppData
  fi
done

SCHUELERRAW=$(getent group schueler-schule)
IFS=':' read -ra ADDR3 <<< "$SCHUELERRAW"
SCHUELERS="${ADDR3[-1]}"

IFS=',' read -ra ADDR4 <<< "$SCHUELERS"
for i in "${ADDR4[@]}"; do
  if [ "$i" != "aprofschueler" ]; then
      echo "Processing $(echo $i)"
      mkdir -p /home/schueler/$i/AppData/
      cp -R -p /home/aprofschueler/AppData/ /home/schueler/$i/AppData
      chown -R $i:"Domain Users schule" /home/schueler/$i/AppData
  fi
done

