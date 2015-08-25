#include "sysgensynthfse.h"
#ifndef __linux__
int sysgensynthfse_CfgInitialize(sysgensynthfse *InstancePtr, sysgensynthfse_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->sysgensynthfse_BaseAddress = ConfigPtr->sysgensynthfse_BaseAddress;
    InstancePtr->sysgensynthfse_dh_i_BaseAddress = ConfigPtr->sysgensynthfse_dh_i_BaseAddress;
    InstancePtr->sysgensynthfse_dh_q_BaseAddress = ConfigPtr->sysgensynthfse_dh_q_BaseAddress;
    InstancePtr->sysgensynthfse_i_in_BaseAddress = ConfigPtr->sysgensynthfse_i_in_BaseAddress;
    InstancePtr->sysgensynthfse_q_in_BaseAddress = ConfigPtr->sysgensynthfse_q_in_BaseAddress;
    InstancePtr->sysgensynthfse_q_out_BaseAddress = ConfigPtr->sysgensynthfse_q_out_BaseAddress;

    InstancePtr->IsReady = 1;
    return XST_SUCCESS;
}
#endif
int sysgensynthfse_i_out_read(sysgensynthfse *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sysgensynthfse_ReadReg(InstancePtr->sysgensynthfse_BaseAddress, 0);
    return Data;
}
int sysgensynthfse_dh_i_read(sysgensynthfse *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sysgensynthfse_ReadReg(InstancePtr->sysgensynthfse_dh_i_BaseAddress, 0);
    return Data;
}
int sysgensynthfse_dh_q_read(sysgensynthfse *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sysgensynthfse_ReadReg(InstancePtr->sysgensynthfse_dh_q_BaseAddress, 0);
    return Data;
}
void sysgensynthfse_i_in_write(sysgensynthfse *InstancePtr, int Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    sysgensynthfse_WriteReg(InstancePtr->sysgensynthfse_i_in_BaseAddress, 0, Data);
}
int sysgensynthfse_i_in_read(sysgensynthfse *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sysgensynthfse_ReadReg(InstancePtr->sysgensynthfse_i_in_BaseAddress, 0);
    return Data;
}
void sysgensynthfse_q_in_write(sysgensynthfse *InstancePtr, int Data) {

    Xil_AssertVoid(InstancePtr != NULL);

    sysgensynthfse_WriteReg(InstancePtr->sysgensynthfse_q_in_BaseAddress, 0, Data);
}
int sysgensynthfse_q_in_read(sysgensynthfse *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sysgensynthfse_ReadReg(InstancePtr->sysgensynthfse_q_in_BaseAddress, 0);
    return Data;
}
int sysgensynthfse_q_out_read(sysgensynthfse *InstancePtr) {

    int Data;
    Xil_AssertVoid(InstancePtr != NULL);

    Data = sysgensynthfse_ReadReg(InstancePtr->sysgensynthfse_q_out_BaseAddress, 0);
    return Data;
}
