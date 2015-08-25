#ifndef SYSGENSYNTHFSE__H
#define SYSGENSYNTHFSE__H
#ifdef __cplusplus
extern "C" {
#endif
/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "sysgensynthfse_hw.h"
/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 sysgensynthfse_BaseAddress;
    u32 sysgensynthfse_dh_i_BaseAddress;
    u32 sysgensynthfse_dh_q_BaseAddress;
    u32 sysgensynthfse_i_in_BaseAddress;
    u32 sysgensynthfse_q_in_BaseAddress;
    u32 sysgensynthfse_q_out_BaseAddress;
} sysgensynthfse_Config;
#endif
/**
* The sysgensynthfse driver instance data. The user is required to
* allocate a variable of this type for every sysgensynthfse device in the system.
* A pointer to a variable of this type is then passed to the driver
* API functions.
*/
typedef struct {
    u32 sysgensynthfse_BaseAddress;
    u32 sysgensynthfse_dh_i_BaseAddress;
    u32 sysgensynthfse_dh_q_BaseAddress;
    u32 sysgensynthfse_i_in_BaseAddress;
    u32 sysgensynthfse_q_in_BaseAddress;
    u32 sysgensynthfse_q_out_BaseAddress;
    u32 IsReady;
} sysgensynthfse;
/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define sysgensynthfse_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define sysgensynthfse_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define sysgensynthfse_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define sysgensynthfse_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif
/************************** Function Prototypes *****************************/
#ifndef __linux__
int sysgensynthfse_Initialize(sysgensynthfse *InstancePtr, u16 DeviceId);
sysgensynthfse_Config* sysgensynthfse_LookupConfig(u16 DeviceId);
int sysgensynthfse_CfgInitialize(sysgensynthfse *InstancePtr, sysgensynthfse_Config *ConfigPtr);
#else
int sysgensynthfse_Initialize(sysgensynthfse *InstancePtr, const char* InstanceName);
int sysgensynthfse_Release(sysgensynthfse *InstancePtr);
#endif
/**
* Read from i_out gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the i_out instance to operate on.
*
* @return	int
*
* @note    i_out.
*
*/
int sysgensynthfse_i_out_read(sysgensynthfse *InstancePtr);
/**
* Read from dh_i gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the dh_i instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int sysgensynthfse_dh_i_read(sysgensynthfse *InstancePtr);
/**
* Read from dh_q gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the dh_q instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int sysgensynthfse_dh_q_read(sysgensynthfse *InstancePtr);
/**
* Write to i_in gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the i_in instance to operate on.
* @param	Data is value to be written to gateway i_in.
*
* @return	None.
*
* @note    .
*
*/
void sysgensynthfse_i_in_write(sysgensynthfse *InstancePtr, int Data);
/**
* Read from i_in gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the i_in instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int sysgensynthfse_i_in_read(sysgensynthfse *InstancePtr);
/**
* Write to q_in gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the q_in instance to operate on.
* @param	Data is value to be written to gateway q_in.
*
* @return	None.
*
* @note    .
*
*/
void sysgensynthfse_q_in_write(sysgensynthfse *InstancePtr, int Data);
/**
* Read from q_in gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the q_in instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int sysgensynthfse_q_in_read(sysgensynthfse *InstancePtr);
/**
* Read from q_out gateway of sysgensynthfse. Assignments are LSB-justified.
*
* @param	InstancePtr is the q_out instance to operate on.
*
* @return	int
*
* @note    .
*
*/
int sysgensynthfse_q_out_read(sysgensynthfse *InstancePtr);
#ifdef __cplusplus
}
#endif
#endif
