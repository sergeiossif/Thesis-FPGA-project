#ifdef __linux__

/***************************** Include Files *********************************/
#include "sysgensynthfse.h"

/***************** Macros (Inline Functions) Definitions *********************/
#define MAX_UIO_PATH_SIZE       256
#define MAX_UIO_NAME_SIZE       64
#define MAX_UIO_MAPS            5
#define UIO_INVALID_ADDR        0

/**************************** Type Definitions ******************************/
typedef struct {
    u32 addr;
    u32 size;
} sysgensynthfse_uio_map;

typedef struct {
    int  uio_fd;
    int  uio_num;
    char name[ MAX_UIO_NAME_SIZE ];
    char version[ MAX_UIO_NAME_SIZE ];
    sysgensynthfse_uio_map maps[ MAX_UIO_MAPS ];
} sysgensynthfse_uio_info;

/***************** Variable Definitions **************************************/
static sysgensynthfse_uio_info uio_info;

/************************** Function Implementation *************************/
static int line_from_file(char* filename, char* linebuf) {
    char* s;
    int i;
    FILE* fp = fopen(filename, "r");
    if (!fp) return -1;
    s = fgets(linebuf, MAX_UIO_NAME_SIZE, fp);
    fclose(fp);
    if (!s) return -2;
    for (i=0; (*s)&&(i<MAX_UIO_NAME_SIZE); i++) {
        if (*s == '\n') *s = 0;
        s++;
    }
    return 0;
}

static int uio_info_read_name(sysgensynthfse_uio_info* info) {
    char file[ MAX_UIO_PATH_SIZE ];
    sprintf(file, "/sys/class/uio/uio%d/name", info->uio_num);
    return line_from_file(file, info->name);
}

static int uio_info_read_version(sysgensynthfse_uio_info* info) {
    char file[ MAX_UIO_PATH_SIZE ];
    sprintf(file, "/sys/class/uio/uio%d/version", info->uio_num);
    return line_from_file(file, info->version);
}

static int uio_info_read_map_addr(sysgensynthfse_uio_info* info, int n) {
    int ret;
    char file[ MAX_UIO_PATH_SIZE ];
    info->maps[n].addr = UIO_INVALID_ADDR;
    sprintf(file, "/sys/class/uio/uio%d/maps/map%d/addr", info->uio_num, n);
    FILE* fp = fopen(file, "r");
    if (!fp) return -1;
    ret = fscanf(fp, "0x%x", &info->maps[n].addr);
    fclose(fp);
    if (ret < 0) return -2;
    return 0;
}

static int uio_info_read_map_size(sysgensynthfse_uio_info* info, int n) {
    int ret;
    char file[ MAX_UIO_PATH_SIZE ];
    sprintf(file, "/sys/class/uio/uio%d/maps/map%d/size", info->uio_num, n);
    FILE* fp = fopen(file, "r");
    if (!fp) return -1;
    ret = fscanf(fp, "0x%x", &info->maps[n].size);
    fclose(fp);
    if (ret < 0) return -2;
    return 0;
}

