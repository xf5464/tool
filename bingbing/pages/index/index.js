//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    image_source: "../../../images/role/bingbing.jpg",
    remote_image_source: "http://97.64.22.39/res/images/bingbing/3.jpg",
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    imgheights: [],
    currentIndex: 0,
    bg_images: [
      "http://97.64.22.39/res/images/bingbing/1.jpg",
      "http://97.64.22.39/res/images/bingbing/2.jpg",
      "http://97.64.22.39/res/images/bingbing/3.jpg",
      "http://97.64.22.39/res/images/bingbing/4.jpg",
      "http://97.64.22.39/res/images/bingbing/5.jpg"
    ]
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onLoad: function () {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },
  getUserInfo: function(e) {
    console.log(e)
    app.globalData.userInfo = e.detail.userInfo
    this.setData({
      userInfo: e.detail.userInfo,
      hasUserInfo: true
    })
  },
  onImageLoadComplete: function (e) {
    var height = this.data.imgheights;

    height[e.target.dataset.id] = e.detail.height;

    this.setData({ imgheights: height });
  },

  onBindImageChange: function (e) {
    var current = e.detail.current;

    this.setData({ currentIndex: current });
  }
})


