/**
* @file sysgensynthfse_sinit.c
*
* The implementation of the sysgensynthfse driver's static initialzation
* functionality.
*
* @note
*
* None
*
*/
#ifndef __linux__
#include "xstatus.h"
#include "xparameters.h"
#include "sysgensynthfse.h"
extern sysgensynthfse_Config sysgensynthfse_ConfigTable[];
/**
* Lookup the device configuration based on the unique device ID.  The table
* ConfigTable contains the configuration info for each device in the system.
*
* @param DeviceId is the device identifier to lookup.
*
* @return
*     - A pointer of data type sysgensynthfse_Config which
*    points to the device configuration if DeviceID is found.
*    - NULL if DeviceID is not found.
*
* @note    None.
*
*/
sysgensynthfse_Config *sysgensynthfse_LookupConfig(u16 DeviceId) {
    sysgensynthfse_Config *ConfigPtr = NULL;
    int Index;
    for (Index = 0; Index < XPAR_SYSGENSYNTHFSE_NUM_INSTANCES; Index++) {
        if (sysgensynthfse_ConfigTable[Index].DeviceId == DeviceId) {
            ConfigPtr = &sysgensynthfse_ConfigTable[Index];
            break;
        }
    }
    return ConfigPtr;
}
int sysgensynthfse_Initialize(sysgensynthfse *InstancePtr, u16 DeviceId) {
    sysgensynthfse_Config *ConfigPtr;
    Xil_AssertNonvoid(InstancePtr != NULL);
    ConfigPtr = sysgensynthfse_LookupConfig(DeviceId);
    if (ConfigPtr == NULL) {
        InstancePtr->IsReady = 0;
        return (XST_DEVICE_NOT_FOUND);
    }
    return sysgensynthfse_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif
