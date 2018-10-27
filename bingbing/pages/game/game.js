var app = getApp();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    image_source: "../../../images/role/bingbing.jpg",
    remove_image_source: "http://97.64.22.39/res/images/bingbing/bingbing.jpg",

    roleUrl: "1",
    roleName: "1",
    recentMatches:[1,2,3,4,5]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {

    var that = this

    var personUrl = "https://api.opendota.com/api/players/208489254";

    // personUrl = "http://www.dotamax.com/player/detail/208489254"

    wx.request({
      url: personUrl,
      data: {
        x: '',
        y: ''
      },
      header: {
        'content-type': 'application/json' // 默认值
      },

      // { "tracked_until": null, "leaderboard_rank": null, "solo_competitive_rank": 3371, "rank_tier": 54, "profile": { "account_id": 208489254, "personaname": "大杯可爱不加冰", "name": null, "cheese": 0, "steamid": "76561198168754982", "avatar": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/49/4943b585e6f5ee13b231b260532d9e0968520c06.jpg", "avatarmedium": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/49/4943b585e6f5ee13b231b260532d9e0968520c06_medium.jpg", "avatarfull": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/49/4943b585e6f5ee13b231b260532d9e0968520c06_full.jpg", "profileurl": "https://steamcommunity.com/profiles/76561198168754982/", "last_login": null, "loccountrycode": null, "is_contributor": false }, "competitive_rank": null, "mmr_estimate": { "estimate": 3624 } }
      success(res) {
        console.log(res.data);

        that.setData({
          roleUrl: res.data.profile.avatarfull,
          roleName: res.data.profile.personaname
        })
      }
    });

    var matchUrl = "https://api.opendota.com/api/players/208489254/matches?limit=5";


    // { "match_id": 4168584903, "player_slot": 0, "radiant_win": false, "duration": 1912, "game_mode": 3, "lobby_type": 0, "hero_id": 5, "start_time": 1539520548, "version": 21, "kills": 4, "deaths": 7, "assists": 10, "skill": 3, "leaver_status": 0, "party_size": null }]
    wx.request({
      url: matchUrl,
      header: {
        'content-type': 'application/json' // 默认值
      },
      success(res) {
        console.log(res.data);

        var ret = [];

        for (var i = 0; i < res.data.length; i++)
        {
          ret
        }
        that.setData({
        })
      }
    })


  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  },

})