#!../../bin/linux-arm/onewire

## You may have to change onewire to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/onewire.dbd")
onewire_registerRecordDeviceDriver(pdbbase)

## Load record instances
dbLoadRecords("db/dallas1wire.db","ID=Humidity, user=piHost")

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=piHost"
