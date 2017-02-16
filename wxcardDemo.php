<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>微信JS-SDK 卡券 Demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
  <link rel="stylesheet" href="css/style.css">
</head>

<body ontouchstart="" style="margin-top: -30px;">
  <div class="wxapi_container">
    <div class="lbox_close wxapi_form">
      <h3 id="menu-card">微信卡券接口正确调用</h3>
      <span class="desc">批量添加卡券接口</span>
      <button class="btn btn_primary" id="addCard">addCard</button>
      <span class="desc">调起适用于门店的卡券列表并获取用户选择列表</span>
      <button class="btn btn_primary" id="chooseCard">chooseCard</button>
      <span class="desc">查看微信卡包中的卡券接口</span>
      <button class="btn btn_primary" id="openCard">openCard</button>
    </div>
    <div class="lbox_close wxapi_form">
      <h3 id="menu-card">微信卡券接口错误调用</h3>
      <span class="desc">添加一张cardId错误的卡券</span>
      <button class="btn btn_primary" id="addCardWrongCardId">addCard</button>
      <span class="desc">添加一张cardExt错误的卡券</span>
      <button class="btn btn_primary" id="addCardWrongCardExt">addCard</button>
      <span class="desc">调起适用于门店的卡券列表时cardSign错误</span>
      <button class="btn btn_primary" id="chooseCardWithWrongCardSign">chooseCard</button>
      <span class="desc">查看cardId错误的卡券</span>
      <button class="btn btn_primary" id="openCardWithWrongCardId">openCard</button>
      <span class="desc">查看code错误的卡券</span>
      <button class="btn btn_primary" id="openCardWithWrongCode">openCard</button>
    </div>
  </div>
</body>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
wx.config({
  debug: true,
  appId: 'wxf8b4f85f3a794e77',
  timestamp: 1486960457,
  nonceStr: 'GRqIt64rUolIk8ux',
  signature: 'd478a83cf3d8f8b78d61729dec0c6fb20819b1d9',
  jsApiList: [
    'addCard',
    'chooseCard',
    'openCard'
  ]
});
</script>
<script src="js/zepto.min.js"></script>
<script>

wx.ready(function() {

  function decryptCode(code, callback) {
    $.getJSON('/jssdk/decrypt_code.php?code=' + encodeURI(code), function (res) {
      if (res.errcode == 0) {
        codes.push(res.code);
      }
    });
  }

  document.querySelector('#addCardWrongCardExt').onclick = function() {
    wx.addCard({
      cardList: [{
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
        cardExt: '{"code": "", "openid": "", "timestamp": "1418301401", "signature":"ad9cf946361c95084716581d52cd33aa0"}'
      }],
      success: function(res) {
        alert('已添加卡券：' + JSON.stringify(res.cardList));
      },
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };

  document.querySelector('#addCardWrongCardId').onclick = function() {
    wx.addCard({
      cardList: [{
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo1234',
        cardExt: '{"code": "", "openid": "", "timestamp": "1418301401", "signature":"ad9cf9463610bc8752c95084716581d52cd33aa0"}'
      }, {
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
        cardExt: '{"code": "", "openid": "", "timestamp": "1418301401", "signature":"ad9cf9463610bc8752c95084716581d52cd33aa0"}'
      }],
      success: function(res) {
        alert('已添加卡券：' + JSON.stringify(res.cardList));
      },
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };

  // 12 微信卡券接口
  // 12.1 添加卡券
  document.querySelector('#addCard').onclick = function() {
    wx.addCard({
      cardList: [{
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
        cardExt: '{"code": "", "openid": "", "timestamp": "1418301401", "signature":"ad9cf9463610bc8752c95084716581d52cd33aa0"}'
      }, {
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
        cardExt: '{"code": "", "openid": "", "timestamp": "1418301401", "signature":"ad9cf9463610bc8752c95084716581d52cd33aa0"}'
      }],
      success: function(res) {
        alert('已添加卡券：' + JSON.stringify(res.cardList));
      },
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };


  document.querySelector('#chooseCardWithWrongCardSign').onclick = function() {
    wx.chooseCard({
      cardSign: '6caa49f4a5af3d64ac247e1f563e5b5eb94619ad',
      timestamp: 1437997723,
      nonceStr: 'k0hGdSXKZEj3Min511',
      success: function(res) {
        res.cardList = JSON.parse(res.cardList);
        encrypt_code = res.cardList[0]['encrypt_code'];
        alert('已选择卡券：' + JSON.stringify(res.cardList));
        decryptCode(encrypt_code, function(code) {
          codes.push(code);
        });
      },
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };

  var codes = [];
  // 12.2 选择卡券
  document.querySelector('#chooseCard').onclick = function() {
    wx.chooseCard({
      cardSign: '6caa49f4a5af3d64ac247e1f563e5b5eb94619ad',
      timestamp: 1437997723,
      nonceStr: 'k0hGdSXKZEj3Min5',
      success: function(res) {
        res.cardList = JSON.parse(res.cardList);
        encrypt_code = res.cardList[0]['encrypt_code'];
        alert('已选择卡券：' + JSON.stringify(res.cardList));
        decryptCode(encrypt_code, function(code) {
          codes.push(code);
        });
      },
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };

   // 12.3 查看卡券
  document.querySelector('#openCardWithWrongCode').onclick = function() {
    if (codes.length < 1) {
      alert('请先使用 chooseCard 接口选择卡券。');
      return false;
    }
    var cardList = [];
    for (var i = 0; i < codes.length; i++) {
      cardList.push({
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo123',
        code: codes[i] + 123
      });
    }
    wx.openCard({
      cardList: cardList,
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };

  // 12.3 查看卡券
  document.querySelector('#openCardWithWrongCardId').onclick = function() {
    if (codes.length < 1) {
      alert('请先使用 chooseCard 接口选择卡券。');
      return false;
    }
    var cardList = [];
    for (var i = 0; i < codes.length; i++) {
      cardList.push({
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo123',
        code: codes[i]
      });
    }
    wx.openCard({
      cardList: cardList,
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };

  // 12.3 查看卡券
  document.querySelector('#openCard').onclick = function() {
    if (codes.length < 1) {
      alert('请先使用 chooseCard 接口选择卡券。');
      return false;
    }
    var cardList = [];
    for (var i = 0; i < codes.length; i++) {
      cardList.push({
        cardId: 'pDF3iY9tv9zCGCj4jTXFOo1DxHdo',
        code: codes[i]
      });
    }
    wx.openCard({
      cardList: cardList,
      cancel: function(res) {
        alert(JSON.stringify(res))
      }
    });
  };


})
</script>

</html>
