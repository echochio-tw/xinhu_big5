/**
*	bootstable 表格插件
*	caratename：chenxihu
*	caratetime：2014-04-06 21:40:00
*	email:qqqq2900@126.com
*	homepage:www.xh829.com
*/

(function ($) {
	
	function bootstable(element, options){
		var obj		= element;
		var can		= options;
		var rand	= js.getrand(); 
		var me		= this;
		this.data	= can.data;
		this.count	= 0;
		this.page	= 1;
		this.changedata = {};
		this.changeid = 0;
		this.bool	= false;
		this.where	= can.where;
		this.highorderstr = '';
		this.otherparams = {};
		this.loadci = 0;
		this.options= can;
		this.init	= function(){
			this.tablename=can.tablename;
			can.tablename=jm.encrypt(can.tablename);
			this._init();
			this._create();
			if(can.autoLoad){
				this._loaddata(1);
			}
			if(can.fanye)this._fanye();
		};
		this.getData= function(fid){
			var a = this.data;
			if(fid)a= this.json[fid];
			if(!isNaN(fid))a= this.data[fid];
			return a;
		};
		this.getCount= function(){
			return this.count;
		};
		this.getJson= function(){
			return this.json;
		};
		this._init	= function(){
			var sas = can.modedir;
			if(!sas)sas='index:';
			sas 	= sas.split(':');
			if(can.url=='')can.url = js.getajaxurl('publicstore', sas[0], sas[1]);
			if(can.cellurl=='')can.cellurl = js.getajaxurl('publicsavevalue', sas[0], sas[1]);
			this.setColumns(can.columns);
			s='<div style="position:relative;'+can.bodyStyle+'" id="tablebody_'+rand+'"></div><div id="tablefanye_'+rand+'"></div>';
			obj.html(s);
			$('#tablebody_'+rand+'').scroll(function(){
				me._scrollTopla($(this));
			});
		};
		this.setColumns=function(cols){
			can.columns=cols;var a,i;
			for(i=0; i<can.columns.length; i++){
				a = can.columns[i];
				if(typeof(a.align)=='undefined')can.columns[i].align='center';
				if(a.dataIndex=='caozuo')can.columns[i] = this._caozuochengs(a,i);
			}
		};
		this._create	= function(){
			var a	= can.columns;
			var s 	= '',i,len=a.length,val,s1,s2='',cols,s3='',s4='',s5='',le,st,ov,j,j1,na,attr,sty='',hs='',dis,dlen=this.data.length;
			s+='<table id="tablemain_'+rand+'" class="table table-striped table-bordered table-hover" style="margin:0px">';
			if(!can.hideHeaders){
				s+='<thead><tr><th width="40"></th>';
				if(can.checked)s+='<th width="40"><div align="center"><input id="seltablecheck_'+rand+'" type="checkbox"></div></th>';
				for(i=0;i<len;i++){
					hs = '';
					attr = '';
					cols = a[i].colspan;
					if(can.sort == a[i].dataIndex)hs='style="color:#3399FF"';
					if(a[i].width)attr+=' width="'+a[i].width+'"';
					if(a[i].tooltip)attr+=' title="'+a[i].tooltip+'"';
					if(cols && cols>1)attr+=' colspan="'+cols+'"';
					s+='<th nowrap '+attr+'><div '+hs+' align="'+a[i].align+'" lfields="'+a[i].dataIndex+'">';
					if(can.celleditor&&a[i].editor)s+='<i class="icon-pencil"></i>&nbsp;';
					s+=a[i].text;
					if(a[i].sortable){
						s+='&nbsp;';
						if(can.sort == a[i].dataIndex){
							s+='<i tempsort="'+i+'" lx="'+((can.dir=='desc')?'asc':'desc')+'" class="icon-sort-'+((can.dir=='desc')?'down':'up')+' cursor"></i>';
						}else{
							s+='<i tempsort="'+i+'" lx="desc" class="icon-sort cursor"></i>';
						}
					}
					s+='</div></th>';
					if(cols>1)i=i+cols-1;
				}
				s+='</tr></thead>';
			}
			s+='<tbody id="tbody_'+rand+'">';
			
			s+='</tbody></table>';
			$('#tablebody_'+rand+'').html(s);
			for(j=0;j<dlen;j++){
				s=this.createrows(j);
				$('#tbody_'+rand+'').append(s);
			}
			s='';
			this.trobj = obj.find('tr[dataid]');
			this.trobj.click(function(event){
				me._itemclick(this, event);
			});
			this.trobj.dblclick(function(event){
				me._itemdblclick(this, event);
			});
			if(typeof(can.celldblclick)=='function'){
				obj.find('td[cell]').dblclick(function(event){
					me._celldblclick(this, event);
				});
			}
			$('#seltablecheck_'+rand+'').click(function(){
				js.selall(this, 'tablecheck_'+rand+'');
			});
			
			if(can.celleditor){
				var o = obj.find('td[fields]');
				o[can.celledittype](function(){
					me._celleditla(this);	
				});
			}
			obj.find('i[tempsort]').click(function(){
				me._clickorder(this);
			});
			obj.find("a[temp='caozuomenu_"+rand+"']").click(function(){
				me._caozuochengss(this);
				return false;
			});
		};
		this.insert=function(d, funs){
			d = js.apply({id:'auto'}, d);
			this.data.push(d);
			var j = this.data.length-1;
			var s=this.createrows(j);
			this.count++;
			$('#tbody_'+rand+'').append(s);
			if(typeof(funs)=='function'){
				funs(this,j);
			}
		};
		this.createrows=function(j){
			var a	= can.columns;
			var s 	= '',i,len=a.length,val,s1,s2='',s3='',s4='',s5='',le,st,ov,j,j1,na,attr,sty='',hs='',dis;
			ov	= this.data[j];
			s3 	= can.rendertr(ov, this, j);
			s4  = can.rowsbody(ov, this, j);
			if(s4)s5='rowspan="2"';
			if(!s3 && ((can.statuschange && ov.status==0) || (ov.ishui==1) || (ov.status==5)))s3='style="color:#aaaaaa"';
			s='<tr oi="'+j+'" dataid="'+ov.id+'" '+s3+'>';
			s+='<td '+s5+' align="right" width="40">'+(j+1+can.pageSize*(this.page-1))+'</td>';
			if(can.checked){
				dis = '';
				if(ov.checkdisabled)dis='disabled';
				s+='<td align="center" width="40"><input oi="'+j+'" name="tablecheck_'+rand+'" '+dis+' value="'+ov.id+'" type="checkbox"></td>';
			}	
			for(i=0;i<len;i++){
				na	= a[i].dataIndex;
				val = ov[na];
				attr= '';
				sty = '';
				if(isempt(val)){
					val = '';
					this.data[j][na]=val;
				}
				if(a[i].type == 'checkbox'){
					s1 = '<img height="20" width="20" src="images/checkbox'+val+'.png">';
				}else{
					s1 = val;
				}
				if(typeof(a[i].renderer)=='function'){
					s3 = a[i].renderer(val, ov, j);
					if(!isempt(s3))s1=s3;
				}
				s2 = '';
				if(i == 0 && can.tree){
					st = ov.stotal;
					le = ov.level;
					for(j1=1;j1<le;j1++)s2+='<img src="images/white.gif" class="icons">&nbsp; ';
					s2 += '<i class="icon-'+((st>0)?'folder-close-alt':'file-alt')+'"></i>&nbsp;';
				}
				if(can.celleditor &&a[i].editor)attr+=' fields="'+na+'"';
				if(a[i].width)attr+=' width="'+a[i].width+'"';
				if(typeof(a[i].renderstyle)=='function'){
					s3 = a[i].renderstyle(val, ov, j);
					if(!isempt(s3))sty+=''+s3+';';
				}
				s+='<td align="'+a[i].align+'" '+attr+' style="'+sty+'" row="'+j+'" cell="'+i+'">'+s2+''+s1+'</td>';
			}
			s+='</tr>';
			if(s4)s+='<tr><td colspan="'+(len+1)+'">'+s4+'</td></tr>';
			return s;
		};
		this._celldblclick = function(o1,e){
			var o = $(o1);
			var cell = parseFloat(o.attr('cell')), row = parseFloat(o.attr('row'));
			var farr = can.columns[cell],
				d 	 = this.data[row];
			can.celldblclick(farr, d, o1, cell, row, e);	
		};
		this._scrollTopla= function(o){
			if(can.hideHeaders)return;
			var top = o.scrollTop();
			if(top<40){
				var o1 = $('#headerla_'+rand+'');
				o1.hide();
				o1.html('');
			}else{
				var off = obj.offset();
				var a = can.columns,s='',i,len=a.length,w1,o2;
				if(!get('headerla_'+rand+'')){
					s = '<div style="position:fixed;left:'+(off.left)+'px;top:'+(off.top)+'px;width:100%;height:34px;overflow:hidden; background:rgba(255,255,255,0.5);border-bottom:1px #dddddd solid;z-index:2" id="headerla_'+rand+'"></div>';
					obj.append(s);
				}
				var o1 = $('#headerla_'+rand+'');
				o1.show();
				o1.css({left:''+(off.left)+'px',top:''+(off.top)+'px',width:''+($('#tablemain_'+rand+'').width())+'px'});
				if(o1.html()==''){
					s = '';
					s+='<table class="table table-striped table-bordered" style="margin:0px" width="100%">';
					s+='<tr style="background:white"><th width="40"></th>';
					if(can.checked)s+='<th width="40"></th>';
					for(i=0;i<len;i++){
						o2 = obj.find("div[lfields='"+a[i].dataIndex+"']");
						w1 = o2[0].clientWidth-1;
						w1 = 'width:'+w1+'px';
						s+='<th><div style="'+w1+'" align="'+a[i].align+'">'+o2.html()+'</div></th>';
					}
					s+='</tr>';
					s+='</table>';
					o1.html(s);
				}
			}
		};
		this._celleditla = function(o1){
			if(this.bool)return;
			var o 		= $(o1),
				fields  = o.attr('fields'),
				row		= parseFloat(o.attr('row')),
				cell	= parseFloat(o.attr('cell'));
			var a		= this.data[row],i,len,sel,d,
				b		= can.columns[cell],
				l		= o.offset(),
				w		= o1.clientWidth,
				h		= o1.clientHeight,
				at		= '',
				v		= a[fields];
			$('#edittable_'+rand+'').remove();
			if(b.editorbefore && !b.editorbefore(a))return; //編輯前判斷
			var s	= '<div id="edittable_'+rand+'" style="position:absolute;z-index:2;left:'+(l.left)+'px;top:'+(l.top+h)+'px">';
			s+='<div style="border:1px #cccccc solid;background:white;padding:10px;box-shadow:0px 0px 10px rgba(0,0,0,0.3); border-radius:10px">';
			s+='	<div>&nbsp;<b>'+b.text+'</b>：&nbsp;<span id="msgteita_'+rand+'"></span></div>';
			s+='	<div class="blank10"></div>';
			var wss = 200;
			if(b.editorwidth)wss=b.editorwidth;
			var flx = b.type,attr=b.editorattr;
			if(!flx)flx='text';
			if(!attr)attr='';
			if(flx=='checkbox'){
				if(v=='1')at='checked';
				s+='<div><label><input type="checkbox" id="inputedit_'+rand+'" '+at+' value="1"> '+b.text+'</label></div>';
			}else if(flx=='textarea'){
				s+='<div><textarea type="text" style="width:'+wss+'px;height:100px" '+attr+' id="inputedit_'+rand+'" class="input">'+v+'</textarea></div>';
			}else if(flx=='select' && b.store){
				d=b.store;
				s+='<div><select style="width:'+wss+'px" id="inputedit_'+rand+'" '+attr+' class="input">';
				len=b.store.length;for(i=0;i<len;i++){
					sel='';if(d[i][0]==v||d[i][1]==v)sel='selected';
					s+='<option value="'+d[i][0]+'" '+sel+'>'+d[i][1]+'</option>';
				}
				s+='</select></div>';
			}else if(flx=='date'){	
				s+='<div><input type="text" style="width:'+wss+'px" id="inputedit_'+rand+'" '+attr+' class="input datesss" onclick="js.datechange(this)" readonly value="'+v+'"></div>';
			}else{
				s+='<div><input type="'+flx+'" style="width:'+wss+'px" id="inputedit_'+rand+'" '+attr+' class="input" value="'+v+'"></div>';
			}
			s+='	<div class="blank10"></div>';
			if(!can.cellautosave)s+='	<div><a  id="inputeditsave_'+rand+'" href="javascript:"><i class="icon-ok"></i> 確定</a >&nbsp;  &nbsp; <a href="javascript:" class="hui" onclick="$(\'#edittable_'+rand+'\').remove()"><i class="icon-remove"></i> 取消</a></div>';
			s+='</div>';
			s+='<div align="center"><div class="arrow-down"></div></div>';
			s+='</div>';
			$('body').append(s);
			var o2 = get('edittable_'+rand+'');
			var jg = (w-o2.clientWidth)*0.5;
			$(o2).css({left:''+(l.left+jg)+'px',top:''+(l.top-o2.clientHeight)+'px'});
			var o3 = get('inputedit_'+rand+'');
			o3.focus();
			$(o3).keyup(function(e){
				if(e.keyCode==13)this.blur();
			});
			var arr = {oldvalue:v,fields:fields,type:b.type,id:a.id,obj:o,row:row}
			if(can.cellautosave){
				$(o3).blur(function(){
					me._editforcuschen(this, arr, b);
				});
			}else{
				$('#inputeditsave_'+rand+'').click(function(){
					me._editforcuschen(this, arr, b);
				});
			}
		};
		this.signature= function(da, url){
			var time = parseInt(js.now('time')*0.001);
			var siaa = ''+NOWURL+''+url+''+da.tablename+''+time+'_'+adminid+'';
			var sign = md5(siaa);
			da.sys_signature= sign;
			da.sys_timeature= time;
			return da;
		};
		this._editforcuschen = function(o1, a, farr){
			var o1= get('inputedit_'+rand+'');
			var v = o1.value,ov = a.oldvalue;
			if(a.type=='checkbox')if(!o1.checked)v='0';
			var selv= v+'';
			if(a.type=='select')selv=o1.options[o1.selectedIndex].text;
			if(v==ov || selv==ov){
				$('#edittable_'+rand+'').remove();
				return;
			}
			var vid = 'msgteita_'+rand+'';
			js.setmsg('處理中...','#ff6600',vid);
			o1.disabled = true;
			this.bool = true;
			var data = {tablename:can.tablename,id:a.id,fieldname:a.fields,value:v,fieldsafteraction:can.fieldsafteraction};
			$.ajax({
				data:this.signature(data, can.cellurl),type:'post',url:can.cellurl,
				success:function(bstr){
					me.bool = false;
					$('#edittable_'+rand+'').remove();
					if(bstr!='success'){
						js.msg('msg', bstr);
						return;
					}
					js.setmsg('處理完成','green',vid);
					var ohtml = a.obj.html();
					ohtml	  = ohtml.replace(ov, v);
					if(a.type=='checkbox')ohtml='<img height="20" width="20" src="images/checkbox'+v+'.png">';
					if(a.type=='select')ohtml=selv;
					a.obj.html(ohtml);
					me.data[a.row][a.fields] = v;
					if(farr.editorafter)farr.editorafter();//保存後處理
				},
				error:function(e){
					js.msg('msg',e.responseText);
					me.bool = false;
				}
			});
		};
		this._itemclick= function(o1, e){
			this.trobj.css('background','');
			var o = $(o1);
			o.css('background', can.selectColor);
			var oi = parseFloat(o.attr('oi'));
			var a  = this.data[oi];
			this.changedata = a;
			this.changeid	= a.id;
			can.itemclick(a, oi, e);
		};
		this._itemdblclick= function(o1, e){
			var o 	= $(o1),oi,lxs,o1,cell,farr,o2;
			oi 	= parseFloat(o.attr('oi'));
			o2  = e.target;
			lxs = o2.nodeName.toLowerCase();
			if(lxs!='td'){
				o2  = e.target.parentNode;
				lxs = o2.nodeName.toLowerCase();
			}
			if(lxs=='td'){
				o1  = $(o2);
				cell= parseFloat(o1.attr('cell'));
				farr= can.columns[cell];
				if(farr.editor)return;//單元格是編輯就退出
			}
			can.itemdblclick(this.changedata, oi, e);
		};
		this._loaddata = function(p, donbo){
			if(this.bool)return;
			this.changeid= 0;
			this.loadci++;
			this.changedata = {};
			var url = can.url;
			var das	= {tablename_abc:can.tablename,defaultorder:can.defaultorder,keywhere:can.keywhere,where:this.where,sort:can.sort,dir:can.dir,loadci:this.loadci,storebeforeaction:can.storebeforeaction,storeafteraction:can.storeafteraction,modenum:can.modenum},
			s='',of=obj.offset();
			das.keywhere=jm.encrypt(das.keywhere.replace(/\'/g, '[F]'));
			das.where = jm.encrypt(das.where.replace(/\'/g, '[F]'));
			das.start = can.pageSize*(p-1);
			das.limit = can.pageSize;
			if(!can.fanye)das.limit = can.limit;
			das		  = js.apply(das, can.params);
			das		  = js.apply(das, this.otherparams);
			if(donbo)return das;
			this.page = p;
			var o1 = $('#tablebody_'+rand+'');
			var h= o1.height()-2,w= o1.width()-2;
			s='<div id="modeshow_'+rand+'" style="filter:Alpha(opacity=20);opacity:0.2;height:'+h+'px;width:'+w+'px;overflow:hidden;z-index:3;position:absolute;left:1px;line-height:'+h+'px;top:1px;background:#000000;color:white" align="center"><img src="images/mloading.gif"  align="absmiddle">&nbsp;加載中...</div>';
			o1.append(s);
			can.beforeload();
			this.bool = true;
			$.ajax({
				url:url,type:'POST',data:das,
				success:function(da){
					if(!get('tablebody_'+rand+''))return;
					var a = js.decode(da);
					if(!a.rows){
						if(a.msg)da=a.msg;
						js.msg('msg',da);
					}else{
						me._loaddataback(a);
					}
					$('#modeshow_'+rand+'').remove();
					me.bool = false;
				},
				error: function(e){
					$('#modeshow_'+rand+'').remove();
					js.msg('msg',e.responseText);
					me.bool = false;
				}
			});
		};
		this.exceldown = function(bt, lxs){
			if(this.bool)return;
			var excelfields='',excelheader='',i,a=can.columns;
			var np	= (lxs==2) ? this.page : 1;
			var das = this._loaddata(np, true);
			das.limit = 10000;
			das.execldown 	= 'true';
			if(!bt)bt=nowtabs.name;
			das.exceltitle	= bt;
			for(i=0;i<a.length;i++){
				if(!a[i].notexcel){
					excelfields+=','+a[i].dataIndex+'';
					excelheader+=','+a[i].text+'';
				}
			}
			das.excelfields = excelfields.substr(1);
			das.excelheader = excelheader.substr(1);
			if(lxs==1)return das;
			if(lxs==2){
				das.limit	= can.pageSize;
			}
			das.exceltitle  = jm.encrypt(das.exceltitle);
			das.excelfields = jm.encrypt(das.excelfields);
			das.excelheader = jm.encrypt(das.excelheader);
			this.bool = true;
			js.msg('wait', '導出處理中...');
			$.ajax({
				url:can.url,type:'POST',data:das,dataType:'json',
				success:function(a1){
					js.msg('success', '處理成功，共有記錄'+a1.totalCount+'條/導出'+a1.downCount+'條，點我直接<a class="a" href="'+a1.url+'" target="_blank">[下載]</a>', 60);
					me.bool=false;
				},
				error:function(e){
					js.msg('msg','err:'+e.responseText);
					me.bool = false;
				}
			});
		};
		this.exceldownnow = function(bt){
			this.exceldown(bt,2);
		};
		this.setparams = function(cans, relo){
			if(!cans)cans={};
			this.otherparams = js.apply(this.otherparams,cans);
			this.page = 1;
			if(relo)this.reload();
		};
		this._loaddataback=function(a){
			this.json = a;
			this.data = a.rows;
			this.count = a.totalCount;
			can.loadbefore(a, this);
			this._create();
			this._initfany();
			can.load(a, this, this.loadci);
		};
		this.loadData = function(d){
			this._loaddataback(d);
		};
		this._clickorder = function(o1){
			if(this.loadci==0)return;
			var o,oi,a,dir,sort;
			o  = $(o1);
			oi = parseFloat(o.attr('tempsort'));
			a  = can.columns[oi];
			sort = a.dataIndex;
			dir  = o.attr('lx');
			this.order(sort, dir);
		};
		this.remove	= function(ids){
			var sid = ids.split(','),id,i;
			for(i=0;i<sid.length;i++){
				id	= sid[i];
				obj.find("tr[dataid='"+id+"']").remove();
				if(id == this.changeid){
					this.changeid= 0;
					this.changedata = {};
				}
			}
		};
		this.order	= function(a, b){
			if(!a)return;
			if(!b)b='asc';
			can.sort = a;
			can.dir  = b;
			this.reload();
		};
		this.highorder	= function(str){
			if(!str)str='';
			this.highorderstr = str;
			this.reload();
		};
		this.search = function(w, jg, slx){
			if(!w)w='';
			if(jg)w = this.where+' '+w;
			var s = can.outsearch(this);
			if(s)w+=' '+s+'';
			this.where = w;
			this._loaddata(1);
			return w;
		};
		this.reload = function(){
			this._loaddata(this.page);
		};
		this.del	= function(csa){
			if(this.bool)return;
			var a 	= js.apply({msg:'確定要刪除選中的{s}條記錄嗎？',success:function(){},checked:false,check:function(){}},csa);
			var s	= ''+this.changeid+'',xz;
			if(a.checked)s=this.getchecked();
			if(s=='0'||s==''){
				js.msg('msg','沒有選中記錄');
				return;
			}
			xz		= s.split(',').length;
			a.msg 	= a.msg.replace('{s}', ''+xz+'');
			js.confirm(a.msg,function(lx){
				a.check(lx);
				if(lx=='yes'){
					me._delok(s, a);
				}
			});
		};
		this.getchecked = function(){
			return js.getchecked('tablecheck_'+rand+'');
		};
		this.getcheckobj = function(){
			return $("input[name='tablecheck_"+rand+"']");
		};
		this.getcheckdata= function(){
			var o = this.getcheckobj(),len=o.length,i,o1,d=[];
			for(i=0;i<len;i++){
				o1=o[i];
				if(o1.checked){
					oi=parseFloat($(o1).attr('oi'));
					d.push(this.data[oi]);
				}
			}
			return d;
		};
		this._delok	= function(sid, ds){
			js.msg('wait','刪除'+sid+'中...');
			this.bool=true;
			var url = ds.url;if(!url)url=js.getajaxurl('publicdel','index');
			var ss 	= js.apply({modenum:can.modenum,table:can.tablename,id:sid},ds.params);
			$.ajax({
				url:url,type:'POST',data:ss,dataType:'json',
				success:function(a1){
					me.bool=false;
					if(a1.code==200){
						js.msg('success','刪除成功');
						ds.success();
						me.reload();
					}else{
						js.msg('msg',a1.msg);
					}
				},
				error:function(e){
					js.msg('msg','err:'+e.responseText);
					me.bool = false;
				}
			});
		};
		
		this._fanye	= function(){
			var s = '';
			s='<div style="margin-top:10px" class="btn-toolbar" role="toolbar">'+
				'<div class="btn-group">'+
					'<button id="shouye_'+rand+'" type="button" data-toggle="tooltip" data-placement="top" title="首頁"  class="btn btn-default">&laquo;</button>'+
					'<button id="shang_'+rand+'" data-toggle="tooltip" data-placement="top" title="上一頁" type="button" disabled class="btn btn-default">&lt;</button>'+
					'<button id="nowye_'+rand+'" type="button" disabled class="btn btn-default"> 第<span id="pages_'+rand+'">1</span>頁/共<span id="maxpage_'+rand+'">0</span>頁 <span class="caret"></span></button>'+
					'<button id="next_'+rand+'" type="button" data-toggle="tooltip" data-placement="top" title="下一頁" disabled class="btn btn-default">&gt;</button>'+
					'<button id="lastye_'+rand+'" type="button" data-toggle="tooltip" data-placement="top" title="尾頁" disabled class="btn btn-default">&raquo;</button>'+
				'</div> '+ 
				'<div class="btn-group">'+
				'	 <button id="refresh_'+rand+'" type="button" data-toggle="tooltip" data-placement="top" title="刷新"  class="btn btn-default"><i class="icon-refresh"></i></button>'+ 
				'</div> '+ 
				'<div class="btn-group" style="float:right; padding-top:3px">'+
					'<span>共記錄<span id="zjilu_'+rand+'">0</span>條</span> &nbsp;'+ 
					'每頁<input maxlength="3" onblur="js.number(this)" onfocus="js.focusval=this.value" id="pagesize_'+rand+'" type="number" value="'+can.pageSize+'" style="width:40px;text-align:center;height:24px;border:1px #dddddd solid;margin:0px 2px;font-size:12px">條&nbsp;'+
				'</div>'+
			'</div>';

			$('#tablefanye_'+rand+'').html(s);
			$('#shouye_'+rand+'').click(function(){me.firstPage();});
			$('#shang_'+rand+'').click(function(){me.backPage();});
			$('#next_'+rand+'').click(function(){me.nextPage();});
			$('#lastye_'+rand+'').click(function(){me.lastPage();});
			$('#refresh_'+rand+'').click(function(){me.reload();});
			$('#nowye_'+rand+'').rockmenu({
				top:33,width:150,
				data:[{name:'第1頁',p:1}],
				beforeshow:function(o){
					o.setData(me._getpaged());
					o.setValue('第'+me.page+'頁');
				},
				itemsclick:function(a){
					me.gotoPage(a.p);
				}
			});
			var o1 = $('#pagesize_'+rand+'');
			o1.blur(function(){me.setpageSize(this.value);});
			o1.keyup(function(e){if(e.keyCode==13)this.blur()});
		};
		this._getpaged = function(){
			var a = [],i=1,j=1,b,bg;
			i = this.page-5;
			j = this.page+5;
			if(i<1)i=1;
			if(j>this.maxPage)j=this.maxPage;
			for(b=i;b<=j;b++){
				a.push({name:'第'+b+'頁',p:b});
			}
			return a;
		};
		this._initfany = function(){
			if(!can.fanye)return;
			$('#zjilu_'+rand+'').html(''+this.count+'');
			$('#pages_'+rand+'').html(''+this.page+'');
			this.maxPage	= Math.ceil(this.count/can.pageSize);
			$('#maxpage_'+rand+'').html(''+this.maxPage+'');
			
			var bo1=false,bo2=false;
			if(this.maxPage <=1 || this.page<=1){
				bo1 = true;
			}
			get('shouye_'+rand+'').disabled=bo1;
			get('shang_'+rand+'').disabled=bo1;
			
			if(this.maxPage <=1){
				get('nowye_'+rand+'').disabled=true;
			}else{
				get('nowye_'+rand+'').disabled=false;
			}
			
			if(this.maxPage <=1 || this.page>=this.maxPage){
				bo2 = true;
			}
			get('next_'+rand+'').disabled=bo2;
			get('lastye_'+rand+'').disabled=bo2;
		};
		this._next	= function(oi){
			var p = this.page+oi;
			if(p<=0)p=1;
			if(p>=this.maxPage)p=this.maxPage;
			this._loaddata(p);
		};
		this.firstPage = function(){
			this._loaddata(1);
		};
		this.backPage = function(){
			this._next(-1);
		};
		this.nextPage = function(){
			this._next(1);
		};
		this.gotoPage = function(p){
			this._loaddata(p);
		};
		this.lastPage = function(){
			this._loaddata(this.maxPage);
		};
		this.setpageSize = function(p){
			p = parseFloat(p);
			if(p<=0)p=can.pageSize;
			$('#pagesize_'+rand+'').val(''+p+'');
			if(can.pageSize == p)return;
			can.pageSize = p;
			this.page	 = 1;
			this.reload();
		};
		
		this._caozuochengs=function(a,oj){
			a.renderer=function(v,d,oi){
				var s='<a oi="'+oi+'" oj="'+oj+'" temp="caozuomenu_'+rand+'">操作<i class="icon-angle-down"></i></a>';
				if(!d.id)s='&nbsp;';
				return s;
			};
			a.notexcel=true;
			return a;
		};
		this._caozuochengss=function(o1){
			var oi,d,num,mid,modename,o2;
			o2= $(o1);
			oi= parseFloat(o2.attr('oi'));
			oj= parseFloat(o2.attr('oj'));
			d = this.getData(oi);
			num=can.modenum;if(num=='')num=this.tablename;
			mid = d.id;if(d.modenum)num=d.modenum;
			modename=can.modename;if(d.modename)modename=d.modename;
			new optmenuclass(o1,num,mid,this,modename,oi,can.columns[oj]);
		};
		
		
		this.geturlparams=function(bt,ocans){
			var cshu = this.exceldown(bt, 1),i;
			cshu.tablename_abc = jm.uncrypt(cshu.tablename_abc);
			cshu = js.apply(cshu,ocans);
			return [can.url, cshu];
		}
	};
	
	/**
		表格中常用方法
		1、reload(); //刷新數據源
		2、getchecked();//獲取復選框對應記錄ID聚
		3、getcheckdata();//獲取復選框選中的數據數組[]
		4、insert({name:''});//表格中插入一行
		5、setparams({key:''},true);//設置參數並搜索
		6、geturlparams();獲取當前Url地址參數,訂閱時用到的
	*/
	
	
	$.fn.bootstable	= function(options){
		var defaultVal = {
			columns:[],		//表頭
			selectColor:'#DFF0D8', //選中時行顏色
			pageSize:15,   	//默認分頁數
			limit:0,		//沒有分頁時展示條數
			bodyStyle:'',	
			height:0,		//高度
			url:'',			//請求地址
			celleditor:false,	//是否可編輯單元格
			cellautosave:true,	//編輯單元格是否自動保存
			celledittype:'dblclick', //編輯單元格用雙擊
			cellurl:'',  			//編輯單元格保存地址
			fieldsafteraction:'', 	//編輯單元格時保存後觸發
			data:[],				//初始數據
			autoLoad:true,			//是否初始化後就加載
			tree:false,				//是否樹形顯示
			itemdblclick:function(){},	//雙擊行調用
			searchwidth:500,  //沒用
			defaultorder:'', //默認排序
			where:'',   //條件
			hideHeaders:false, //是否隱藏頭部表頭
			modename:'',  //對應模塊名稱
			modenum:'',   //對應模塊編號
			statuschange:true,  //當行的status=0時自動變成灰色
			checked:false, //是否多選
			fanye:false,  //是否可翻頁
			sort:'',  //排序字段
			dir:'',   //排序類型desc和asc
			storeafteraction:'',  //數據源請求後先處理函數
			storebeforeaction:'',//數據源請求時先處理函數，可返回條件字段等
			
			modedir:'',  //當前文件路徑，一般都是寫：'{mode}:{dir}'
			keywhere:'', //條件
			params:{},   //其他參數
			tablename:'', //請求數據表格名，如有指定modenum，會加載對應模塊上設置的表
			selectcls:'success', //選中樣式
			itemclick:function(da, index, e){},  //單擊行觸發
			beforeload:function(){}, //數據加載前觸發
			load:function(){}, //數據加載完成後觸發
			loadbefore:function(){}, //數據加載完成後但還沒有渲染出來時觸發
			outsearch:function(){return  ''}, //外搜索條件
			searchview:'',  //沒用
			rendertr:function(){return  ''}, //少用
			rowsbody:function(){return ''}, //少用
			celldblclick:false //沒用
		};
		if(typeof(bootstableobj)=='undefined')bootstableobj={};
		var can = $.extend({}, defaultVal, options);
		var clsa = new bootstable($(this), can);
		clsa.init();
		if(can.modenum!='')bootstableobj[can.modenum]=clsa;
		return clsa;
	};
})(jQuery);