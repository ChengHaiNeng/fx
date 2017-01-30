<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Cart;
use DB;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function buy($gid)
    {
       //将商品加入购物车
       $good = DB::table('goods')->where('gid',$gid)->first();
       // var_dump($good);
       // exit;
       Cart::add($gid, $good->gname, $good->price, 1, array());

       //取出购物车所有商品
       $goods_list = Cart::getContent();
       //取出购物车所有商品总价
       $total = Cart::getTotal();
       return view('cart',['goods_list'=>$goods_list,'total'=>$total]);
    }

    public function order(Request $req){
        $address = $req->address
        $name = $req->xm;
        $mobile = $req->mobile;
        //将数据插入order表
        
        //将数据插入item表
    }
    
}
