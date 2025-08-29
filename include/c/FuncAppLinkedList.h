#ifndef FUNC_APP_LINKED_LIST
#define FUNC_APP_LINKED_LIST

#define IS_SET 0
#define IS_TUPLE 1
#define IS_SINGLE 3

struct InfoType;

//We need to Define all the Custom Types 
typedef struct {
  struct InfoType** arr;
  int size;
} TupleType;

typedef struct {
  struct InfoType** arr;
  int size;
} SetType;

typedef enum {
  INTEGER,
  DOLLAR,
  PERCENT,
  REAL,
  BOOL
} SingleType;

typedef union {
  TupleType tuple;
  SetType set;
  SingleType single;
} CustomType;

typedef struct InfoType {
  int infoType;
  CustomType data;
} TypeInfo;

typedef struct{
  char* origName;
  char* newAlias;
  TypeInfo** params;
  int paramSize;
  TypeInfo* ret;
} FuncApp;

typedef struct{
  char* origName;
  TypeInfo** params;
  int paramSize;
  TypeInfo* ret;
} FuncQueryApp;

typedef struct FAppElem{
  struct FAppElem* next;
  FuncApp* application;
} FuncAppElem;

typedef FuncAppElem* FuncAppList;

FuncAppList createApplicationList();
void addApplicationElem(FuncAppList* list, FuncApp* info);
char* getFunctionAlias(FuncAppList* list, FuncQueryApp* info);
void freeFuncAppList(FuncAppList* list);
int matchTypes(TypeInfo* type1, TypeInfo* type2);
int matchQueryToActual(FuncQueryApp* query, FuncApp* actual);
void typeInfoToStr(TypeInfo* type, int size, char* str);
char* funcAppListToString(FuncAppList list);

#endif
