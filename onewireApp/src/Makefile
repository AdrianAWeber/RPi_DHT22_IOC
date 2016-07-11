TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================
# Build an IOC support library

LIBRARY_IOC += dallas1wire

DBD += dallas1wire.dbd
dallas1wire_SRCS += dallas1wire.c
dallas1wire_SRCS += pi_2_dht_read.h
dallas1wire_SRCS += pi_2_mmio.h
dallas1wire_SRCS += common_dht_read.h
dallas1wire_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# build an ioc application

PROD_IOC = onewire

DBD += onewire.dbd
# onewire.dbd will be made up from these files:
onewire_DBD += base.dbd
#include definitions for any other support applications needed
onewire_DBD += dallas1wire.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
onewire_SRCS += onewire_registerRecordDeviceDriver.cpp
onewire_SRCS_DEFAULT += onewireMain.cpp
onewire_SRCS_vxWorks += -nil-

#The following adds support from base/src/vxWorks
onewire_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

#add a definition for each support application used by this application
onewire_LIBS += dallas1wire

#NOTES:
#      1)It is not possible to build sncExample both as a component of onewire
#        and standalone. You must choose only one.
#      2)To build sncExample SNCSEQ must be defined in <top>/configure/RELEASE

#The following builds sncExample as a component of onewire
#onewire_SRCS += sncExample.stt
#onewire_LIBS += seq pv

onewire_LIBS += $(EPICS_BASE_IOC_LIBS)

#The following builds sncExample as a standalone application
#PROD_HOST += sncExample
#sncExample_SNCFLAGS += +m
#sncExample_SRCS += sncExample.stt
#sncExample_LIBS += seq pv
#sncExample_LIBS += $(EPICS_BASE_HOST_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

