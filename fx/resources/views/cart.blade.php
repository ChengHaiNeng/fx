<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<style>
.goods {
    margin: 2% 0;
}
.goods img {
    width:90%;
}
#navb li {
    float: left;
    width: 33%;
    text-align: center;
    list-style: none;
    line-height: 50px;
}
body{
    padding-bottom: 70px;
}
</style>
<body>
    <h1>简洁大气的商城</h1>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 goods">
                <h2>购物车结算</h2>
                <table class="table">

                @foreach($goods_list as $good)
                    <tr>
                        <th>{{$good->name}}</th>
                        <th>{{$good->price}}</th>
                        <th>{{$good->quantity}}</th>
                    </tr>
                @endforeach   
                    <tr>
                        <td colspan="3">小计:&yen;{{$total}}元</td>
                    </tr>

                </table>
                <form action="/order">
                {!! csrf_field() !!}
                    <div class="form-group">
                      <input type="text" class="form-control" name="address" placeholder="收货地址">
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" name="xm" placeholder="收货人姓名">
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" name="mobile" placeholder="手机号">
                    </div>
                    <input class="btn btn-primary" type="submit" value="确认下单">
                </form>
            </div>
        </div>
        <div class="col-xs-12 navbar-fixed-bottom">
          <ul class="navbar-fixed-bottom navbar-default row" id="navb">
            <li><a href="/">首页</a></li>
            <li><a href="/home">个人中心</a></li>
            <li><a href="">帮助</a></li>
          </ul>
        </div>
    </div>
</body>
<script src="http://libs.useso.com/js/jquery/2.1.0/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
</html>