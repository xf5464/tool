package subGame.chiyue2.games.globalCons
{
   import flash.external.ExternalInterface;
   import flash.utils.ByteArray;
   
   public class GOperation
   {
      
      public static const MAIN_TASK_CHANGE:String = "MAIN_TASK_CHANGE";
      
      public static const JUMP_FORM_MAP_TO_MAP:String = "JUMP_FORM_MAP_TO_MAP";
      
      public static const EVENT_CROSSSERVER:String = "event_cross_server";
      
      public static const GAME_RUN:String = "gameRun";
      
      public static const EVENT_BASEUI_DONE:String = "base_done";
      
      public static const CLOSE_ALERT_WINDOW:String = "close_alert_window";
      
      public static const CLOSE_INSPRITE_WINDOW:String = "closeInspriteWindow";
      
      public static const EVENT_GET_NEW_SKILL:String = "getNewSkill";
      
      public static const EVENT_GET_NEW_SKILL2:String = "getNewSkill2";
      
      public static const CHANGE_SKILL_INFO:String = "changeSkillInfo";
      
      public static const OPEN_OR_CLOSE_SKILL:String = "openOrCloseSkill";
      
      public static const SIMPLIIFY_UI:String = "simplifyUI";
      
      public static const EVENT_SCENE_MYPOSITION:String = "scene_my_position";
      
      public static const EVENT_UPDATE_MYPOSITION:String = "update_my_position";
      
      public static const FIND_PATH:String = "find_path";
      
      public static const EVENT_SHOW_AUTO_FIND:String = "show_auto_find";
      
      public static const EVENT_SHOW_AUTO_MANGER:String = "show_auto_manger";
      
      public static const EVENT_SHOW_AUTO_FIGHT:String = "show_auto_fight";
      
      public static const EVENT_PET_FIGHT:String = "EVENT_PET_FIGHT";
      
      public static const EVENT_AFTER_OPEN_PET_WINDOW:String = "afterOpenPetWindow";
      
      public static const EVENT_SHOW_CATCH:String = "show_catch";
      
      public static const EVENT_SHOW_OBJECT_INFO:String = "show_Object_Info";
      
      public static const CHECK_OTHER_INFO:String = "check_Other_Info";
      
      public static const CHECK_OTHER_HERO:String = "check_Other_Hero";
      
      public static const CHECK_GUILD_INFO:String = "check_guild_info";
      
      public static const HIDE_GUILD_INFO:String = "hide_guild_info";
      
      public static const ACTIVATE:String = "ACTIVATE";
      
      public static const DAY7_POP:String = "DAY7_POP";
      
      public static const ADD_CLOSE_BTN:String = "add_close_btn";
      
      public static const REMOVE_CLOSE_BTN:String = "remove_close_btn";
      
      public static const BACK_GAMESERVER:String = "backGameServer";
      
      public static const EVENT_MAPPATH_ADD:String = "event_mappath_add";
      
      public static const EVENT_MAPPATH_REMOVE:String = "event_mappath_remove";
      
      public static const EVENT_MAPPATH_CLEAN:String = "event_mappath_clean";
      
      public static const EVENT_ME_STOPALL:String = "stopMyAll";
      
      public static const EVENT_ME_STOPMOVE:String = "stopMyMove";
      
      public static const EVENT_MINFRAME:String = "eventMinFrame";
      
      public static const CHANGE_FOCUS_TO_CHAT:String = "changeFocusToChat";
      
      public static const CHANGE_CHAT_FOCUS:String = "CHANGE_CHAT_FOCUS";
      
      public static const CHANGE_TEAM_FLAG:String = "CHANGE_TEAM_FLAG";
      
      public static const CHANGE_FIGHT:String = "change_fight";
      
      public static const CHANGE_VIGOUR:String = "CHANGE_VIGOUR";
      
      public static const REMOVE_ACTIVITY_ICON:String = "REMOVE_ACTIVITY_ICON";
      
      public static const ADD_ACTIVITY_ICON:String = "ADD_ACTIVITY_ICON";
      
      public static const CHANGE_ACTIVITY_ICON:String = "CHANGE_ACTIVITY_ICON";
      
      public static const CHANGE_ACTIVITY_ICON_NUM:String = "CHANGE_ACTIVITY_ICON_NUM";
      
      public static const SHOW_ACTIVITY_ICON_PANEL:String = "SHOW_ACTIVITY_ICON_PANEL";
      
      public static const SHOW_ACTIVITY_ICON:String = "SHOW_ACTIVITY_ICON";
      
      public static const OPEN_WINDOW:String = "openwindow";
      
      public static const OPEN_WINDOW_MORE:String = "openwindow_more";
      
      public static const CLOSE_WINDOW:String = "closewindow";
      
      public static const EVENT_ATTACK_SKILL:String = "skillAttack";
      
      public static const EVENT_AUTOATTACK_SKILL:String = "autoSkillAttack";
      
      public static const ADD_SHIELD:String = "add_shield";
      
      public static const CHANGE_PK_MODE_FROM_KEYBOARD:String = "change_pk_mode";
      
      public static const PK_MODE_CHANGED:String = "pk_mode_changed";
      
      public static const NOTCANMOVE:String = "cant_move";
      
      public static const NOTICE_ADD_ITEM:String = "add_item";
      
      public static const CHECKTOTEM:String = "checktotem";
      
      public static const MOVEDIR:String = "moveDir";
      
      public static const RECONNECT:String = "reconnect";
      
      public static const REQUEST_PAY_PAGE:String = "request_pay_page";
      
      public static const KILL_THEONE:String = "kill_the_one";
      
      public static const CLOSE_INFO_PANEL:String = "close_info_panel";
      
      public static const EVENT_USE_QUICKKEY:String = "use_quickKey";
      
      public static const UPDATE_CD_SKILL:String = "update_cd_skill";
      
      public static const CHARGE_CD_END:String = "charge_cd_end";
      
      public static const PRESS_SET_SKILL:String = "press_set_skill";
      
      public static const EVENT_SHOW_CAN_USE_TIME:String = "show_can_use_time";
      
      public static const EVENT_UPDATA_QUICKKEYS:String = "event_updata_quickkeys";
      
      public static const UPDATE_QUICKKEY:String = "update_quickKey";
      
      public static const ACTIVE_SKILL_STATE:String = "active_skill_state";
      
      public static const SHOW_ITEM_ON_MAP:String = "showItemOnMap";
      
      public static const PRESS_SHIFT:String = "pressShift";
      
      public static const CLEAR_SELECT_TARGET:String = "clear_select_target";
      
      public static const SELECT_TARGET:String = "select_target";
      
      public static const SELECT_TARGETID:String = "select_targetid";
      
      public static const EVENT_CLOSE_NPC:String = "event_close_npc";
      
      public static const EVENT_RANDER:String = "onRENDER";
      
      public static const EVENT_ATTACK_DONE:String = "myAttackDone";
      
      public static const AUTOFIGHT_START:String = "auto_fight_start";
      
      public static const AUTOFIGHT_STOP:String = "auto_fight_stop";
      
      public static const AUTOTAKE_ITEM:String = "auto_take_item";
      
      public static const AUTOSHOWSKILL:String = "auto_show_skill";
      
      public static const ENTERMAP:String = "entermap";
      
      public static const MOVE_ONCE:String = "moveOnce";
      
      public static const ATTACK_NULL:String = "attackNull";
      
      public static const ATTACK_MAGIC:String = "attackMagic";
      
      public static const CLICK_PORT:String = "clickPort";
      
      public static const GET_ATTACK_ACTION:String = "getattackaction";
      
      public static const TEXTLINK_TRACE_SCENE:String = "task_track_link_scene";
      
      public static const SAFE_AREA_CHANGED:String = "safe_area_changed";
      
      public static const TEXTLINK_TRACE_ATTACK:String = "task_track_link_attack";
      
      public static const TEXTLINK_TRACE_AUTO_KILLMONSTER:String = "task_track_link_monster";
      
      public static const TEXTLINK_TRACE_AUTO_KILLBOSS:String = "task_track_link_boss";
      
      public static const TEXTLINK_TRACE_NPC:String = "task_track_link_npc";
      
      public static const CLICK_TRACE_NPC:String = "click_trace_npc";
      
      public static const TEXTLINK_TRACE_ITEM:String = "task_track_link_item";
      
      public static const TEXTLINK_TRACE_CATCH:String = "task_track_link_catch";
      
      public static const TEXTLINK_COLLECT_ITEM:String = "operation_collect_item";
      
      public static const TEXTLINK_PICK:String = "pickUp";
      
      public static const CLICK_TRACE_EFFECT:String = "click_trace_effect";
      
      public static const CALL_GUARD:String = "call_guard";
      
      public static const APOTHEOSIZE_UPDATE:String = "apotheosize_update";
      
      public static const MAINUI_COMPOUND_STATE_CHANGE:String = "mainui_compound_change";
      
      public static const FORGE_PANEL_STATE_CHANGE:String = "FORGE_PANEL_STATE_CHANGE";
      
      public static const FORGE_PANEL_MOVIE_END:String = "FORGE_PANEL_MOVIE_END";
      
      public static const NEW_FORGE_NOTICE:String = "new_forge_notice";
      
      public static const NEW_STEAL_NOTICE:String = "new_steal_notice";
      
      public static const GET_HERO_GIFT:String = "get_hero_gift";
      
      public static const BREAK_CONNECT:String = "break_connect";
      
      public static const HERO_BOX_UPDATE:String = "hero_box_update";
      
      public static const UPDATE_CHALLENGE_INFO:String = "update_challenge_info";
      
      public static const OPEN_BAGFULL_TIP:String = "open_bagfull_tip";
      
      public static const CLOSE_ALL_TIP_POP:String = "close_all_tip_pop";
      
      public static const OPEN_FACTION_BOSS:String = "open_faction_boss";
      
      public static const TEXTLINK_TRACE_SHOP:String = "LINK_NPC_SHOP";
      
      public static const QUICK_SHOP_BUY_STATE:String = "QUICK_SHOP_BUY_STATE";
      
      public static const TEXTLINK_TRACE_STORE:String = "LINK_NPC_STORE";
      
      public static const MAINUI_SHOW:String = "mainui_show";
      
      public static const MAINUI_SHADY:String = "mainui_shady";
      
      public static const RESET_VIEW_SHOW:String = "reset_view_show";
      
      public static const CUT_VIEW_SHOW:String = "cut_view_show";
      
      public static const SCENE_ENTER:String = "scene_enter";
      
      public static const UPDATE_TASKSTAGE:String = "UPDATE_TASKSTAGE";
      
      public static const OTHER_USEBOMB:String = "other_usebomb";
      
      public static const M2402:String = "M2402";
      
      public static const M2409:String = "M2409";
      
      public static const M2411:String = "M2411";
      
      public static const M2420:String = "M2420";
      
      public static const MODULES_CHAT_EVENT:String = "modules_chat_event";
      
      public static const ENTER_REQUEST_SERVERTIME:String = "request_servertime";
      
      public static const ITEM_IN_PACK__IS_EX_IN:String = "item_in_pack_is_ex_in";
      
      public static const ITEM_MOUSE_ROLL_OUT:String = "item_mouse_roll_out";
      
      public static const ITEM_DRAGFROM_PACK_TO_PITCH:String = "item_dragfrom_pack_to_pitch";
      
      public static const AUTO_PICK_WHEN_AUOTO_FIGHT:String = "pick_when_autofight";
      
      public static const BAG_CLEAR_GRAY_STATE:String = "BAG_CLEAR_GRAY_STATE";
      
      public static const FACTION_STORAGE_CLEAR_GRAY_STATE:String = "FACTION_STORAGE_CLEAR_GRAY_STATE";
      
      public static const BAG_AUTO_SELL:String = "BAG_AUTO_SELL";
      
      public static const FACTION_STORAGE_AUTO_SELL:String = "FACTION_STORAGE_AUTO_SELL";
      
      public static const MOUNT_AFTER_ARTIFICE:String = "mount_after_artifice";
      
      public static const LEVELUP:String = "levelup";
      
      public static const CHAT_MODULES_CHAT_EVENT:String = "chat_event";
      
      public static const CHAT_INPUT_FOCUS_OUT:String = "chat_input_focus_out";
      
      public static const CHAT_INPUT_FOCUS_IN:String = "chat_input_focus_in";
      
      public static const CHAT_ADDEVENT_MOVE:String = "chat_addevent_move";
      
      public static const CHAT_ADDEVENT_EQUIP:String = "chat_addevent_equip";
      
      public static const CHAT_ADDEVENT_EQUIP2:String = "chat_addevent_equip2";
      
      public static const CHAT_MODULES_EVENT:String = "event";
      
      public static const CHAT_MODULES_CHAT:String = "chat";
      
      public static const CHAT_MODULES_PRIVATE:String = "private";
      
      public static const CHAT_MODULES_MOVE:String = "move";
      
      public static const CHAT_MODULES_EQUIP:String = "outfit";
      
      public static const CHAT_GETCHATDATA:String = "chat_getChatData";
      
      public static const CHAT_WORLD_INVITE:String = "chat_world_invite";
      
      public static const LOCK_STATE_NONE:int = 0;
      
      public static const LOCK_STATE_DEAL:int = 1;
      
      public static const LOCK_STATE_PITCH:int = 2;
      
      public static const LOCK_STATE_MOUNT_ARTIFICE:int = 3;
      
      public static const LOCK_STATE_FUMO:int = 4;
      
      public static const PK_MODE_SAFE:String = "PK_MODE_SAFE";
      
      public static const PK_MODE_KEYCHANGE:String = "PK_MODE_CHANGE";
      
      public static const OPEN_TREASURE_VIEW:String = "open_treasure_view";
      
      public static const SHOWMESSAGE:String = "show_message";
      
      public static const SHOWSHACHENGMESSAGE:String = "show_shachengmessage";
      
      public static const SHOW_ATTRIBUTE_CHANGE:String = "show_attribute_change";
      
      public static const ASSISTANCE_DRUG_NUM_CHANGE:String = "assistance_drug_num_change";
      
      public static const PAUSE_LEFT_TIMES:String = "PAUSE_LEFT_TIMES";
      
      public static const UNPAUSE_ALL_DOWN:String = "UNPAUSE_ALL_DOWN";
      
      public static const GUIDE_ARROW:String = "show_guide_";
      
      public static const REMOVE_MONSTER:String = "remove_monster";
      
      public static const ASSISTANCE_CHANGE:String = "assistance_change_";
      
      public static const CHANGE_ATTACKNUMBER:String = "change_attackNumber";
      
      public static const ONUPDATE_MAINUI:String = "onUpdate_mainui";
      
      public static const UPDATE_RESLOADPROGRESS:String = "update_resloadprogress";
      
      public static const DRAG_ITEM_FROM_:String = "drag_item_from_";
      
      public static const UPDATE_MY_EQUIPS:String = "update_my_equips";
      
      public static const UPDATE_MY_SOLDIERS_EQUIPS:String = "update_my_soldiers_equips";
      
      public static const UPDATE_MY_MOUNT_EQUIPS:String = "UPDATE_MY_MOUNT_EQUIPS";
      
      public static const UPDATE_MY_WING_EQUIPS:String = "UPDATE_MY_WING_EQUIPS";
      
      public static const UPDATE_MY_OTHER_EQUIPS:String = "update_my_other_equips";
      
      public static const UPDATE_MY_CARD_EQUIPS:String = "update_my_card_equips";
      
      public static const UPDATE_MYSTERY_BAG:String = "update_mystery_bag";
      
      public static const UPDATE_BAG_ITEM:String = "update_bag_item";
      
      public static const UPDATE_TREASURE_BAG_ITEM:String = "update_treasure_bag_item";
      
      public static const PACK_CHANGE_LOCK_STATE:String = "pack_change_lock_state";
      
      public static const PACK_GRID_LOCK_STATE_CHANGE:String = "pack_grid_lock_state_change";
      
      public static const STOVE_GRID_LOCK_STATE_CHANGE:String = "stove_grid_lock_state_change";
      
      public static const UI_SHOW_CHARIOT:String = "ui_show_chariot";
      
      public static const FLY_ITEM:String = "FLY_ITEM";
      
      public static const FLY_MONEY:String = "FLY_MONEY";
      
      public static const FLY_ITEM_TO_POS:String = "FLY_ITEM_TO_POS";
      
      public static const FLY_ICON_TO_POS:String = "FLY_ICON_TO_POS";
      
      public static const START_DRAGING_ITEM:String = "start_draging_item";
      
      public static const STOP_DRAGING_ITEM:String = "stop_draging_item";
      
      public static const FLY_AS_SPARK:String = "fly_as_spark";
      
      public static const DAILY_KILLMONSTER:String = "DAILY_KILLMONSTER";
      
      public static const DAILYTASKCOUNT_CHANGE:String = "DAILYTASKCOUNT_CHANGE";
      
      public static const HORSE_CAN_GET:String = "HORSE_CAN_GET";
      
      public static const HORSE_BREED_COUNT_CHANGE:String = "HORSE_BREED_COUNT_CHANGE";
      
      public static const UI_ADDGOLD:String = "UI_ADDGOLD";
      
      public static const UI_GOLDNUM:String = "UI_GOLDNUM";
      
      public static const PLAY_OVEN:String = "PLAY_OVEN";
      
      public static const SET_EX_BAG:String = "SET_EX_BAG";
      
      public static const EVENT_MONEY_OVERLAY:String = "event_money_overlay";
      
      public static const MINIMAP_UPDATA_BOSS:String = "minimap_updata_boss";
      
      public static const FOLLOW_UPDATA_BOSS:String = "follow_updata_boss";
      
      public static const EVENT_UPDATE_PORTSTATE:String = "event_updata_portstate";
      
      public static const COPY_PASS_UPDATE:String = "copy_pass_update";
      
      public static const COPY_TIME_COUNT:String = "copy_time_count";
      
      public static const SEAL_MONSTER_ITEM_COUNT_CHANGE:String = "SEAL_MONSTER_ITEM_COUNT_CHANGE";
      
      public static const SEAL_MONSTER_ITEM_CHANGE:String = "SEAL_MONSTER_ITEM_CHANGE";
      
      public static const INDENTIFY_RETRY_INFO:String = "INDENTIFY_RETRY_INFO";
      
      public static const ADD_SUPER_GOLD_CARD_ICON:String = "ADD_SUPER_GOLD_CARD_ICON";
      
      public static const ADD_FRIEND_ICON:String = "ADD_FRIEND_ICON";
      
      public static const REMOVE_ADD_FRIEND_ICON:String = "REMOVE_ADD_FRIEND_ICON";
      
      public static const NPC_OPEN:String = "npc_open";
      
      public static const HP_CHANGER:String = "HP_changer";
      
      public static const MP_CHANGER:String = "MP_changer";
      
      public static const EVENT_LOCAL_UPDATA:String = "event_local_updata";
      
      public static const EVENT_INIT_WALLS:String = "event_init_walls";
      
      public static const UPDATE_TITLE_INFO:String = "UPDATE_TITLE_INFO";
      
      public static const IN_TEAMCOPY_VIEW:String = "IN_TEAMCOPY_VIEW";
      
      public static const THOUSAND_RED_PACK:String = "THOUSAND_RED_PACK";
      
      public static const UPDATE_CHANGE_CURRENCY:String = "UPDATE_CHANGE_CURRENCY";
      
      public static const UPDATE_CHANGE_LEVEL:String = "UPDATE_CHANGE_LEVEL";
      
      public static const UPDATE_CHANGE_IMMORTAL:String = "UPDATE_CHANGE_IMMORTAL";
      
      public static const UPDATE_CHANGE_SKILL:String = "UPDATE_CHANGE_SKILL";
      
      public static const UPDATE_CHANGE_HEADID:String = "UPDATE_CHANGE_HEADID";
      
      public static const UPDATE_BOOK:String = "update_book";
      
      public static const UPDATE_EXP:String = "UPDATE_EXP";
      
      public static const UPDATE_EXP_MOVIE:String = "UPDATE_EXP_MOVIE";
      
      public static const UPDATE_FACTION_CONTRIBUTE:String = "UPDATE_FACTION_CONTRIBUTE";
      
      public static const UPDATE_INLAY:String = "UPDATE_INLAY";
      
      public static const UPDATE_NAME:String = "UPDATE_NAME";
      
      public static const UPDATE_ZHUAN:String = "UPDATE_ZHUAN";
      
      public static const UPDATE_DRAGON_VALUE:String = "UPDATE_DRAGON_VALUE";
      
      public static const UPDATE_LUCK_VALUE:String = "UPDATE_LUCK_VALUE";
      
      public static const UPDATE_MONSTER_SCORE:String = "UPDATE_MONSTER_SCORE";
      
      public static const UPDATE_MEDAL_DATA:String = "UPDATE_MEDAL_DATA";
      
      public static const UPDATE_ROLETIPS:String = "UPDATE_ROLETIPS";
      
      public static const OPEN_WINDOW_RESET:String = "OPEN_WINDOW_RESET";
      
      public static const DIG_TREASURE_QUICK_SELL:String = "DIG_TREASURE_QUICK_SELL";
      
      public static const HAIR_CHANGE:String = "HAIR_CHANGE";
      
      public static const SHOW_ROLE_INFO:String = "SHOW_ROLE_INFO";
      
      public static const VIP_CHANGE:String = "VIP_CHANGE";
      
      public static const ACHIVEMENT_GET:String = "ACHIVEMENT_GET";
      
      public static const ATTACK_ROLL:String = "ATTACK_ROLL";
      
      public static const SEAL_MONSTER_NUM_CHANGE:String = "SEAL_MONSTER_NUM_CHANGE";
      
      public static const SELECT_SELL_LEVEL:String = "SELECT_SELL_LEVEL";
      
      public static const UPDATE_HERO_PARAM:String = "UPDATE_HERO_PARAM";
      
      public static const REMOVE_DRAGON:String = "remove_dragon";
      
      public static const LEVELUP_GET_PANEL:String = "LEVELUP_GET_PANEL";
      
      public static const SET_TRADE_ITEM:String = "set_trade_item";
      
      public static const GET_SERVER_TIME:String = "get_server_time";
      
      public static const FIGHT_CITY_SALARY_OPEN:String = "FIGHT_CITY_SALARY_OPEN";
      
      public static const NOTICE_FUNCTION_NUM:String = "NOTICE_FUNCTION_NUM";
      
      public static const CAN_UP_GEM:String = "CAN_UP_GEM";
      
      public static const UPDATE_GEM_CHIP_NUM:String = "UPDATE_GEM_CHIP_NUM";
      
      public static const MAINUI_ADDCHILD_CALL:String = "MAINUI_ADDCHILD_CALL";
      
      public static const MAINUI_ADDCHILD:String = "MAINUI_ADDCHILD";
      
      public static const HAND_UP_EXP:String = "HAND_UP_EXP";
      
      public static const BAG_LEFT_COMPOSITE_NOTICE:String = "BAG_LEFT_COMPOSITE_NOTICE";
      
      public static const ACTIVITY_ICON_NUM_CHANGE:String = "ACTIVITY_ICON_NUM_CHANGE";
      
      public static const ACTIVITY_ICON_NOTICE_CHANGE:String = "activity_icon_notice_change";
      
      public static const ACTIVITY_COUNT_DOWN:String = "activity_count_down";
      
      public static const GM_TIME_COM:String = "gm_time_com";
      
      public static const CLIENT_SOCKET_SIMULATION:String = "clientSocketSimulation";
      
      public static const SERVER_SOCKET_SIMULATION:String = "serverSocketSimulation";
      
      public static const TASK_2409_143_SHOWFIRSTTIP:String = "TASK_2409_143_SHOWFIRSTTIP";
      
      public static const CROSS3V3_SHOW_NEARPLAYRE:String = "CROSS3V3_SHOW_NEARPLAYRE";
      
      public static const CROSS3V3_CHANGE_TAB:String = "CROSS3V3_CHANGE_TAB";
      
      public static const CROSS_ENTERFB_RESULT:String = "CROSS_ENTERFB_RESULT";
      
      public static const NOTICE_SKILL:int = 1;
      
      public static const NOTICE_FACTION:int = 2;
      
      public static const NOTICE_FORGE:int = 3;
      
      public static const NOTICE_FIGHT:int = 5;
      
      public static const NOTICE_VIP:int = 6;
      
      public static const NOTICE_NREWARD:int = 7;
      
      public static const NOTICE_LOGINREWARD:int = 13;
      
      public static const NOTICE_DAILYTASK:int = 10;
      
      public static const GPU_MOUSE_IN_OBJECT:String = "gpu_mouse_in_object";
      
      public static const NEW_GET_SKILL:String = "new_get_skill";
      
      public static const ROLE_LEVELUP:String = "role_levelup";
      
      public static const CHECK_COMBINESTATE:String = "checkCombineState";
      
      public static const CHECK_MARRY_TO:String = "check_marry_to";
      
      public static const SET_COUPLE_STATE:String = "set_couple_state";
      
      public static const GET_DIVORCE_RESULT:String = "get_divorce_result";
      
      public static const QIANG1215:String = "QIANG1215";
      
      public static const LONGWANG_ADDSKILL:String = "longwang_addskill";
      
      public static const ELEVEN_INFO:String = "eleven_info";
      
      public static const ELEVEN_LUCKY_NUM:String = "eleven_lucky_num";
      
      public static const FACTION_UPDATE_SALARY:String = "faction_update_salary";
      
      public static const GLORY_BATTLE_START:String = "glory_battle_start";
      
      public static const CHRISMAS_INFO:String = "chrismas_info";
      
      public static const CHRISMAS_LUCKY_NUM:String = "chrismas_lucky_num";
      
      public static const SPRING_INFO:String = "spring_info";
      
      public static const UPDATE_BELLE_RECORD:String = "update_belle_record";
      
      public static const YUANXIAO_INFO:String = "YUANXIAO_INFO";
      
      public static const YUANXIAO_LUCKY_NUM:String = "YUANXIAO_LUCKY_NUM";
      
      public static const HIDE_FIRST_CHARGE_PET:String = "HIDE_FIRST_CHARGE_PET";
      
      public static const SHOW_FIRST_CHARGE_PET:String = "SHOW_FIRST_CHARGE_PET";
      
      public static const CHANGE_TAB:String = "CHANGE_TAB";
      
      public static const YUREN_INFO:String = "YUREN_INFO";
      
      public static const YUREN_LUCKY_NUM:String = "YUREN_LUCKY_NUM";
      
      public static const DAY3_CRAZY_CHANGETAB:String = "DAY3_CRAZY_CHANGETAB";
      
      public static const RUNE_CHANGE_PAGE:String = "RUNE_CHANGE_PAGE";
      
      public static const RUNE_MAIN_INFO:String = "RUNE_MAIN_INFO";
      
      public static const RUNE_CHANGE_RUNE:String = "RUNE_CHANGE_RUNE";
      
      public static const RUNE_SELECT_BAG_RUNE:String = "RUNE_SELECT_BAG_RUNE";
      
      public static const RUNE_USE_BAG_RUNE:String = "RUNE_USE_BAG_RUNE";
      
      public static const RUNE_AUTO_SELL:String = "RUNE_AUTO_SELL";
      
      public static const RUNE_LOCK_DRAW_BTN:String = "RUNE_LOCK_DRAW_BTN";
      
      public static const MAY_INFO:String = "MAY_INFO";
      
      public static const SET_WINDOW_CENTER:String = "set_window_center";
      
      public static const OPEN_DIG_CONFIRM_ALERT:String = "open_dig_confirm_alert";
      
      public static const DIG_SELECT_AUTO_BUY:String = "dig_select_auto_buy";
      
      public static const SHOW_ACTIVITY_TIP_PANEL:String = "show_activity_tip_panel";
      
      public static const HIDE_ALL_ACTIVITY_TIP_PANEL:String = "hide_all_activity_tip_panel";
      
      public static const SHOW_ACTIVITY_TIP_PANEL_OVER:String = "SHOW_ACTIVITY_TIP_PANEL_OVER";
      
      public static const SUMMER_INFO:String = "SUMMER_INFO";
      
      public static const SUMMER_LUCKY_NUM:String = "SUMMER_LUCKY_NUM";
      
      public static const LUCKY_DIAMOND_RECORD_UPDATE:String = "LUCKY_DIAMOND_RECORD_UPDATE";
      
      public static const HIDE_MONSTERSCORE_NUM:String = "HIDE_MONSTERSCORE_NUM";
      
      public static const ROLE_EQUIP_ADVISE:String = "ROLE_EQUIP_ADVISE";
      
      public static const NREWARD_FIND_ITEM:String = "NREWARD_FIND_ITEM";
      
      private static const ARR_TEST_NAME:Array = [];
       
      
      public function GOperation()
      {
         super();
      }
      
      public static function callJs(param1:String, ... rest) : *
      {
         if(ExternalInterface.available)
         {
            rest.unshift(param1);
            return ExternalInterface.call.apply(null,rest);
         }
         return null;
      }
      
      public static function notifyStopMoveAndFight(param1:Boolean = false) : void
      {
         if(!param1)
         {
         }
      }
      
      public static function traceObj(param1:Object) : String
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(null != param1)
         {
            _loc2_ = ["\n-------------"];
            var _loc5_:int = 0;
            var _loc4_:* = param1;
            for(_loc3_ in param1)
            {
               _loc2_[_loc2_.length] = _loc3_ + ":" + param1[_loc3_];
            }
            _loc2_[_loc2_.length] = "-------------\n";
            param1 = null;
            return _loc2_.toString();
         }
         return null;
      }
      
      public static function traceBytes(param1:ByteArray) : String
      {
         param1.position = 0;
         var _loc2_:Array = [];
         while(param1.bytesAvailable)
         {
            _loc2_.push(param1.readUnsignedByte());
         }
         param1.position = 0;
         param1 = null;
         return _loc2_.toString();
      }
      

      public static function numToString(param1:*) : String
      {
         return String(param1).replace(/(\d{1,3})(?=(\d{3})+$)/gi,"$1,");
      }
   }
}
