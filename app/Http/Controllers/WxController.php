<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use EasyWeChat\Foundation\Application;
use App\User;
use DB;

class WxController extends Controller
{   
    public $app = '';
    public function __construct(){
         $options = [
                    'debug'  => true,
                    'app_id' => 'wxe2f66d1dbc04eb3a',
                    'secret' => 'd08a227000764143c3c66aa443b143fe',
                    'token'  => 'chenghaineng',
                    // 'aes_key' => null, // 可选
                    'log' => [
                        'level' => 'debug',
                        'file'  => 'F:\Bool\Tools\xampp\htdocs\src\fx/easywechat.log', // XXX: 绝对路径！！！！
                    ],
                    //...
        ];
        $this->app = new Application($options);
    }

    /*public function welcome(){
        return view('welcome');
    }*/

    public function index()
    {        

        //服务端验证      
        /*
        $app = new Application($options);
        $response = $app->server->serve();
        return $response;
        */
        // ...
        
        $server = $this->app->server;
        

        $server->setMessageHandler(function($message){
            // 注意，这里的 $message 不仅仅是用户发来的消息，也可能是事件
            // 当 $message->MsgType 为 event 时为事件
            if ($message->MsgType == 'event') {              
                return $this->eventReply($message);
            }elseif($message->MsgType == 'text'){
                return $this->textReply($message);
            }
        });
        $response = $server->serve();
        $response->send(); // Laravel 里请使用：return $response;

    }


    public function eventReply($message){ 
        $userModel = new User();
        $openid = $message->FromUserName;
        switch ($message->Event) {
                    case 'subscribe':
                        $user = $userModel->where("openid",$openid)->first();   
                        //获取openid                        
                        if($user){
                            $user->state = 1;
                            $user->save();
                        }else{
                            $userService = $this->app->user;
                            //得到userinfo对象
                            $userinfo = $userService->get($openid);                    
                            $userModel->name = $userinfo->nickname;
                            $userModel->subtime = time();
                            $userModel->openid = $openid; 
                            if($message->EventKey){
                                $code = $message->EventKey;
                                $p1_openid = str_replace('qrscene_','',$code);
                                $p = DB::table('users')->where('openid',$p1_openid)->first();
                                $userModel->p1 = $p->id;
                                $userModel->p2 = $p->p1;
                                $userModel->p3 = $p->p2;

                            }
                            $userModel->save();

                            $this->getGrcode($openid);

                            return  $userinfo->nickname.",欢迎关注";

                            //$subtime = time();
                        }
                        
                        //
                        
                            
                        break;

                    case 'unsubscribe':
                        $user = $userModel->where("openid",$openid)->first();
                        $user->state = 0;
                        $user->save();
                    default:
                        # code...
                        break;
                }
    }


    public function textReply($message){


                        //$subtime = time();
    }


    public function getGrcode($openid){
        $qrcode = $this->app->qrcode;
        $result = $qrcode->forever($openid);// 或者 $qrcode->forever("foo");
        $ticket = $result->ticket; // 或者 $result['ticket']
        $url = $qrcode->url($ticket);
        $content = file_get_contents($url); // 得到二进制图片内容
        file_put_contents(public_path()."/$openid.jpg", $content); // 写入文件
            }
}