int sysgensynthfse_Initialize(sysgensynthfse *InstancePtr, const char* InstanceName) {
 sysgensynthfse_uio_info *InfoPtr = &uio_info;
 struct dirent **namelist;
    int i, n;
    char* s;
    char file[ MAX_UIO_PATH_SIZE ];
    char name[ MAX_UIO_NAME_SIZE ];
    int flag = 0;

    assert(InstancePtr != NULL);

    n = scandir("/sys/class/uio", &namelist, 0, alphasort);
    if (n < 0)  return XST_DEVICE_NOT_FOUND;
    for (i = 0;  i < n; i++) {
     strcpy(file, "/sys/class/uio/");
     strcat(file, namelist[i]->d_name);
     strcat(file, "/name");
        if ((line_from_file(file, name) == 0) && (strcmp(name, InstanceName) == 0)) {
            flag = 1;
            s = namelist[i]->d_name;
            s += 3; // "uio"
            InfoPtr->uio_num = atoi(s);
            break;
        }
    }
    if (flag == 0)  return XST_DEVICE_NOT_FOUND;

    uio_info_read_name(InfoPtr);
    uio_info_read_version(InfoPtr);
    for (n = 0; n < MAX_UIO_MAPS; ++n) {
        uio_info_read_map_addr(InfoPtr, n);
        uio_info_read_map_size(InfoPtr, n);
    }

    sprintf(file, "/dev/uio%d", InfoPtr->uio_num);
    if ((InfoPtr->uio_fd = open(file, O_RDWR)) < 0) {
        return XST_OPEN_DEVICE_FAILED;
    }

    // NOTE: slave interface '' should be mapped to uioX/map0
    InstancePtr->sysgensynthfse_BaseAddress = (u32)mmap(NULL, InfoPtr->maps[0].size, PROT_READ|PROT_WRITE, MAP_SHARED, InfoPtr->uio_fd, 0 * getpagesize());
    assert(InstancePtr->sysgensynthfse_BaseAddress);
    // NOTE: slave interface 'dh_i' should be mapped to uioX/map1
    InstancePtr->sysgensynthfse_dh_i_BaseAddress = (u32)mmap(NULL, InfoPtr->maps[1].size, PROT_READ|PROT_WRITE, MAP_SHARED, InfoPtr->uio_fd, 1 * getpagesize());
    assert(InstancePtr->sysgensynthfse_dh_i_BaseAddress);
    // NOTE: slave interface 'dh_q' should be mapped to uioX/map2
    InstancePtr->sysgensynthfse_dh_q_BaseAddress = (u32)mmap(NULL, InfoPtr->maps[2].size, PROT_READ|PROT_WRITE, MAP_SHARED, InfoPtr->uio_fd, 2 * getpagesize());
    assert(InstancePtr->sysgensynthfse_dh_q_BaseAddress);
    // NOTE: slave interface 'i_in' should be mapped to uioX/map3
    InstancePtr->sysgensynthfse_i_in_BaseAddress = (u32)mmap(NULL, InfoPtr->maps[3].size, PROT_READ|PROT_WRITE, MAP_SHARED, InfoPtr->uio_fd, 3 * getpagesize());
    assert(InstancePtr->sysgensynthfse_i_in_BaseAddress);
    // NOTE: slave interface 'q_in' should be mapped to uioX/map4
    InstancePtr->sysgensynthfse_q_in_BaseAddress = (u32)mmap(NULL, InfoPtr->maps[4].size, PROT_READ|PROT_WRITE, MAP_SHARED, InfoPtr->uio_fd, 4 * getpagesize());
    assert(InstancePtr->sysgensynthfse_q_in_BaseAddress);
    // NOTE: slave interface 'q_out' should be mapped to uioX/map5
    InstancePtr->sysgensynthfse_q_out_BaseAddress = (u32)mmap(NULL, InfoPtr->maps[5].size, PROT_READ|PROT_WRITE, MAP_SHARED, InfoPtr->uio_fd, 5 * getpagesize());
    assert(InstancePtr->sysgensynthfse_q_out_BaseAddress);

    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}

int sysgensynthfse_Release(sysgensynthfse *InstancePtr) {
 sysgensynthfse_uio_info *InfoPtr = &uio_info;

    assert(InstancePtr != NULL);
    assert(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    munmap((void*)InstancePtr->sysgensynthfse_BaseAddress, InfoPtr->maps[0].size);
    munmap((void*)InstancePtr->sysgensynthfse_dh_i_BaseAddress, InfoPtr->maps[1].size);
    munmap((void*)InstancePtr->sysgensynthfse_dh_q_BaseAddress, InfoPtr->maps[2].size);
    munmap((void*)InstancePtr->sysgensynthfse_i_in_BaseAddress, InfoPtr->maps[3].size);
    munmap((void*)InstancePtr->sysgensynthfse_q_in_BaseAddress, InfoPtr->maps[4].size);
    munmap((void*)InstancePtr->sysgensynthfse_q_out_BaseAddress, InfoPtr->maps[5].size);

    close(InfoPtr->uio_fd);

    return XST_SUCCESS;
}

#endif
