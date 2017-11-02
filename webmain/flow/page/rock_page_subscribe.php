<?php
/**
*	模塊：subscribe.訂閱管理，
*	說明：自定義區域內可寫您想要的代碼，模塊列表頁面，生成分為2塊
*	來源：流程模塊→表單元素管理→[模塊.訂閱管理]→生成列表頁
*/
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){
	{params}
	var modenum = 'subscribe',modename='訂閱管理',isflow=0,modeid='67',atype = params.atype,pnum=params.pnum;
	if(!atype)atype='';if(!pnum)pnum='';
	var fieldsarr = [{"name":"\u7533\u8bf7\u4eba","fields":"base_name"},{"name":"\u7533\u8bf7\u4eba\u90e8\u95e8","fields":"base_deptname"},{"name":"\u5355\u53f7","fields":"sericnum"},{"fields":"optname","name":"\u8ba2\u9605\u4eba","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"title","name":"\u8ba2\u9605\u6807\u9898","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"cont","name":"\u8ba2\u9605\u63d0\u9192\u5185\u5bb9","fieldstype":"textarea","ispx":"0","isalign":"0","islb":"1"},{"fields":"explain","name":"\u8ba2\u9605\u8bf4\u660e","fieldstype":"textarea","ispx":"0","isalign":"0","islb":"1"},{"fields":"optdt","name":"\u8ba2\u9605\u65f6\u95f4","fieldstype":"datetime","ispx":"1","isalign":"0","islb":"1"},{"fields":"status","name":"\u72b6\u6001","fieldstype":"checkbox","ispx":"0","isalign":"0","islb":"1"},{"fields":"recename","name":"\u540c\u65f6\u8ba2\u9605\u7ed9","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"ratecont","name":"\u8ba2\u9605\u63d0\u9192\u65f6\u95f4","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"},{"fields":"suburl","name":"\u8ba2\u9605\u5730\u5740","fieldstype":"textarea","ispx":"0","isalign":"0","islb":"0"},{"fields":"suburlpost","name":"\u8ba2\u9605\u5730\u5740post\u53c2\u6570","fieldstype":"textarea","ispx":"0","isalign":"0","islb":"0"},{"fields":"lastdt","name":"\u6700\u540e\u8fd0\u884c\u65f6\u95f4","fieldstype":"datetime","ispx":"1","isalign":"0","islb":"1"},{"fields":"shatename","name":"\u5171\u4eab\u7ed9","fieldstype":"changedeptusercheck","ispx":"0","isalign":"0","islb":"1"},{"fields":"id","name":"ID","fieldstype":"text","ispx":"0","isalign":"0","islb":"1"}],fieldsselarr= [];
	
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
				title:'訂閱管理('+nowtabs.name+')',
				cont:'訂閱管理('+nowtabs.name+')的列表的',
				explain:'訂閱[訂閱管理]的列表',
				objtable:a
			});
		},
		getacturl:function(act){
			return js.getajaxurl(act,'mode_subscribe|input','flow',{'modeid':modeid});
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
			window.managelistsubscribe = a;
			addtabs({num:'daorusubscribe',url:'flow,input,daoru,modenum=subscribe',icons:'plus',name:'導入訂閱管理'});
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
		fanye:true,modenum:modenum,modename:modename,statuschange:false,tablename:jm.base64decode('c3Vic2NyaWJl'),
		url:c.storeurl(),storeafteraction:'storeaftershow',storebeforeaction:'storebeforeshow',
		params:{atype:atype},
		columns:[{text:"訂閱人",dataIndex:"optname"},{text:"訂閱標題",dataIndex:"title"},{text:"訂閱提醒內容",dataIndex:"cont"},{text:"訂閱說明",dataIndex:"explain"},{text:"訂閱時間",dataIndex:"optdt",sortable:true},{text:"狀態",dataIndex:"status"},{text:"同時訂閱給",dataIndex:"recename"},{text:"訂閱提醒時間",dataIndex:"ratecont"},{text:"最後運行時間",dataIndex:"lastdt",sortable:true},{text:"共享給",dataIndex:"shatename"},{text:"ID",dataIndex:"id"},{
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

//設置單元格可編輯
	bootparams.celleditor = true;
	c.setcolumns('title',{
		editor:true
	});
	c.setcolumns('explain',{
		editor:true,
		type:'textarea'
	});
	c.setcolumns('cont',{
		editor:true,
		type:'textarea'
	});
	
	c.setcolumns('status',{
		editor:true,
		type:'checkbox',
		editorafter:function(){
			c.reload();
		}
	});
	
	$('#tdright_{rand}').prepend(c.getbtnstr('運行訂閱','dinghue','','disabled')+'&nbsp;&nbsp;');
	c.dinghue=function(){
		js.msg('wait','運行中...');
		js.ajax(this.getacturl('yunsubscribe'),{id:a.changeid},function(ret){
			if(ret.success){
				js.msg('success', '運行成功');
				a.reload();
			}else{
				js.msg('msg', ret.msg);
			}
		},'get,json');
	}
	bootparams.itemclick=function(){
		get('btndinghue_{rand}').disabled=false;
	}
	bootparams.beforeload=function(){
		get('btndinghue_{rand}').disabled=true;
	}

	$('#viewsubscribe_{rand}').after('<div class="tishi">未設置訂閱提醒時間是不會生效哦，可在[操作]菜單上添加提醒設置，查看<a href="<?=URLY?>view_subscribe.html" target="_blank">[幫助]</a>。</div>');
	
	c.clickwin=function(){
		js.confirm('訂閱管理新增不是在這裡的，請到各個列表頁面下的[導出]按鈕下點訂閱，是否打開相關幫助說明？',function(jg){
			if(jg=='yes')window.open('<?=URLY?>view_subscribe.html');
		});
	}

//[自定義區域end]

	js.initbtn(c);
	var a = $('#viewsubscribe_{rand}').bootstable(bootparams);
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
		<td style="padding-left:10px"><select class="form-control" style="width:120px" id="selstatus_{rand}"><option value="">-全部狀態-</option><option style="color:#888888" value="0">停用</option><option style="color:green" value="1">啟用</option></select></td>
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
<div id="viewsubscribe_{rand}"></div>
<!--HTMLend-->