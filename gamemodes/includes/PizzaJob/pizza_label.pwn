#include<YSI\y_hooks>

hook OnGameModeInit()
{
    new str[128];
    CreateDynamic3DTextLabel("{F80036}/laynguyenlieu {FFFFFF}\nDe mua nguyen lieu hai san.",COLOR_WHITE,364.4582,-2024.5117,7.8359+0.5,30.0);
    CreateDynamic3DTextLabel("{F80036}/laynguyenlieu {FFFFFF}\nDe mua nguyen lieu nuoc ep.",COLOR_WHITE,365.3215,-2019.7249,7.6719+0.5,30.0);
    CreateDynamic3DTextLabel("{F80036}/laynguyenlieu {FFFFFF}\nDe mua nguyen lieu bot lam banh.",COLOR_WHITE,377.5292,-2007.3160,7.8359+0.5,30.0);
    CreateDynamic3DTextLabel("{F80036}/lambanh {FFFFFF}\nDe bat dau lam banh.",COLOR_WHITE,-112.6412,1002.6437,177.2755+0.5,30.0);
    format(str, sizeof(str), "%i Hai San\n%i Nuoc Ep\n%i Bot Lam Banh", PizzaInfo[NguyenLieu][0], PizzaInfo[NguyenLieu][1], PizzaInfo[NguyenLieu][2]);
    PizzaInfo[Label][0] = CreateDynamic3DTextLabel(str,COLOR_YELLOW,380.1902,-118.3209,1003.2231-3,30.0);
    format(str, sizeof(str), "So luong Pizza : %i", PizzaInfo[Pizza]);
    PizzaInfo[Label][1] = CreateDynamic3DTextLabel(str,COLOR_YELLOW,371.8031,-118.2270,1003.1337-1,30.0);
    return 1;
}