<?php
if(!defined('HOST'))die('not access');
//通过[系统→系统工具→系统设置]，保存修改了配置文件
return array(
	'url'	=> 'http://flow.nicelink.com.tw/',	//系统URL
	'localurl'	=> '',	//本地系统URL，用于服务器上浏览地址
	'title'	=> '威勁國際',	//系统默认标题
	'apptitle'	=> '威勁國際OA',	//APP上或PC客户端上的标题
	'db_host'	=> '127.0.0.1',	//数据库地址
	'db_user'	=> 'root',	//数据库用户名
	'db_pass'	=> 'nice999P@ssw0rd',	//数据库密码
	'db_base'	=> 'ROCK',	//数据库名称
	'db_engine'	=> 'MyISAM',
	'perfix'	=> 'xinhu_',	//数据库表名前缀
	'qom'	=> 'xinhu_',	//session、cookie前缀
	'highpass'	=> '',	//超级管理员密码，可用于登录任何帐号
	'db_drive'	=> 'pdo',	//操作数据库驱动有mysql,mysqli,pdo三种
	'randkey'	=> 'hwtjglmnxveyuqabzifpckdosr',	//系统随机字符串密钥
	'asynkey'	=> '9ac8e3d7ce2c4953e45d06ed30a4dfb8',	//这是异步任务key
	'openkey'	=> 'cc00b9778f99d6c7a90121342dde6f7b',	//对外接口openkey
	'updir'	=> 'upload',
	'sqllog'	=> false,	//是否记录sql日志保存upload/sqllog下
	'asynsend'	=> '0',	//是否异步发送提醒消息，0同步，1自己服务端异步，2官网VIP用户异步
	'install'	=> true,	//已安装，不要去掉啊
	'reimtitle'	=> '',	//REIM即时通信上标题
	'xinhukey'	=> '',	//信呼官网key，用于在线升级使用
	'bcolorxiang'	=> '',	//单据详情页面上默认展示线条的颜色
	'debug'	=> false,	//为true调试开发模式,false上线模式
	'reim_show'	=> true,	//首页是否显示REIM
	'mobile_show'	=> true,	//首页是否显示手机版

);
