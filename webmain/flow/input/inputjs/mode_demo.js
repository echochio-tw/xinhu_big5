//1、當頁面加載完成會調用函數 initbodys()，裡面可以寫初始信息，綁定事件等。
function initbodys(){
	
	
	//當元素類型是[彈框下拉選擇]時
	c.onselectdata['tanxuan']=function(d){
		console.log(d);
		js.msg('success','選中的數據：'+JSON.stringify(d)+'');
	}
	
	//彈出多選觸發
	c.onselectdata['tanxuancheck']=function(d){
		console.log(d);
		js.msg('success','選中的數據：'+JSON.stringify(d)+'');
	}
	
	//綁定省用來聯動
	$(form('sheng')).change(function(){
		form('shi').length=1;//清空市下拉框的數據
		form('xian').length=1;//清空縣下拉框的數據
		var val = this.value;
		if(val=='')return;
		
		//ajax獲取對應城市數據，在webmain/flow/input/mode_demoAction.php 下方法getcityAjax 查找數據庫返回
		js.ajax(geturlact('getcity'),{'sheng':val},function(ret){
			//得到數據填充到下拉框
			js.msg('success','城市數據：'+JSON.stringify(ret)+'');
			js.setselectdata(form('shi'),ret,'name');
		},'post,json');
	});
	
	//綁定市用來聯動
	$(form('shi')).change(function(){
		form('xian').length=1;//清空縣下拉框的數據
		var val = this.value;
		if(val=='')return;
		
		//ajax獲取對應縣數據，在webmain/flow/input/mode_demoAction.php 下方法getxianAjax 查找數據庫返回
		js.ajax(geturlact('getxian'),{'city':val},function(ret){
			
			//得到數據填充到下拉框
			js.msg('success','縣(區)數據：'+JSON.stringify(ret)+'');
			js.setselectdata(form('xian'),ret,'name');
		},'post,json');
	});
}
/**
*	常用的方法
*	1、geturlact('abcfangfa');參數方法名 獲取訪問url，訪問方法寫在webmain/flow/input/mode_模塊編號Action.php 下 abcfangfaAjax方法
*/

//2、異步加載數據，demo
function changedata(){
	
	var gtype = 'get'; //為時get請求得到數據字符串，為：get,json返回josn對象
	js.ajax(geturlact('initdatas'),{'參數1':'參數值'},function(ret){
		alert(ret);
		//賦值
	},gtype);
}

//3、提交保存時觸發事件，常用于判斷數據是否完整性
function changesubmit(d){
	//if(!d.name)return '名稱不能為空';
};

//4、保存提交成功觸發
function savesuccess(){
	alert('保存成功，我在頁面上自己寫的');
};


//下拉框聯動例子
function liandong(){
	js.ajax(geturlact('initdatas'),{'參數1':'參數值'},function(ret){
		//返回ret數據是個json數組，格式[{name:'',value:''},{...}]
		var o = form('下拉框名稱');
		o.length = 1;
		js.setselectdata(o,ret,'value'); //給下拉框設置數據源
	},'get,json');
}