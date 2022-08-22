////===========================================///
////==Hostname Changer by Second / Geerdinho8==///
////===========================================///


#include <a_samp>


forward hostname();

public OnFilterScriptInit()
{
SetTimer("hostname",3000,1);//<<< You can change the ammount of time the hostname stays till it changes(1000 = 1 second)
return 1;
}


public hostname()
{
   new var = random(5); //If you want less or more messages you can change the random(5); for example to random(8); if you have 8 different messages but dont forget to edit the cases too!!   switch (var)
   switch (var)
   {
     case 0: SendRconCommand("hostname [ENG-SAMP] Kính Chào Quý Khách!");
     case 1: SendRconCommand("hostname [Group] ae-gtasamp.online");
     case 2: SendRconCommand("hostname [Update] Giáng Sinh.");
     case 3: SendRconCommand("hostname [Chu Sever] Frozen_Hung.");
     case 4: SendRconCommand("hostname [Refund] 7 Day Vip Gold + 250m + 10m Credits...v..v"); // if you edit the texts, dont remove "hostname", otherwise it wont work!!
     case 5: SendRconCommand("hostname [Update] Skin Custom. ");
   }}


