<?php
require './PHPFetion.php';

$fetion = new PHPFetion('15117985354', 'xtha1103');	// 手机号、飞信密码
$fetion->send('15117985354', 'Hello!');	// 接收人手机号、飞信内容
