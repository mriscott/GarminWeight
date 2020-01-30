watch=fr735xt
sdkroot=/export/home/u8006988/garmin/sdk/

Weight.prg : source/*.mc
	monkeyc  -y ../developer_key.der -o ./Weight.prg -f ./monkey.jungle 

run: Weight.prg
	connectiq &
	monkeydo ./Weight.prg ${watch}
	
package: 
	monkeyc -e -a ${sdkroot}/bin/api.db -i ${sdkroot}/bin/api.debug.xml -o ./Weight.iq -y ../developer_key.der -w -u ${sdkroot}/bin/devices.xml -p ${sdkroot}/bin/projectInfo.xml -f ./monkey.jungle
