#define GetObjectAttachedToObject(%0)    (g_ObjectAttachToObject[%0 - 1])
#define GetObjectAttachedToVehicle(%0)   (g_ObjectAttachToVehicle[%0 - 1])
#define IsObjectTextured(%0,%1)          (g_ObjectTextureID[%0 - 1][%1] != -1)
#define GetObjectTextureID(%0,%1)        (g_ObjectTextureID[%0 - 1][%1])
#define GetObjectTextureColor(%0,%1)     (g_ObjectTextureColor[%0 - 1][%1])
#define IsObjectText(%0,%1)              (g_IsObjectText[%0 - 1][%1])
#define GetObjectMaterialText(%0,%1)     (g_ObjectText[%0 - 1][%1])
#define GetObjectTextMaterialSize(%0,%1) (g_ObjectMaterialSize[%0 - 1][%1])
#define GetObjectTextFont(%0,%1)         (g_ObjectFont[%0 - 1][%1])
#define GetObjectTextFontSize(%0,%1)     (g_ObjectFontSize[%0 - 1][%1])
#define IsObjectTextBold(%0,%1)          (g_IsObjectTextBold[%0 - 1][%1])
#define GetObjectTextColor(%0,%1)        (g_ObjectTextColor[%0 - 1][%1])
#define GetObjectTextBackColor(%0,%1)    (g_ObjectTextBackColor[%0 - 1][%1])
#define GetObjectTextAlignment(%0,%1)    (g_ObjectTextAlignment[%0 - 1][%1])
