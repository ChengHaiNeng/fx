<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
class GoodsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $goods_list = DB::table('goods')->get();
        return view('index',['goods_list'=>$goods_list]);
    }

    public function goods($gid){
        $goods_info = DB::table('goods')->where('gid',$gid)->first();
        return view('goods',['goods_info'=>$goods_info]);
    }
    
}
