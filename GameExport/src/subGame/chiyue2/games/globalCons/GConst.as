package subGame.chiyue2.games.globalCons
{
   import flash.filters.BevelFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class GConst
   {
      
      public static var TEST_MORN:int = 1000;
      
      public static var VERSION:String = "20170727202155";
      
      public static var DEBUG:Boolean = false;
      
      public static var SHOW_FPS:Boolean = false;
      
      public static const SHOW_SESSION:Boolean = true;
      
      public static var GET_SUB_REVISION:Boolean = false;
      
      public static var showDownClient:Boolean = true;
      
      public static var BROWER:String;
      
      public static var FPS:int = 60;
      
      public static var ACTIVATE:Boolean = true;
      
      public static const TEXT_LINE_HEIGHT:int = 20;
      
      public static const NEIGONG_SHOW_LEVEL:int = 50;
      
      public static const ACTION_TIMES:int = 280;
      
      public static var ServerTimes:int;
      
      public static var LocalTimes:int;
      
      public static var GetServerTimes:int;
      
      public static var IS_OPEN_FCM:Boolean = false;
      
      public static var PCTimes:Number;
      
      public static var GAMETimes:Number;
      
      public static var IS_HUNDRED_MONTH:Boolean = false;
      
      public static var IS_THOUSAND_MONTH:Boolean = false;
      
      public static const SANBOX:Boolean = true;
      
      public static const SHOW_ERR_MSG:Boolean = false;
      
      public static const STARLING:Boolean = false;
      
      public static var STARLING_MAP:Boolean = false;
      
      public static var STARLING_AVATER:Boolean = false;
      
      public static const SCENE_POOL:Boolean = true;
      
      public static const STARLING_TEST:Boolean = false;
      
      public static const WORKER:Boolean = true;
      
      public static var UI_SIMPLIFIED:Boolean = false;
      
      public static const isDirResource:Boolean = true;
      
      public static var IS_ACHIEVEMENT_GET:Boolean = false;
      
      public static const SERVER_2015021:Boolean = true;
      
      public static const RESOURCES_LOADPNG:Boolean = true;
      
      public static var IS_BANSHU:Boolean = false;
      
      public static var IS_CLIENT:Boolean = false;
      
      public static var RESET:Boolean = false;
      
      public static var MYID:uint = 0;
      
      public static var MYJOB:int = 1;
      
      public static var PET_ID:uint = 0;
      
      public static var LOCK_TARGET_ID:uint = 0;
      
      public static var SELETE_TARGET_ID:uint = 0;
      
      public static var IS_XINMO_BABY_ALIVE:Boolean = false;
      
      public static var callMonsterItems:Array = [10114,10113];
      
      public static var myMemory:int;
      
      public static var RESETTIME:int;
      
      public static var showExecuter:Boolean;
      
      public static var AUCTION_OTHER:int = 100;
      
      public static const IMMORTAL_LEVEL:int = 12;
      
      public static const MENTAL_LEVEL:int = 50;
      
      public static var IS_FLY_ATTRIBUTE:Boolean = false;
      
      public static const NOT_CLOSE_OTHER:String = NOT_CLOSE_OTHER;
      
      public static var MYVIPLEVEL:int = 0;
      
      public static var MYROLEID:int = 0;
      
      public static var AutoFightEntnyId:int;
      
      public static var MYSCORE:int = 0;
      
      public static var USERNAME:String = "";
      
      public static var GONGCHENG:Boolean = false;
      
      public static var GAMESERVER:String = "";
      
      public static var AUTOROBOT:Boolean = false;
      
      public static const MY_POSITION:Point = new Point();
      
      public static var preLinkText:String = "";
      
      public static var helpPoint:Point = new Point();
      
      public static var SHOWSHADOW:Boolean = false;
      
      public static var IS_OPEN_IMMORTAL:Boolean = false;
      
      public static var IS_OPEN_STORE:Boolean = false;
      
      public static const ITEM_DARG_MOUSE:String = "itemDragMouse";
      
      public static const ITEM_SELL_MOUSE:String = "itemSellMouse";
      
      public static var ISCOLLECT:Boolean = false;
      
      public static var ISFUSE:Boolean = false;
      
      public static var ISGRAVITY:Boolean = false;
      
      public static var preSkillID:int = 0;
      
      public static var prePickID:uint = 0;
      
      public static var IsShachengBattleing:Boolean = false;
      
      public static var CANGET_SATURDAY_SALARY:Boolean = false;
      
      public static var CANGET_DAY_SALARY:Boolean = false;
      
      public static const ASTAR_MAX_GRID:int = 10000;
      
      public static var IS_WUDU:Boolean = false;
      
      public static var IS_JIEDUDAN:Boolean = false;
      
      public static const MONEY_TYPE_GOLD:int = 0;
      
      public static const MONEY_TYPE_BIND_GOLD:int = 1;
      
      public static const MONEY_TYPE_YUANBAO:int = 2;
      
      public static const MONEY_TYPE_BIND_YUANBAO:int = 3;
      
      public static const TREASURE_TYPE:int = 21;
      
      public static const PK_MODE_SAFE:int = 1;
      
      public static const TX_APP_ID_2:Number = 1105880654;
      
      public static const TX_APP_ID:Number = 1105381596;
      
      public static const TX_BLUE_ACTIVITY_ID:String = "UM16062311285899";
      
      public static var AUTO_USE_SHOW:Boolean = true;
      
      public static var server_time:int;
      
      public static const RING_HP:Array = [24,30,36,43,57];
      
      public static const FILTER_GRAY:Array = [new ColorMatrixFilter([0.2,0.3,0.3,0,0,0.3,0.2,0.3,0,0,0.3,0.3,0.2,0,0,0,0,0,1,0])];
      
      public static const FILTER_BLACK:Array = [new ColorMatrixFilter([0.2,0.1,0.1,0,0,0.1,0.2,0.1,0,0,0.1,0.1,0.2,0,0,0,0,0,1,0])];
      
      public static const FILTER_LIGHT:Array = [new ColorMatrixFilter([1,0,0,0,15,0,1,0,0,15,0,0,1,0,15,0,0,0,1,0])];
      
      public static const FILTER_GREEN:Array = [new ColorMatrixFilter([1,0,0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,1,0])];
      
      public static const FILTER_BLUE:Array = [new ColorMatrixFilter([1,0,0,0,0,0,2,0,0,0,1,1,1,0,0,0,0,0,1,0])];
      
      public static const FILTER_RED:Array = [new ColorMatrixFilter([2,0,0,0,-50,0,1,0,0,-50,0,0,1,0,-50,0,0,0,1,0])];
      
      public static const FILTER_MABI:Array = [new ColorMatrixFilter([0.299,0.587,0.114,0,0,0.299,0.587,0.114,0,0,0.299,0.587,0.114,0,0,0,0,0,1,0])];
      
      public static const FILTER_TEXT:Array = [new GlowFilter(0,1,2,2,3,2)];
      
      public static const FILTER_TITLE:Array = [new BevelFilter(6,90,16770245,1,13475144,1,4,4,2,4),new GlowFilter(0,1,2,2,3,2)];
      
      public static const TITLE_REPEAT_LIST:Array = [0,18,12,12,12,12,8,16,12,16,12];
      
      public static const AVATAR_TYPE_PLAYER:int = 0;
      
      public static const AVATAR_TYPE_MONSTER:int = 1;
      
      public static const AVATAR_TYPE_OBJECT:int = 2;
      
      public static const AVATAR_TYPE_HERO:int = 3;
      
      public static const AVATAR_TYPE_PORT:int = 7;
      
      public static const AVATAR_TYPE_EFFECT:int = 8;
      
      public static const AVATAR_TYPE_NPC:int = 9;
      
      public static var GETTIME:Number;
      
      public static var PASTTIME:Number;
      
      public static var stopNum:int = 0;
      
      public static var loadSceneIng:Boolean = false;
      
      public static var challengeState:Boolean = false;
      
      public static var challengeWatchState:Boolean = false;
      
      public static var changeScale:Boolean = false;
      
      public static var stageWidth:int = 0;
      
      public static var stageHeight:int = 0;
      
      public static var mapWidth:int = 0;
      
      public static var mapHeight:int = 0;
      
      public static const tileWidth:int = 256;
      
      public static const tileHeight:int = 256;
      
      public static const ITEM_GRID_WIDTH_1:int = 29;
      
      public static const ITEM_GRID_HEIGHT_1:int = 28;
      
      public static const ITEM_GRID_WIDTH_2:int = 53;
      
      public static const ITEM_GRID_HEIGHT_2:int = 55;
      
      public static const AUTO_TASK_LEVEL:int = 30;
      
      public static const AUTO_TASK_WAIT_TIME:int = 10000;
      
      public static const AUTO_NPC_CLICK_WAIT_TIME:int = 200;
      
      public static const TREASURE_NOTICE_SHOW_TIME:int = 300000;
      
      public static const DOUBLE_CLICK_SENSITIVE_TIME:int = 250;
      
      public static const REVISION_TYPE_AVATAR:String = "avatar";
      
      public static const REVISION_TYPE_SCENE:String = "scene";
      
      public static const STARLING_AS_2D_DEAL:int = -2;
      
      public static const OTHER_SPRITE_ID:int = 1;
      
      public static const MOUSE_STARLING_ID:int = 2;
      
      public static var IS_FANS:int;
      
      public static var GItem:Dictionary;
      
      public static var IS_AUTO_DRAGON_EAT:Boolean = false;
      
      public static const WINDOW_MODULE_ROLE:int = 1;
      
      public static const WINDOW_MODULE_BAG:int = 2;
      
      public static const WINDOW_MODULE_SKILL:int = 3;
      
      public static const WINDOW_MODULE_FRIEND:int = 4;
      
      public static const WINDOW_MODULE_TEAM:int = 5;
      
      public static const WINDOW_MODULE_FACTION:int = 6;
      
      public static const WINDOW_MODULE_RANK:int = 7;
      
      public static const WINDOW_MODULE_ACHI:int = 8;
      
      public static const WINDOW_MODULE_SHENLU:int = 9;
      
      public static const WINDOW_MODULE_SHOP:int = 10;
      
      public static const WINDOW_MODULE_CHECK_IN:int = 11;
      
      public static const WINDOW_MODULE_MAP:int = 12;
      
      public static const WINDOW_MODULE_ASSIST:int = 13;
      
      public static const WINDOW_MODULE_FLYEXCHANGE:int = 14;
      
      public static const WINDOW_MODULE_EMAIL:int = 15;
      
      public static const WINDOW_MODULE_STRATEGY:int = 16;
      
      public static const WINDOW_MODULE_QUICK_BUY:int = 17;
      
      public static const WINDOW_MODULE_TANWEI:int = 18;
      
      public static const WINDOW_MODULE_TANWEI_DIARY:int = 19;
      
      public static const WINDOW_MODULE_TANWEI_SALE:int = 20;
      
      public static const WINDOW_MODULE_TANWEI_ITEM_TYPE:int = 21;
      
      public static const WINDOW_MODULE_CHECH_PLAYER:int = 22;
      
      public static const WINDOW_MODULE_SALES:int = 23;
      
      public static const WINDOW_MODULE_NPC_STORE:int = 24;
      
      public static const WINDOW_MODULE_NPC_TRANSE:int = 25;
      
      public static const WINDOW_MODULE_VIP:int = 26;
      
      public static const WINDOW_MODULE_NEWLOGIN:int = 27;
      
      public static const WINDOW_MODULE_TREASURE_BAG:int = 28;
      
      public static const WINDOW_MODULE_COLLECT:int = 29;
      
      public static const WINDOW_MODULE_CALLHERO:int = 30;
      
      public static const WINDOW_MODULE_GM:int = 31;
      
      public static const WINDOW_MODULE_PRIVATECHAT:int = 32;
      
      public static const WINDOW_MODULE_LOGIN_REWARD:int = 33;
      
      public static const WINDOW_MODULE_HANGUP:int = 34;
      
      public static const WINDOW_MODULE_CROSSBATTLE:int = 35;
      
      public static const WINDOW_MODULE_ARENA:int = 36;
      
      public static const WINDOW_MODULE_DIGTREASURE:int = 37;
      
      public static const WINDOW_MODULE_DIGTREASURE_REWARD:int = 38;
      
      public static const WINDOW_MODULE_EXCHANGELINGLI:int = 39;
      
      public static const WINDOW_MODULE_CROSSBAG:int = 40;
      
      public static const WINDOW_MODULE_HORSE:int = 41;
      
      public static const WINDOW_MODULE_MAP_BOSSGET:int = 42;
      
      public static const WINDOW_MODULE_COPYPASS:int = 43;
      
      public static const WINDOW_MODULE_MINING:int = 44;
      
      public static const WINDOW_MODULE_MYSTERY:int = 45;
      
      public static const WINDOW_MODULE_COMPOUND:int = 46;
      
      public static const WINDOW_MODULE_TEAMCOPY:int = 47;
      
      public static const WINDOW_MODULE_CHALLENGE:int = 48;
      
      public static const WINDOW_MODULE_DIG:int = 49;
      
      public static const WINDOW_MODULE_ACTIVITY:int = 50;
      
      public static const WINDOW_MODULE_OPENGIFT:int = 51;
      
      public static const WINDOW_MODULE_HEROBOX:int = 52;
      
      public static const WINDOW_MODULE_DAYSACTIVITY:int = 53;
      
      public static const WINDOW_MODULE_BOSS:int = 54;
      
      public static const WINDOW_MODULE_HERO2:int = 55;
      
      public static const WINDOW_MODULE_CHECK_HERO2:int = 56;
      
      public static const WINDOW_MODULE_EXCHANGE_ACHIEVE:int = 57;
      
      public static const WINDOW_MODULE_TRADE:int = 58;
      
      public static const WINDOW_MODULE_FIGHT_CITY_SALARY:int = 59;
      
      public static const WINDOW_MODULE_NPC_TALK:int = 60;
      
      public static const WINDOW_MODULE_DRAGONBALL:int = 61;
      
      public static const WINDOW_MODULE_AUCTION:int = 62;
      
      public static const WINDOW_MODULE_FC_DAILY_SALARY:int = 63;
      
      public static const WINDOW_MODULE_INLAY:int = 64;
      
      public static const WINDOW_MODULE_PAY:int = 65;
      
      public static const WINDOW_MODULE_DAY7:int = 66;
      
      public static const WINDOW_MODULE_SECONDPASS:int = 67;
      
      public static const WINDOW_MODULE_DAILYTASK:int = 68;
      
      public static const WINDOW_MODULE_INVESTMENT:int = 69;
      
      public static const WINDOW_MODULE_ELIXIR:int = 70;
      
      public static const WINDOW_MODULE_COPYGAMEEND:int = 71;
      
      public static const WINDOW_MODULE_LUCKWHEEL:int = 72;
      
      public static const WINDOW_MODULE_MOONRABBIT:int = 73;
      
      public static const WINDOW_MODULE_EXPGAME:int = 74;
      
      public static const WINDOW_MODULE_ADDFRIEND:int = 75;
      
      public static const WINDOW_MODULE_RECOMMANDFRIEND:int = 76;
      
      public static const WINDOW_MODULE_FRIENDWELFARE:int = 77;
      
      public static const WINDOW_MODULE_FIGHT_CITY:int = 78;
      
      public static const WINDOW_MODULE_YELLOW_GIFT:int = 79;
      
      public static const WINDOW_MODULE_SEAL_MONSTER:int = 80;
      
      public static const WINDOW_MODULE_IDENTIFY_XINMO:int = 81;
      
      public static const WINDOW_MODULE_MYSTICAL:int = 82;
      
      public static const WINDOW_MODULE_BLUE_RIGHT:int = 83;
      
      public static const WINDOW_MODULE_BLUE_REPAY:int = 84;
      
      public static const WINDOW_MODULE_QQ_LOTTERY:int = 85;
      
      public static const WINDOW_MODULE_ACTIVITY_OPEN:int = 101;
      
      public static const WINDOW_MODULE_FCM:int = 110;
      
      public static const WINDOW_MODULE_MININGNPC:int = 111;
      
      public static const WINDOW_MODULE_CHARGE_DART:int = 112;
      
      public static const WINDOW_MODULE_COMMIT_CHARGE_DART:int = 113;
      
      public static const WINDOW_MODULE_APOTHEOSIZE_CALL:int = 114;
      
      public static const WINDOW_MODULE_PERSONAL_BOSS:int = 115;
      
      public static const WINDOW_MODULE_APOTHEOSIZE_CHALLENGE:int = 116;
      
      public static const WINDOW_MODULE_APOTHEOSIZE_HARVEST:int = 117;
      
      public static const WINDOW_MODULE_APOTHEOSIZE_HARVEST2:int = 118;
      
      public static const WINDOW_MODULE_HEROALTAR_CHALLENGE:int = 119;
      
      public static const WINDOW_MODULE_CRYSTALTHIEF_CHALLENGE:int = 120;
      
      public static const WINDOW_MODULE_CRYSTALTHIEF_HARVEST:int = 121;
      
      public static const WINDOW_MODULE_FINALCARD_EXCHANGE:int = 122;
      
      public static const WINDOW_MODULE_DAEMON:int = 123;
      
      public static const WINDOW_MODULE_CHARGE:int = 124;
      
      public static const WINDOW_MODULE_BOOK_EXCHANGE:int = 125;
      
      public static const WINDOW_SEND_HORN:int = 126;
      
      public static const WINDOW_FRIEND_SET:int = 127;
      
      public static const WINDOW_MODULE_PKGUIDE:int = 128;
      
      public static const WINDOW_MODULE_OBTAINCHANNEL:int = 129;
      
      public static const WINDOW_MODULE_BAGLEFT:int = 130;
      
      public static const WINDOW_MODULE_SPECIALGIFT:int = 131;
      
      public static const WINDOW_MODULE_LOGIN:int = 132;
      
      public static const WINDOW_MODULE_SKILL_WINDOW:int = 133;
      
      public static const WINDOW_MODULE_FIRSTCHARGE_WINDOW:int = 134;
      
      public static const WINDOW_MODULE_DARWINSTATISTICS_WINDOW:int = 135;
      
      public static const WINDOW_MODULE_FUMOENTER:int = 136;
      
      public static const WINDOW_MODULE_SIMPLE_ICON:int = 137;
      
      public static const WINDOW_MODULE_EXPFINERY:int = 138;
      
      public static const WINDOW_MODULE_BESTVIP:int = 139;
      
      public static const WINDOW_MODULE_PET:int = 140;
      
      public static const WINDOW_MODULE_SUPER_BOX:int = 142;
      
      public static const WINDOW_MODULE_DAILY_AUTO_SET:int = 145;
      
      public static const WINDOW_MODULE_LEVELUP:int = 146;
      
      public static const WINDOW_MODULE_HOSTING:int = 147;
      
      public static const WINDOW_MODULE_NREWARDWINDOWS:int = 148;
      
      public static const WINDOW_MODULE_NEWHANDHELP:int = 149;
      
      public static const WINDOW_MODULE_LIVENESS:int = 150;
      
      public static const WINDOW_MODULE_COMBINE:int = 151;
      
      public static const WINDOW_MODULE_MONEYTREE:int = 152;
      
      public static const WINDOW_MODULE_TX_PAY:int = 153;
      
      public static const WINDOW_MODULE_COMPARISON:int = 154;
      
      public static const WINDOW_MODULE_OPENTEST:int = 155;
      
      public static const WINDOW_MODULE_SD_SUPER:int = 156;
      
      public static const WINDOW_MODULE_SD_HALL:int = 157;
      
      public static const WINDOW_MODULE_SWJOYSUPER:int = 158;
      
      public static const WINDOW_MODULE_SWJOYMEMBER:int = 159;
      
      public static const WINDOW_MODULE_HALL:int = 160;
      
      public static const WINDOW_MODULE_SKIN:int = 161;
      
      public static const WINDOW_MODULE_SUPER_VIP:int = 162;
      
      public static const WINDOW_MODULE_WEEKEND:int = 163;
      
      public static const WINDOW_MODULE_HUNDREDSERVER:int = 164;
      
      public static const WINDOW_MODULE_FIFTY_FIVE:int = 165;
      
      public static const WINDOW_MODULE_SUPER_GOLD_CARD:int = 166;
      
      public static const WINDOW_MODULE_XUNLEI_VIP:int = 168;
      
      public static const WINDOW_MODULE_XUNLEI_SHOUJI:int = 167;
      
      public static const WINDOW_MODULE_9377:int = 169;
      
      public static const WINDOW_MODULE_OPENTEST_TX:int = 170;
      
      public static const WINDOW_MODULE_WING:int = 171;
      
      public static const WINDOW_MODULE_INVESTMENT_BOX:int = 172;
      
      public static const WINDOW_MODULE_SUPERINVEST:int = 173;
      
      public static const WINDOW_MODULE_SUPERINVEST_BOX:int = 174;
      
      public static const WINDOW_MODULE_SUPER_9377:int = 175;
      
      public static const WINDOW_MODULE_PLATFORM_360:int = 176;
      
      public static const WINDOW_MODULE_PLATFORM_360VIP:int = 177;
      
      public static const WINDOW_MODULE_TANWAN_VIP:int = 178;
      
      public static const WINDOW_MODULE_DAY7_CRAZY:int = 179;
      
      public static const WINDOW_MODULE_QIANG1215:int = 180;
      
      public static const WINDOW_MODULE_QQZONE:int = 182;
      
      public static const WINDOW_MODULE_QQHALL:int = 181;
      
      public static const WINDOW_MODULE_CHECK_PET:int = 183;
      
      public static const WINDOW_MODULE_SAODANG_WINDOW:int = 184;
      
      public static const WINDOW_MODULE_QQBOX:int = 185;
      
      public static const WINDOW_MODULE_QQTGB:int = 186;
      
      public static const WINDOW_MODULE_QQEXPLORER:int = 187;
      
      public static const WINDOW_MODULE_OPENFIGHTBOX:int = 188;
      
      public static const WINDOW_MODULE_OFFICIAL:int = 189;
      
      public static const WINDOW_MODULE_VIPBOSS:int = 190;
      
      public static const WINDOW_MODULE_MONOPOLY:int = 191;
      
      public static const WINDOW_MODULE_MONTH:int = 192;
      
      public static const WINDOW_MODULE_V360:int = 194;
      
      public static const WINDOW_MODULE_SKILL2:int = 195;
      
      public static const WINDOW_MODULE_SYNTHESIS:int = 197;
      
      public static const WINDOW_MODULE_FIRST_CHARGE:int = 196;
      
      public static const WINDOW_MODULE_LEVEL_GIFT:int = 198;
      
      public static const WINDOW_MODULE_PHONE_9377:int = 200;
      
      public static const WINDOW_MODULE_CROSS_LEAGUE:int = 201;
      
      public static const WINDOW_MODULE_LONGWANG_OTHER:int = 202;
      
      public static const WINDOW_MODULE_THOUSAND:int = 203;
      
      public static const WINDOW_MODULE_PREVIEW:int = 205;
      
      public static const WINDOW_MODULE_LUCK_ROULETTE:int = 206;
      
      public static const WINDOW_MODULE_MOUNT:int = 207;
      
      public static const WINDOW_MODULE_MARRY_PROPOSAL:int = 208;
      
      public static const WINDOW_MODULE_MARRY:int = 209;
      
      public static const WINDOW_MODULE_COUPLE:int = 210;
      
      public static const WINDOW_MODULE_FIGHTCITY_CROSS:int = 211;
      
      public static const WINDOW_MODULE_MOUNT_SKIN:int = 212;
      
      public static const WINDOW_MODULE_ELEVEN:int = 213;
      
      public static const WINDOW_MODULE_MOUNT_OTHER:int = 214;
      
      public static const WINDOW_MODULE_FACTION_SALARY:int = 215;
      
      public static const WINDOW_MODULE_GLORY:int = 216;
      
      public static const WINDOW_MODULE_CHRISMAS:int = 217;
      
      public static const WINDOW_MODULE_SPRING:int = 218;
      
      public static const WINDOW_MODULE_5399:int = 219;
      
      public static const WINDOW_MODULE_5399VIP:int = 228;
      
      public static const WINDOW_MODULE_LUCK_ROULETTE_NY:int = 220;
      
      public static const WINDOW_MODULE_TOWER:int = 221;
      
      public static const WINDOW_MODULE_PHONE_ASSIST:int = 222;
      
      public static const WINDOW_MODULE_BELLE:int = 223;
      
      public static const WINDOW_MODULE_YUANXIAO:int = 224;
      
      public static const WINDOW_MODULE_WEAPON_GIFT:int = 225;
      
      public static const WINDOW_MODULE_REDBAG_GIFT:int = 226;
      
      public static const WINDOW_MODULE_TOTEM:int = 227;
      
      public static const WINDOW_MODULE_LIANCHONG:int = 229;
      
      public static const WINDOW_MODULE_YUREN:int = 230;
      
      public static const WINDOW_MODULE_DAY3_CRAZY:int = 231;
      
      public static const WINDOW_MODULE_RUNE:int = 232;
      
      public static const WINDOW_MODULE_MAY:int = 233;
      
      public static const WINDOW_MODULE_WING_SKIN:int = 234;
      
      public static const WINDOW_MODULE_MONSTER_SCORE:int = 235;
      
      public static const WINDOW_MODULE_OPMAGICAL:int = 236;
      
      public static const WINDOW_MODULE_NLREWARD:int = 237;
      
      public static const WINDOW_MODULE_CHARGE_CODE:int = 238;
      
      public static const WINDOW_MODULE_CROSS_MATCHING:int = 239;
      
      public static const WINDOW_MODULE_CROSS_3V3:int = 240;
      
      public static const WINDOW_MODULE_CROSS_3V3RESULT:int = 241;
      
      public static const WINDOW_MODULE_ANNIVERSARY:int = 242;
      
      public static const WINDOW_MODULE_ILLUSION:int = 243;
      
      public static const WINDOW_MODULE_DIG_CONFIRM:int = 244;
      
      public static const WINDOW_MODULE_SAFE_GIFT:int = 245;
      
      public static const WINDOW_MODULE_YOUXUN:int = 246;
      
      public static const WINDOW_MODULE_CROSS_3V3_SHOP:int = 247;
      
      public static const WINDOW_MODULE_CROSS_MEDAL:int = 248;
      
      public static const WINDOW_MODULE_SUMMER:int = 249;
      
      public static const WINDOW_MODULE_REDPACKET:int = 250;
      
      public static const WINDOW_MODULE_LUCKY_DIAMOND:int = 251;
      
      public static const WINDOW_MODULE_HIDE_TASK:int = 252;
      
      public static const WINDOW_MODULE_ENTERY_TWO:int = 253;
      
      public static const WINDOW_MODULE_SUMMER2:int = 254;
      
      public static const WINDOW_MODULE_SUMMER3:int = 255;
      
      public static const WINDOW_MODULE_TIMELIMITTASK:int = 256;
      
      public static const WINDOW_MODULE_SUMMER4:int = 257;
      
      public static const WINDOW_MODULE_LOG:int = 999;
      
      public static const WINDOW_SIMPLE_UI:int = 1000;
      
      public static const WINDOW_CLOSE_COORDS:Array = [];
      
      public static const ITEM_EQUIP_INDEX_MAP:Array = ["-1","0","1","-1","9","10","6","13","7","11","15","4|5","2|3","8","14","17","14","-1","-1","18","-1","21","-1","-1","24","-1","26","27","-1","29","-1","-1","-1","-1","-1","-1","36","37","38","-1","-1","41","42","43","44","45","46"];
      
      public static const ITEM_EQUIP_GEM_INDEX_MAP:Array = [5,6,2,7,3,8,9,4,0,1];
      
      public static const EQUIP_TYPE_MAP:Array = ["","","武器","衣服","头盔","戒指","手镯","项链","","腰带","靴子"];
      
      public static const FORGE_EQUIP_PAGE_SHOW:int = 7;
      
      public static const SPECIAL_EQUIP_PAGE_SHOW:int = 6;
      
      public static const SPECIAL_BLOOD_STONE_PAGE_SHOW:int = 6;
      
      public static const SPECIAL_RING_PAGE_SHOW:int = 6;
      
      public static const TAOZHUANG_INDEX:Array = [1,2,4,6,8,11,12,13];
      
      public static var SpecialEquipType:Array = [5,9,19,13,1,11,12,2,6,8,7,15,21];
      
      public static const PILL_QUANLITY_SUIT:Array = [2,4,8,16];
      
      public static const SKILL_QUICK_KEY:Array = ["1","2","3","4","5","Q","W","E","S","F"];
      
      public static const ITEM_CLASS_ITEM:int = 0;
      
      public static const ITEM_HEAD_INDEX:int = 0;
      
      public static const ITEM_SKILL_BOOK:int = 1;
      
      public static const ITEM_SHOUZHUO_INDEX:int = 2;
      
      public static const ITEM_SHOUZHUO2_INDEX:int = 3;
      
      public static const ITEM_FAJIE_INDEX:int = 5;
      
      public static const ITEM_YAODAI_INDEX:int = 6;
      
      public static const ITEM_WEAPON_INDEX:int = 8;
      
      public static const ITEM_CLOTHES_INDEX:int = 9;
      
      public static const ITEM_DUN_INDEX:int = 11;
      
      public static const ITEM_SHENWU_INDEX:int = 14;
      
      public static const ITEM_HUANMO_INDEX:int = 15;
      
      public static const ITEM_FABAO_INDEX:int = 17;
      
      public static const ITEM_MOUNT_INDEX_START:int = 24;
      
      public static const ITEM_MOUNT_WIND:int = 25;
      
      public static const ITEM_MOUNT_INDEX_END:int = 27;
      
      public static const ITEM_HUFU_INDEX:int = 36;
      
      public static const ITEM_VIP_EQUIP_INDEX:int = 38;
      
      public static const ITEM_MOUNT_ARTIFICE_START:int = 120000;
      
      public static const ITEM_MOUNT_ARTIFICE_END:int = 121000;
      
      public static const ITEM_HORSE_ADD_PER:int = 19011;
      
      public static var INIT_PAIR_HORSE_COUNT:Boolean = false;
      
      public static const ITEM_MOUNT_TYPE_START:int = 24;
      
      public static const ITEM_MOUNT_TYPE_END:int = 27;
      
      public static const ITEM_XINMO_SUBCLASS_START:int = 28;
      
      public static const ITEM_XINMO_SUBCLASS_END:int = 31;
      
      public static const ELIXIR_METERIAL_LIST:Array = [19008,19009];
      
      public static const ELIXIR_METERIAL_COUNT_LIST:Array = [2,1];
      
      public static const PILLS_START:int = 140001;
      
      public static const PILLS_END:int = 140008;
      
      public static const EVIL_ITEM_ID:int = 10827;
      
      public static var NO_BLOOD_FLY:Boolean = false;
      
      public static var NO_DROP_ITEM:Boolean = false;
      
      public static var NO_COPY_MAINTASK:Boolean = false;
      
      public static var CAN_MINING:Boolean = false;
      
      public static var isFirstDay7Crazy:Boolean = true;
      
      public static var BABY_EFFECT:Boolean = false;
      
      public static const mBossStyle:Array = [35006,35016,35026,35036,35045,35057,35070,35077,35086,35096,35062,35056,35076,35084];
      
      public static const mBossMap:Array = [77,117,116,115,104,84];
      
      public static const mNewPlayerMap:Array = [181,182,183,22,1,8,10];
      
      public static const TEAM_POS_COLOR:String = "#00FFFF";
      
      public static const MUTEX_VIEW:Array = [[1,9]];
      
      public static const ARR_MEDICINE_ENTRY:Array = [10037,10038,10039];
      
      public static var skillQuickPos:Array = [];
      
      public static var skillQuickMap:Array = [0,1,2,3,6,7,8,9,11,-1,10,-1,-1,-1,-1,5,-1,-1,4];
      
      public static const FONT_NUMBER:Array = ["零","一","二","三","四","五","六","七","八","九","十"];
      
      public static var compountTypeList:Array = [];
      
      public static var KEY_DOWN_CODE_KEY:Array = [];
      
      public static const LOG_KEY:Array = [88,73,65,79,74,73,65,105,99,103,103,90,76,13];
      
      public static const BUFFTYPE_FLYUP:int = 30;
      
      public static const DRAG_FROM_SKILL:String = "skill";
      
      public static const DRAG_FROM_QUICK:String = "quick";
      
      public static const DRAG_FROM_BAG:String = "bag";
      
      public static const DRAG_FROM_ROLE:String = "role";
      
      public static const DRAG_FROM_FS:String = "fs";
      
      public static const DRAG_FROM_STORE:String = "store";
      
      public static const DRAG_FROM_DEAL:String = "deal";
      
      public static const DRAG_FROM_DAEMON:String = "daemon_equip";
      
      public static const DRAG_TO_PITCH:String = "pitch";
      
      public static const DRAG_TO_MOUNT_ARTIFICE:String = "mount_artifice";
      
      public static const DRAG_TO_MOUNT_EQUIP:String = "mount_equip";
      
      public static const DRAG_TO_HAIR:String = "personal_hair";
      
      public static const DRAG_TO_RING:String = "personal_ring";
      
      public static const DRAG_IMMORTAL_EQUIP:String = "immortal_equip";
      
      public static const DRAG_DIG_STORAGE:String = "dig_storage";
      
      public static const DRAG_TO_STOVE:String = "to_stove";
      
      public static const DRAG_FROM_MYBAG:String = "from_mybag";
      
      public static const DRAG_FROM_FACTION_STORAGE:String = "from_faction_storage";
      
      public static var PET_ATTACK:int = 1;
      
      public static var PET_UPGRADE_RET:int = 0;
      
      public static var DEFAULT_MOVE_ACTION:int = 2;
      
      public static var MOVE_USETIME:int = 560;
      
      public static var PHYSIC_ATTACK_USETIME:int = 650;
      
      public static var DELETE_FLY_TIME:int = 60000;
      
      public static const FRAME_RATE_THRESHOLD:int = 30;
      
      public static const FRAME_SHOW_FLY:int = 30;
      
      public static const AUTO_USE_TIME:int = 15000;
      
      public static var isAutoPick:Boolean = false;
      
      public static var isAutoFight:Boolean = false;
      
      public static var isAutoFindPath:Boolean = false;
      
      public static var isAutoFindPathTimes:int = 0;
      
      public static var isShowCorpse:Boolean = true;
      
      public static var isShowBug:Boolean;
      
      public static const SKILLID_CURE:int = 19;
      
      public static const SKILLID_SHIELD:int = 31;
      
      public static const SKILLID_DEF:int = 197;
      
      public static const SKILLID_DU:int = 192;
      
      public static const SKILLID_SINSOU:int = 194;
      
      public static const SKILLID_FIREHIT:int = 26;
      
      public static const SKILLID_CHOP:int = 81;
      
      public static const SKILLID_CISHA:int = 12;
      
      public static const SKILLID_HUO:int = 22;
      
      public static const SKILLID_CHONGFENG:int = 27;
      
      public static const SKILLID_KONGZHI:int = 305;
      
      public static const SKILLID_TOUZHI:int = 300;
      
      public static const SKILLID_WULI:int = 37;
      
      public static const SKILLID_BAZHE:int = 370;
      
      public static const SKILLID_REVIVE:int = 380;
      
      public static const SKILLID_ZHIZUN:int = 600;
      
      public static const SKILLID_ZHIZUN_WEAPON_CLOTH:int = 601;
      
      public static const CD_ITEM_CONST:int = 450;
      
      public static var CD_TRANSROCK_CONST:int = 0;
      
      public static const HAND_INDEX_AUTO_FIRE:int = 7;
      
      public static var IS_SALE_KEY:int = 1;
      
      public static var ISPICTH_ITEM_SUC_KEY:int = 2;
      
      public static var ISPICTH_KEY:int = 3;
      
      public static var IS_MOUNT_ARTIFICE_KEY:int = 4;
      
      public static var IS_STOVE_KEY:int = 5;
      
      public static var ISDEALING_KEY:int = 6;
      
      public static var IS_RUNE_KEY:int = 7;
      
      public static var IS_RUNE_EQUIP:int = 8;
      
      public static var IS_SMELT_KEY:int = 20;
      
      public static var arrow;
      
      public static var NEW_LINE:String = "\n";
      
      public static const BLUE:uint = 38863;
      
      public static const ORANGE:uint = 15762176;
      
      public static const GREEN:uint = 969733;
      
      public static const PURPLE:uint = 8931224;
      
      public static const RED:uint = 16647680;
      
      public static const KHAKI:uint = 16432640;
      
      public static const SILVER:uint = 12765885;
      
      public static const OCEANBLUE:uint = 26316;
      
      public static const CONTAINER_ID_EQUIP:int = 0;
      
      public static const CONTAINER_ID_PACK:int = 1;
      
      public static const CONTAINER_ID_STORE:int = 2;
      
      public static const CONTAINER_ID_TREASURE_PACK:int = 3;
      
      public static const CONTAINER_ID_GUILD_STORE:int = 4;
      
      public static const CONTAINER_ID_OTHER:int = 5;
      
      public static const CONTAINER_ID_REWARD:int = 6;
      
      public static const CONTAINER_ID_HERO:int = 7;
      
      public static const CONTAINER_ID_QUICKSELL:int = 8;
      
      public static const CONTAINER_ID_COMPOUND:int = 9;
      
      public static const CONTAINER_ID_MOUNT_COMPOUND:int = 10;
      
      public static const CONTAINER_ID_XINMO:int = 12;
      
      public static const CONTAINER_ID_HORSE_PACK:int = 13;
      
      public static const CONTAINER_ID_EXPACK:int = 14;
      
      public static const CONTAINER_ID_SEAL_MONSTER:int = 15;
      
      public static const CONTAINER_ID_SEAL_MONSTER_EQUIP:int = 16;
      
      public static const CONTAINER_ID_HAIR:int = 17;
      
      public static const CONTAINER_ID_OTHER_EQUIP:int = 18;
      
      public static const CONTAINER_ID_MYSTERY:int = 19;
      
      public static const CONTAINER_ID_DAEMON:int = 20;
      
      public static const CONTAINER_ID_EQUIP2:int = 21;
      
      public static const CONTAINER_ID_SOLDIER_EQUIP:int = 22;
      
      public static const CONTAINER_ID_DIAMON:int = 23;
      
      public static const CONTAINER_ID_MOUNT:int = 24;
      
      public static const CONTAINER_ID_WING:int = 25;
      
      public static const CONTAINER_ID_RUNE:int = 26;
      
      public static const CONTAINER_ID_DRAGON_BALL:int = 26;
      
      public static const POS_MENU_HEIGHT:int = 145;
      
      public static const POS_RADA_HEIGHT:int = 265;
      
      public static const POS_ACTIVITY_RIGHT:int = 226;
      
      public static const POS_BUFFER:Point = new Point(87,100);
      
      public static const POS_WIN_ROLE_X:int = 20;
      
      public static const POS_WIN_BAG_RIGHT:int = 310;
      
      public static const POS_WIN_DIG_TREASURE_RIGHT:int = 250;
      
      public static const POS_CHECK_EQUIP_RIGHT:int = 100;
      
      public static var blendMode:String = "add";
      
      public static var testBlend:Boolean = true;
      
      public static const PACK_OPEN_INIT:int = 0;
      
      public static const PACK_OPEN_SALE:int = 1;
      
      public static const PACK_TOTAL_PAGE:int = 2;
      
      public static const INVENTORY_TYPE_HEAD:int = 1;
      
      public static const INVENTORY_TYPE_MARRY_RING:int = 14;
      
      public static const INVENTORY_TYPE_CLOAK:int = 16;
      
      public static const INVENTORY_TYPE_TABRAD:int = 19;
      
      public static const INVENTORY_TYPE_HEROEQUIP:int = 23;
      
      public static const INVENTORY_TYPE_HAIR:int = 32;
      
      public static const INVENTORY_TYPE_RING:int = 33;
      
      public static const INVENTORY_TYPE_SOLDIER_1:int = 49;
      
      public static const INVENTORY_TYPE_SOLDIER_2:int = 50;
      
      public static const INVENTORY_TYPE_SOLDIER_3:int = 51;
      
      public static const INVENTORY_TYPE_SOLDIER_4:int = 52;
      
      public static const INVENTORY_TYPE_SOLDIER_5:int = 53;
      
      public static const INVENTORY_TYPE_SOLDIER_6:int = 54;
      
      public static const INVENTORY_TYPE_SOLDIER_7:int = 81;
      
      public static const INVENTORY_TYPE_WING_1:int = 97;
      
      public static const INVENTORY_TYPE_WING_2:int = 98;
      
      public static const INVENTORY_TYPE_WING_3:int = 99;
      
      public static const INVENTORY_TYPE_WING_4:int = 100;
      
      public static const INVENTORY_TYPE_MOUNT_1:int = 55;
      
      public static const INVENTORY_TYPE_MOUNT_2:int = 56;
      
      public static const INVENTORY_TYPE_MOUNT_3:int = 57;
      
      public static const INVENTORY_TYPE_MOUNT_4:int = 58;
      
      public static const INVENTORY_TYPE_MOUNT_5:int = 59;
      
      public static const NO_PACK_GRID:String = "NO_PACK_GRID";
      
      public static const PACK_PAGE_GRID_NUM:int = 96;
      
      public static const STORE_PAGE_GRID_NUM:int = 56;
      
      public static const VIP_OPEN_GRID:Array = [undefined,8,24,56];
      
      public static const VIP_FONT:String = "VIP ";
      
      public static var ISSAFEMAP:Boolean = false;
      
      public static var ISSAFE:Boolean = false;
      
      public static var ISCROSSSERVER:Boolean = false;
      
      public static var IS_NOHORSE_MAP:Boolean = true;
      
      public static var IS_CAN_FIXED_POINT:Boolean = true;
      
      public static var HERO_STATE_DEL:int = -1;
      
      public static var HERO_STATE_REST:int = 0;
      
      public static var HERO_STATE_FIGHT:int = 1;
      
      public static var HERO_STATE_DEATH:int = 2;
      
      public static var IS_BASEUI_DONE:Boolean = false;
      
      public static var MAINUI_COMPOUND_COUNT:int = 0;
      
      public static var PK_MODE:int = 0;
      
      public static const PK_MODE_COLORS:Array = [];
      
      public static const SO_CHATUSERHISTORY:String = "SO_CHATUSERHISTORY";
      
      public static var CHAT_FONT:String = "simsun";
      
      public static const CHAT_APPENDINFOS:String = "CHAT_APPENDINFOS";
      
      public static const CHAT_OPEN_CHATWINDOW:String = "CHAT_OPEN_CHATWINDOW";
      
      public static const CHAT_SHOW_CHATICON:String = "CHAT_SHOW_CHATICON";
      
      public static const FRIEND_REQSTRANGERLIST:String = "FRIEND_REQSTRANGERLIST";
      
      public static const FRIEND_APPLICANTLIST:String = "FRIEND_APPLICANTLIST";
      
      public static const FRIEND_LIST_REFRESH:String = "FRIEND_LIST_FRESH";
      
      public static const SHOW_TIANJIANG_SALARY:String = "SHOW_TIANJIANG_SALARY";
      
      public static const SHOW_SHENWEI:String = "SHOW_SHENWEI";
      
      public static const SHOW_FIRST_PAY:String = "SHOW_FIRST_PAY";
      
      public static const SHOW_TIANJIANG_SALARY_NEW:String = "SHOW_TIANJIANG_SALARY_NEW";
      
      public static const SHOW_SHENWEI_NEW:String = "SHOW_SHENWEI_NEW";
      
      public static const FLY_NUMBER_TEX:String = "FLY_NUMBER_TEX";
      
      public static const NUMBER_TEX:String = "NUMBER_TEX";
      
      public static const ARENA_OPEN:String = "ARENA_OPEN";
      
      public static var IS_MOUSE_IN_CHAT:Boolean = false;
      
      public static var IS_SHOW_EQUIPE_TIPS:Boolean = true;
      
      public static var IS_PET_EQUIP_GUIDE:Boolean = false;
      
      public static const RECTANGLE_SHABAK:Rectangle = new Rectangle(0,0,125,150);
      
      public static const MONSTER_SHABAK_CITYWALY:Array = [35100,35101,35102,35103,35104,35105,35106,35107];
      
      public static const MONSTER_SHABAK_PALACEWALY:Array = [35106,35107];
      
      public static const MONSTER_SHABAK_WALL1:Array = [35100,35101];
      
      public static const MONSTER_SHABAK_WALL2:Array = [35102,35103];
      
      public static const MONSTER_SHABAK_WALL3:Array = [35104,35105];
      
      public static const MONSTER_NPC:Array = [35181,35179];
      
      public static const VIP_BUFF_FROM:int = 470;
      
      public static const VIP_BUFF_TO:int = 484;
      
      public static const COPY_BUFF_ICON:int = 142;
      
      public static const COPY_BUFF_FROM:int = 500;
      
      public static const COPY_BUFF_TO:int = 520;
      
      public static const DING_BUFF_FROM:int = 800;
      
      public static const DING_BUFF_TO:int = 815;
      
      public static const DING_BUFF_FROM2:int = 816;
      
      public static const DING_BUFF_TO2:int = 831;
      
      public static const DING_BUFF_FROM3:int = 832;
      
      public static const DING_BUFF_TO3:int = 847;
      
      public static const BUFF_900:int = 900;
      
      public static const XINFA_FROM:int = 900;
      
      public static const XINFA_TO:int = 949;
      
      public static const FACTION_BUFF_FROM:int = 1001;
      
      public static const FACTION_BUFF_TO:int = 1024;
      
      public static const SOURCE_TAB_OPEN:Array = ["0","90","0"];
      
      public static const CARD_CLASS_FROM:int = 21;
      
      public static const CARD_NO_CHECK_CLASS:int = 32;
      
      public static const CARD_MAP_NAME_LIST:Array = ["机关洞穴","牛魔祭坛","楼兰荒漠","死亡蚁洞","蛇魔巢穴","通天魔塔","英雄战场","铁血魔城","修罗天界","邪恶熔岩","雪域冰原"];
      
      public static const CARD_VERIFY_COST:Array = [0,1000000,500000,200000,100000];
      
      public static const XINMO_SUBCLASS_UNCHECK_FROM:int = 24;
      
      public static const XINMO_SUBCLASS_UNCHECK_END:int = 27;
      
      public static const XINMO_SUBCLASS_FROM:int = 28;
      
      public static const XINMO_SUBCLASS_END:int = 31;
      
      public static const XINMO_VERIFY_COST:Array = [100000,200000,400,1000];
      
      public static const DAEMON_COST_SKIN:Array = ["png.base.currency_gold.image_gold1","png.base.currency_gold.image_gold1","png.base.currency_gold.image_gold0","png.base.currency_gold.image_gold2"];
      
      public static const SCENE_LAYER_0:int = 0;
      
      public static const SCENE_LAYER_1:int = 1;
      
      public static const SCENE_LAYER_2:int = 2;
      
      public static const SCENE_LAYER_3:int = 3;
      
      public static const SCENE_LAYER_4:int = 4;
      
      public static const SCENE_LAYER_5:int = 5;
      
      public static const SCENE_LAYER_6:int = 6;
      
      public static const SCENE_LAYER_7:int = 7;
      
      public static const SCENE_LAYER_8:int = 8;
      
      public static var APOTHEOSIZE_COMPLETE:Boolean = false;
      
      private static var _isArenaOpen:Boolean = false;
      
      public static const ROLE_WINDOW_INDEX_BASE:int = 0;
      
      public static const ROLE_WINDOW_INDEX_INTER:int = 1;
      
      public static const ROLE_WINDOW_INDEX_ZHUAN:int = 2;
      
      public static const ROLE_WINDOW_INDEX_ZHENFA:int = 3;
      
      public static const ROLE_WINDOW_INDEX_DAILY:int = 4;
      
      public static const ROLE_WINDOW_INDEX_MENTAL:int = 5;
      
      public static const ROLE_WINDOW_INDEX_DRAGON:int = 6;
      
      public static const ROLE_WINDOW_INDEX_DRAGONBLESS:int = 6;
      
      public static const ROLE_WINDOW_INDEX_SAMSARA:int = 7;
      
      public static const FRIEND_CHAT_INPUT:String = "friendChatInput";
      
      public static const NOTICE_SKILL:int = 1;
      
      public static const NOTICE_FORGING:int = 3;
      
      public static const NOTICE_ZHENFA:int = 14;
      
      public static const NOTICE_EXPREFINERY:int = 15;
      
      public static const NOTICE_PERSONAL_BOSS:int = 17;
      
      public static const NOTICE_STONE:int = 20;
      
      public static const NOTICE_ZHUANSHENG:int = 22;
      
      public static const NOTICE_DAILYTASK:int = 23;
      
      public static const NOTICE_DAY7:int = 24;
      
      public static const NOTICE_GEM:int = 25;
      
      public static const NOTICE_OPEN_IMMORTALLOCK:int = 26;
      
      public static const NOTICE_OPEN_PET:int = 28;
      
      public static const NOTICE_MOUNT:int = 44;
      
      public static const NOTICE_OPEN_PET_UPGRADE:int = 2800;
      
      public static const NOTICE_OPEN_COMBINE:int = 29;
      
      public static const NOTICE_OPEN_SECRETMISSON:int = 30;
      
      public static const NOTICE_OPEN_MONEYTREE:int = 31;
      
      public static const NOTICE_OPEN_OPENTEST:int = 32;
      
      public static const NOTICE_OPEN_WEEKEND:int = 33;
      
      public static const NOTICE_OPEN_HUNDRED:int = 34;
      
      public static const NOTICE_OPEN_FIGHTCITY:int = 35;
      
      public static const NOTICE_OPEN_FIGHTCITY_ROW_GIFT:int = 193;
      
      public static const NOTICE_OPEN_BLUE:int = 36;
      
      public static const NOTICE_OPEN_QQZONE:int = 37;
      
      public static const NOTICE_OPEN_QQHALL:int = 38;
      
      public static const NOTICE_LIAN_CHONG:int = 39;
      
      public static const NOTICE_OPEN_OFFICIAL:int = 42;
      
      public static const NOTICE_OPEN_QQLOTTERY:int = 43;
      
      public static const NOTICE_OPEN_SPRING:int = 69;
      
      public static const NOTICE_INTERNALSTRENGTH:int = 100;
      
      public static const NOTICE_INTERNALSTRENGTH_BOTTOMRight:int = 101;
      
      public static const NOTICE_DAY3_CRAZY:int = 47;
      
      public static const NOTICE_RUNE_DRAW:int = 48;
      
      public static const NOTICE_OPEN_MAY:int = 83;
      
      public static const NOTICE_ANNIVERSARY:int = 85;
      
      public static const NOTICE_YOUXUN:int = 89;
      
      public static var NOTICE_OPEN_COMBINE_REDPOINT:int = 0;
      
      public static var isTeamCopyOpen:Boolean = false;
      
      public static const LOGIN_DAY:Array = [1,2,3,4,5,6,7,9,11,13,14,17,21,26];
      
      public static const NEW_LOGIN_DAY:Array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
      
      public static const BUY_SKILL_COST:Array = [100,200,500,1000];
      
      public static const HERO_STAR_LEVEL_MAP_LIST:Array = [80,90,100,110,120];
      
      public static const TWEEN_LAST_TIME:int = 750;
      
      public static const JUMP_MAP_CODs:Array = [[39,13],[39,18],[111,1],[71,5],[71,15],[5,56],[55,1],[39,38],[25,4],[107,1],[104,1],[105,1],[103,1],[107,1],[39,42],[71,19],[108,1],[109,1],[99,1]];
      
      public static const SHIELD_TEXTFIELD:Boolean = false;
      
      public static var FUNCTION_CHECKPORT:Function = null;
      
      public static var BUYBESTVIP:Boolean = false;
      
      public static var BUY_RIGHT_CARD:int = 0;
      
      public static var IS_DEEP_USE_YB:Boolean = false;
      
      public static var runSpeed:int = 0;
      
      public static var walkSpeed:int = 0;
      
      public static var attackSpeed:int = 0;
       
      
      public function GConst()
      {
         super();
      }
      
      public static function updateWindowPos(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Point = WINDOW_CLOSE_COORDS[param1];
         if(null == _loc4_)
         {
            _loc4_ = new Point();
            WINDOW_CLOSE_COORDS[param1] = _loc4_;
         }
         _loc4_.x = param2;
         var _loc5_:* = param3;
         _loc4_.y = _loc5_;
      }
      
      public static function updateQuickSkillPos(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < 12)
         {
            _loc3_ = new Point();
            _loc3_.setTo(param1 + 52 * (_loc5_ % 6),param2 - 52 * (_loc5_ >= 6?0:1));
            skillQuickPos[_loc5_] = _loc3_;
            _loc5_++;
         }
         var _loc4_:Array = skillQuickPos;
      }
      
      public static function set isArenaOpen(param1:Boolean) : void
      {
         if(_isArenaOpen == param1)
         {
            return;
         }
         _isArenaOpen = param1;
      }
      
      public static function get isArenaOpen() : Boolean
      {
         return _isArenaOpen;
      }
      
      public static function get IS_NEW_FIRST_CHARGE() : Boolean
      {
         return true;
      }
   }
}
