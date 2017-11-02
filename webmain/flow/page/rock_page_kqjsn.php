<?php
/**
*	模塊：kqjsn.考勤機設備，
*	說明：自定義區域內可寫您想要的代碼，模塊列表頁面，生成分為2塊
*	來源：流程模塊→表單元素管理→[模塊.考勤機設備]→生成列表頁
*/
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){
	{params}
	var modenum = 'kqjsn',modename='考勤機設備',isflow=0,modeid='70',atype = params.atype,pnum=params.pnum;
	if(!atype)atype='';if(!pnum)pnum='';
	var fieldsarr = [{"name":"\u7533\u8bf7\u4eba","fields":"base_name"},{"name":"\u7533\u8bf7\u4eba\u90e8\u95e8","fields":"base_deptname"},{"name":"\u5355\u53f7","fields":"sericnum"},{"fields":"num","name":"\u8bbe\u5907\u53f7","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"name","name":"\u8bbe\u5907\u540d\u79f0","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"company","name":"\u516c\u53f8\u540d","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"status","name":"\u72b6\u6001","fieldstype":"text","ispx":"1","isalign":"0","islb":"1"},{"fields":"sort","name":"\u6392\u5e8f\u53f7","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"lastdt","name":"\u6700\u540e\u8bf7\u6c42\u65f6\u95f4","fieldstype":"datetime","ispx":"1","isalign":"0","islb":"1"},{"fields":"id","name":"ID","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"space","name":"sd\u5361\u5269\u4f59\u7a7a\u95f4","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"memory","name":"\u5269\u4f59\u5185\u5b58","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"usershu","name":"\u4eba\u5458\u6570","fieldstype":"number","ispx":"0","isalign":"0","islb":"1"},{"fields":"fingerprintshu","name":"\u6307\u7eb9\u6570","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"headpicshu","name":"\u5934\u50cf\u6570\u91cf","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"clockinshu","name":"\u6253\u5361\u6570","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"picshu","name":"\u73b0\u573a\u7167\u7247\u6570","fieldstype":"number","ispx":"1","isalign":"0","islb":"1"},{"fields":"romver","name":"\u7cfb\u7edf\u7248\u672c","fieldstype":"text","ispx":"0","isalign":"0","islb":"0"},{"fields":"appver","name":"\u5e94\u7528\u7248\u672c","fieldstype":"text","ispx":"0","isalign":"0","islb":"0"},{"fields":"model","name":"\u8bbe\u5907\u578b\u53f7","fieldstype":"text","ispx":"0","isalign":"0","islb":"0"}],fieldsselarr= [];
	
	var c = {
		reload:function(){
			a.reload();
		},
		clickwin:function(o1,lx){
			var id=0;
			if(lx==1)id=a.changeid;
			openinput(modename,modenum,id,'opegs{rand}');
		},
		view:function(){
			var d=a.changedata;
			openxiangs(modename,modenum,d.id,'opegs{rand}');
		},
		searchbtn:function(){
			this.search({});
		},
		search:function(cans){
			var s=get('key_{rand}').value,zt='';
			if(get('selstatus_{rand}'))zt=get('selstatus_{rand}').value;
			var canss = js.apply({key:s,keystatus:zt}, cans);
			a.setparams(canss,true);
		},
		//高級搜索
		searchhigh:function(){
			new highsearchclass({
				modenum:modenum,
				oncallback:function(d){
					c.searchhighb(d);
				}
			});
		},
		searchhighb:function(d){
			d.key='';
			get('key_{rand}').value='';
			a.setparams(d,true);
		},
		//導出
		daochu:function(o1,lx,lx1,e){
			if(!this.daochuobj)this.daochuobj=$.rockmenu({
				width:120,top:35,donghua:false,data:[],
				itemsclick:function(d, i){
					c.daonchuclick(d);
				}
			});
			var d = [{name:'導出全部',lx:0},{name:'導出當前頁',lx:1},{name:'訂閱此列表',lx:2}];
			this.daochuobj.setData(d);
			var lef = $(o1).offset();
			this.daochuobj.showAt(lef.left, lef.top+35);
		},
		daonchuclick:function(d){
			if(d.lx==0)a.exceldown();
			if(d.lx==1)a.exceldownnow();
			if(d.lx==2)this.subscribelist();
		},
		subscribelist:function(){
			js.subscribe({
				title:'考勤機設備('+nowtabs.name+')',
				cont:'考勤機設備('+nowtabs.name+')的列表的',
				explain:'訂閱[考勤機設備]的列表',
				objtable:a
			});
		},
		getacturl:function(act){
			return js.getajaxurl(act,'mode_kqjsn|input','flow',{'modeid':modeid});
		},
		changatype:function(o1,lx){
			$("button[id^='changatype{rand}']").removeClass('active');
			$('#changatype{rand}_'+lx+'').addClass('active');
			a.setparams({atype:lx},true);
			nowtabssettext($(o1).html());
		},
		init:function(){
			$('#key_{rand}').keyup(function(e){
				if(e.keyCode==13)c.searchbtn();
			});
			this.initpage();
		},
		initpage:function(){
			
		},
		loaddata:function(d){
			if(!d.atypearr)return;
			get('addbtn_{rand}').disabled=(d.isadd!=true);
			if(d.isdaoru)$('#daoruspan_{rand}').show();
			var d1 = d.atypearr,len=d1.length,i,str='';
			for(i=0;i<len;i++){
				str+='<button class="btn btn-default" click="changatype,'+d1[i].num+'" id="changatype{rand}_'+d1[i].num+'" type="button">'+d1[i].name+'</button>';
			}
			$('#changatype{rand}').html(str);
			$('#changatype{rand}_'+atype+'').addClass('active');
			js.initbtn(c);
		},
		setcolumns:function(fid, cnas){
			var d = false,i,ad=bootparams.columns,len=ad.length,oi=-1;
			for(i=0;i<len;i++){
				if(ad[i].dataIndex==fid){
					d = ad[i];
					oi= i;
					break;
				}
			}
			if(d){
				d = js.apply(d, cnas);
				bootparams.columns[oi]=d;
			}
		},
		daoru:function(){
			window.managelistkqjsn = a;
			addtabs({num:'daorukqjsn',url:'flow,input,daoru,modenum=kqjsn',icons:'plus',name:'導入考勤機設備'});
		},
		initcolumns:function(bots){
			var num = 'columns_'+modenum+'_'+pnum+'',d=[],d1,d2={},i,len=fieldsarr.length,bok;
			var nstr= fieldsselarr[num];if(!nstr)nstr='';
			if(nstr)nstr=','+nstr+',';
			if(nstr=='' && isflow==1){
				d.push({text:'申請人',dataIndex:'base_name',sortable:true});
				d.push({text:'申請人部門',dataIndex:'base_deptname',sortable:true});
			}
			for(i=0;i<len;i++){
				d1 = fieldsarr[i];
				bok= false;
				if(nstr==''){
					if(d1['islb']=='1')bok=true;
				}else{
					if(nstr.indexOf(','+d1.fields+',')>=0)bok=true;
				}
				if(bok){
					d2={text:d1.name,dataIndex:d1.fields};
					if(d1.ispx=='1')d2.sortable=true;
					if(d1.isalign=='1')d2.align='left';
					if(d1.isalign=='2')d2.align='right';
					d.push(d2);
				}
			}
			if(isflow==1)d.push({text:'狀態',dataIndex:'statustext'});
			if(nstr=='' || nstr.indexOf(',caozuo,')>=0)d.push({text:'',dataIndex:'caozuo',callback:'opegs{rand}'});
			if(!bots){
				bootparams.columns=d;
			}else{
				a.setColumns(d);
			}
		},
		setparams:function(cs){
			var ds = js.apply({},cs);
			a.setparams(ds);
		},
		storeurl:function(){
			var url = this.getacturl('publicstore')+'&pnum='+pnum+'';
			return url;
		},
		printlist:function(){
			js.msg('success','可使用導出，然後打開在打印');
		},
		getbtnstr:function(txt, click, ys, ots){
			if(!ys)ys='default';
			if(!ots)ots='';
			return '<button class="btn btn-'+ys+'" id="btn'+click+'_{rand}" click="'+click+'" '+ots+' type="button">'+txt+'</button>';
		},
		setfieldslist:function(){
			new highsearchclass({
				modenum:modenum,
				modeid:modeid,
				type:1,
				isflow:isflow,
				pnum:pnum,atype:atype,
				fieldsarr:fieldsarr,
				fieldsselarr:fieldsselarr,
				oncallback:function(str){
					fieldsselarr[this.columnsnum]=str;
					c.initcolumns(true);
					c.reload();
				}
			});
		}
	};	
	
	//表格參數設定
	var bootparams = {
		fanye:true,modenum:modenum,modename:modename,statuschange:false,tablename:jm.base64decode('a3Fqc24:'),
		url:c.storeurl(),storeafteraction:'storeaftershow',storebeforeaction:'storebeforeshow',
		params:{atype:atype},
		columns:[{text:"設備號",dataIndex:"num"},{text:"設備名稱",dataIndex:"name"},{text:"公司名",dataIndex:"company"},{text:"狀態",dataIndex:"status",sortable:true},{text:"排序號",dataIndex:"sort",sortable:true},{text:"最後請求時間",dataIndex:"lastdt",sortable:true},{text:"ID",dataIndex:"id",sortable:true},{text:"sd卡剩餘空間",dataIndex:"space",sortable:true},{text:"剩餘內存",dataIndex:"memory",sortable:true},{text:"人員數",dataIndex:"usershu"},{text:"指紋數",dataIndex:"fingerprintshu",sortable:true},{text:"頭像數量",dataIndex:"headpicshu",sortable:true},{text:"打卡數",dataIndex:"clockinshu",sortable:true},{text:"現場照片數",dataIndex:"picshu",sortable:true},{
			text:'',dataIndex:'caozuo',callback:'opegs{rand}'
		}],
		itemdblclick:function(){
			c.view();
		},
		load:function(d){
			c.loaddata(d);
		}
	};
	c.initcolumns(false);
	opegs{rand}=function(){
		c.reload();
	}
	
//[自定義區域start]

bootparams.celleditor = true;
	bootparams.checked = true;
	$('#tdright_{rand}').prepend(c.getbtnstr('選中設備操作 <i class="icon-angle-down"></i>','optbtn')+'&nbsp;');
	
	$('#btnoptbtn_{rand}').rockmenu({
		width:170,top:35,donghua:false,
		data:[{
			name:'設置配置',lx:'config'
		},{
			name:'重啟',lx:'reboot'
		},{
			name:'獲取所有人員',lx:'getuser'
		},{
			name:'獲取設備信息',lx:'getinfo'
		},{
			name:'設置廣告圖1',lx:'advert1'
		},{
			name:'設置廣告圖2',lx:'advert2'
		},{
			name:'設置廣告圖3',lx:'advert3'
		}],
		itemsclick:function(d, i){
			c.sendcmd(0, d.lx);
		}
	});
	
	c.sendcmd=function(id, type){
		var ids = a.getchecked();
		if(ids==''){js.msg('msg','沒用復選框選中記錄');return;}
		js.ajax(js.getajaxurl('sendcmd','kaoqinj','main'),{ids:ids,'type':type},function(ret){
			if(!ret.success){
				js.msg('msg', ret.msg);
			}else{
				js.msg('success', ret.data);
			}
		},'get,json',false,'發送中...,已發送');
	}
	
	c.setcolumns('num',{
		'renderer':function(v,d,i){
			return ''+v+' <a onclick="show_{rand}('+i+')" href="javascript:;">管理</a>';
		}
	});
	
	show_{rand}=function(i){
		var d = a.getData(i);
		addtabs({num:'sngl'+d.id+'',name:'考勤機設備['+d.name+']管理',url:'main,kaoqinj,dept,snid='+d.id+''});
	}
	
	c.setcolumns('sort',{
		'editor':true
	});
	
	c.setcolumns('name',{
		'editor':true
	});
	
	c.setcolumns('company',{
		'editor':true
	});
	
	c.setcolumns('status',{
		'editor':true,
		'type':'checkbox'
	});

//[自定義區域end]

	js.initbtn(c);
	var a = $('#viewkqjsn_{rand}').bootstable(bootparams);
	c.init();
	var ddata = [{name:'高級搜索',lx:0}];
	if(admintype==1)ddata.push({name:'自定義列顯示',lx:2});
	ddata.push({name:'打印',lx:1});
	$('#downbtn_{rand}').rockmenu({
		width:120,top:35,donghua:false,
		data:ddata,
		itemsclick:function(d, i){
			if(d.lx==0)c.searchhigh();
			if(d.lx==1)c.printlist();
			if(d.lx==2)c.setfieldslist();
		}
	});
	
	
});
</script>
<!--SCRIPTend-->
<!--HTMLstart-->
<div>
	<table width="100%">
	<tr>
		<td style="padding-right:10px;" id="tdleft_{rand}" nowrap><button id="addbtn_{rand}" class="btn btn-primary" click="clickwin,0" disabled type="button"><i class="icon-plus"></i> 新增</button></td>
		<td>
			<input class="form-control" style="width:160px" id="key_{rand}" placeholder="關鍵字">
		</td>
		
		<td style="padding-left:10px">
			<div style="width:85px" class="btn-group">
			<button class="btn btn-default" click="searchbtn" type="button">搜索</button><button class="btn btn-default" id="downbtn_{rand}" type="button" style="padding-left:8px;padding-right:8px"><i class="icon-angle-down"></i></button> 
			</div>
		</td>
		<td  width="90%" style="padding-left:10px"><div id="changatype{rand}" class="btn-group"></div></td>
	
		<td align="right" id="tdright_{rand}" nowrap>
			<button class="btn btn-default" click="daochu" type="button">導出 <i class="icon-angle-down"></i></button> 
		</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="viewkqjsn_{rand}"></div>
<!--HTMLend-->