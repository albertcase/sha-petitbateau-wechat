<?php

namespace Wechat\ApiBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\Session;

class TestController extends Controller
{
  public function cardsignAction(){
    // $wechat = $this->container->get('my.Wechat');
    // $datain = array(
    //   array(
    //     'card_id' => 'p-jLIwVLOyheVf131TxZ3_IGg3Qo',
    //   ),
    // );
    // $data = $wechat->getCardSign($datain);
    $data = json_encode(array('code' => 9, 'list' => $_SERVER));
    return new Response($data);
  }

  public function cardpageAction(){
    // $wechat = $this->container->get('EasyWeChat.App');
    // // $wechat->set('aaaaa' ,'bbbbbb');
    return $this->render('WechatApiBundle:Test:index.html.twig');
    // $token = $wechat->access_token->getToken();
    // print_r($token);
    return new Response(json_encode(array("LLLLLLLLLLLL"), JSON_UNESCAPED_UNICODE));
  }
}
