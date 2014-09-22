#ifndef _BASIC_DATA_TYPE_H_
#define _BASIC_DATA_TYPE_H_

#define WIN32_LEAN_AND_MEAN
#include <string>
#include <vector>
#include <list>
#include <map>
using namespace std;

#include <math.h>
#include <time.h>

#include <sys/stat.h>
#ifdef _WIN32
#include <tchar.h>
#include <Windows.h>
#include <direct.h>
#else
#include <dirent.h>
#endif

#include <stdlib.h>

typedef char NVINT8;
typedef char NVCHAR;
typedef wchar_t NVWCHAR;
#ifdef _UNICODE
typedef NVWCHAR MYNVCHAR;
#else
typedef NVCHAR MYNVCHAR;
#endif
typedef unsigned char NVUINT8;
typedef short NVINT16;
typedef unsigned short NVUINT16;
typedef int NVINT32;
typedef unsigned int NVUINT32;
typedef size_t NVSIZE;
typedef long long NVINT64;
typedef unsigned long long NVUINT64;


typedef float NVFLOAT;
typedef double NVDOUBLE;
typedef bool NVBOOL;
typedef int NVRES; // -1, 0, 1
#define  NV_FALSE 0
#define NV_TRUE 1
#define NV_NULL 0

#pragma warning (disable : 4996)
#pragma warning (disable : 4800)

#define PI 3.1415926
#define EARTH_R 6371000.0
#define ONE_DEG_DIST 111194.925
#define ONE_METER_DEG 0.00000899322
#define R2D(rad) (rad * 180.0 / PI)
#define D2R(deg) (deg * PI / 180.0)
#define MAX(val_1, val_2) (val_1 > val_2 ? val_1 : val_2)
#define MIN(val_1, val_2) (val_1 < val_2 ? val_1 : val_2) 

extern const NVDOUBLE g_d_arr_sin[3600];
extern const NVDOUBLE g_d_arr_cos[3600];
#define SIN(x) g_d_arr_sin[((NVUINT32)(x*10))%3600]
#define COS(x) g_d_arr_cos[((NVUINT32)(x*10))%3600]
#define DOUBLE_SAME_VALUE 0.000001
//NAVIFLOAT sqrt_rg(NAVIFLOAT x);
//NAVIFLOAT acos_rg(NAVIFLOAT x);

#define MAX_UINT32 0xFFFFFFFF
#define MAX_UINT16 0xFFFF
#define MAX_UINT8 0xFF
#define MAX_DOUBLE (NVDOUBLE)(1E+308)
#define MAX_FLOAT (NVFLOAT)(3E+038)

#define BLK_NORTH_UNIT 3.0
#define BLK_EAST_UNIT 3.0
#define BLK_NORTH_PIXELS 4096
#define BLK_EAST_PIXELS 4096
#define ONE_BLK_NORTH_PIXEL_DEG (BLK_NORTH_UNIT / BLK_NORTH_PIXELS / 60.0)
#define ONE_BLK_EAST_PIXEL_DEG (BLK_EAST_UNIT / BLK_EAST_PIXELS / 60.0)

#define KEY_COLOR RGB(254, 1, 254)
#define SCREEN_WIDTH 480
#define SCREEN_HEIGHT 272
#define CLIENT_LEFT 2
#define CLIENT_TOP 20
#define CLIENT_RIGHT 478
#define CLIENT_BOTTOM 252

#define ROAD_CLASS_HIGHWAY 0
#define ROAD_CLASS_CITY_EXPRESS 1
#define ROAD_CLASS_NATION 2
#define ROAD_CLASS_PROVINCE 3
#define ROAD_CLASS_COUNTY 4
#define ROAD_CLASS_TOWN 6
#define ROAD_CLASS_OTHER 8
#define ROAD_CLASS_WALK 9
#define ROAD_CLASS_FERRY 10
#define ROAD_CLASS_CONSTRUCTING 15

#ifdef _UNICODE
#define SPRINTF _stprintf
#define STRCPY _tcscpy
#define STRCMP _tcscmp
#define STRCAT _tcscat
#define STRLEN _tcslen
#define STRCHR _tcschr
#define STRRCHR _tcsrchr
#define STRSTR _tcsstr
#define OPEN _tfopen
static const NVWCHAR* c_p_folder_sign = _T("\\");
static const NVWCHAR* c_p_all_file_type = _T("*.*");
static const NVWCHAR* c_p_one_dot_str = _T(".");
static const NVWCHAR* c_p_two_dot_str = _T("..");
static const NVWCHAR* c_p_file_rt = _T("rt");
static const NVWCHAR* c_p_file_wt = _T("wt");
static const NVWCHAR* c_p_file_add = _T("a+");
static const NVWCHAR* c_p_file_rb = _T("rt");
static const NVWCHAR* c_p_file_wb = _T("rt");
#else
#define SPRINTF sprintf
#define STRCPY strcpy
#define STRCMP strcmp
#define STRCAT strcat
#define STRLEN strlen
#define STRCHR strchr
#define STRRCHR strrchr
#define STRSTR strstr
#define OPEN fopen
#ifdef _WIN32
static const NVCHAR* c_p_folder_sign = "\\";
#else
static const NVCHAR* c_p_folder_sign = "/";
#endif
static const NVCHAR* c_p_all_file_type = "*.*";
static const NVCHAR* c_p_one_dot_str = ".";
static const NVCHAR* c_p_two_dot_str = "..";
static const NVCHAR* c_p_file_rt = "rt";
static const NVCHAR* c_p_file_wt = "wt";
static const NVCHAR* c_p_file_add = "a+";
static const NVCHAR* c_p_file_rb = "rt";
static const NVCHAR* c_p_file_wb = "rt";
#endif

#endif
