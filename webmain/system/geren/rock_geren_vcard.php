<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var pid,typeid=0,sspid=0;
	var at = $('#optionview_{rand}').bootstree({
		url:js.getajaxurl('gettreedata','option','system',{'num':'gerenvcard_'+adminid+''}),
		columns:[{
			text:'分組',dataIndex:'name',align:'left',xtype:'treecolumn',width:'79%'
		},{
			text:'排序號',dataIndex:'sort',width:'20%'
		}],
		load:function(d){
			if(sspid==0){
				typeid = d.pid;
				sspid = d.pid;
				c.loadfile('','所有聯系人');
			}
		},
		itemdblclick:function(d){
			typeid = d.id;
			c.loadfile(d.name,d.name);
		}
	});;
	var modenum = 'vcard';
	var a = $('#view_{rand}').bootstable({
		tablename:modenum,celleditor:true,sort:'sort',dir:'asc',fanye:true,autoLoad:false,modenum:modenum,modename:'個人通訊錄',
		columns:[{
			text:'姓名',dataIndex:'name'
		},{
			text:'性別',dataIndex:'sex'
		},{
			text:'單位',dataIndex:'unitname'
		},{
			text:'電話',dataIndex:'tel',editor:true
		},{
			text:'手機號',dataIndex:'mobile',editor:true
		},{
			text:'郵箱',dataIndex:'email'
		},{
			text:'所在組',dataIndex:'gname',editor:true
		},{
			text:'地址',dataIndex:'address'
		},{
			text:'排序號',dataIndex:'sort',editor:true,sortable:true
		},{
			text:'操作時間',dataIndex:'optdt'
		},{
			text:'',dataIndex:'caozuo'
		}]
	});


	var c = {
		reload:function(){
			at.reload();
		},
		loadfile:function(spd,nsd){
			$('#megss{rand}').html(nsd);
			a.setparams({'gname':spd}, true);
		},
		genmu:function(){
			typeid = sspid;
			at.changedata={};
			this.loadfile('','所有聯系人');
		},
		clicktypeeidt:function(){
			var d = at.changedata;
			if(d.id)c.clicktypewin(false, 1, d);
		},
		clicktypewin:function(o1, lx, da){
			var h = $.bootsform({
				title:'組',height:250,width:300,
				tablename:'option',labelWidth:50,
				isedit:lx,submitfields:'name,sort,pid',cancelbtn:false,
				items:[{
					labelText:'組名',name:'name',required:true
				},{
					labelText:'上級id',name:'pid',value:0,type:'hidden'
				},{
					labelText:'排序號',name:'sort',type:'number',value:0
				}],
				success:function(){
					at.reload();
				}
			});
			if(lx==1)h.setValues(da);
			if(lx==0)h.setValue('pid', sspid);
			return h;
		},
		typedel:function(o1){
			at.del({
				url:js.getajaxurl('deloption','option','system')
			});
		},
		adds:function(){
			openinput('個人通訊錄',modenum);
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		daochu:function(){
			a.exceldown();
		},
		daoru:function(){
			managelistvcard = a;
			addtabs({num:'daoruvcard',url:'flow,input,daoru,modenum=vcard',icons:'plus',name:'導入個人通訊錄'});
		}
	};
	js.initbtn(c);
	$('#optionview_{rand}').css('height',''+(viewheight-70)+'px');
});
</script>


<table width="100%">
<tr valign="top">
<td width="220">
	<div style="border:1px #cccccc solid">
	  <div id="optionview_{rand}" style="height:400px;overflow:auto;"></div>
	  <div  class="panel-footer">
		<a href="javascript:" click="clicktypewin,0" onclick="return false"><i class="icon-plus"></i></a>&nbsp; &nbsp; 
		<a href="javascript:" click="clicktypeeidt" onclick="return false"><i class="icon-edit"></i></a>&nbsp; &nbsp; 
		<a href="javascript:" click="typedel" onclick="return false"><i class="icon-trash"></i></a>&nbsp; &nbsp; 
		<a href="javascript:" click="reload" onclick="return false"><i class="icon-refresh"></i></a>
	  </div>
	</div>  
</td>
<td width="10"></td>
<td>	
	<div>
	<table width="100%"><tr>
		<td align="left" nowrap>
			<button class="btn btn-primary" click="adds"  type="button"><i class="icon-plus"></i> 新增</button>&nbsp; 
			<button class="btn btn-default" click="genmu"  type="button">所有聯系人</button>&nbsp; 
			
		</td>
		
		<td style="padding-left:10px">
		<input class="form-control" style="width:180px" id="key_{rand}"   placeholder="標題">
		</td>
		<td style="padding-left:10px">
			<button class="btn btn-default" click="search" type="button">搜索</button> 
		</td>
		<td width="90%">
			&nbsp;&nbsp;<span id="megss{rand}"></span>
		</td>
		<td align="right" nowrap>
			<button class="btn btn-default" click="daoru" type="button">導入個人通訊錄</button>&nbsp;&nbsp;
			<button class="btn btn-default"  click="daochu" type="button">導出</button>
		</td>
	</tr></table>
	</div>
	<div class="blank10"></div>
	<div id="view_{rand}"></div>
</td>
</tr>
</table>
