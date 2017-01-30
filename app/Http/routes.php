<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::any('/wx', "WxController@index");
//Route::any('/', "WxController@welcome");
Route::any('/login', "UserController@login");
Route::any('/center', "UserController@center");
Route::any('/logout', "UserController@logout");

Route::any('/', "GoodsController@index");
Route::any('/goods/{gid}', "GoodsController@goods");

Route::any('/buy/{gid}', "ShopController@buy");
Route::any('/order', "ShopController@order");