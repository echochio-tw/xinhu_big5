<?php 
/**
*	桌面首頁項(會議)
*/
defined('HOST') or die ('not access');

?>
<script>
moremeets=function(){
	addtabs({num:'meet',url:'flow,page,meet,atype=today',name:'今日會議'});
}
homeobject.showmeetlist=function(a){
	var s='',a1,i;
	$('#homemeetlist a[temp]').remove();
	for(i=0;i<a.length;i++){
		a1=a[i];
		s+='<a temp="list" onclick="openxiangs(\'會議\',\'meet\',\''+a1.id+'\');" class="list-group-item">◇'+a1.title+'</a>';
	}
	$('#homemeetlist').append(s);
}
</script>
<div align="left"  id="homemeetlist" class="list-group">
<div class="list-group-item  list-group-item-success">
	<i class="icon-flag"></i> 今日會議
	<a style="float:right" onclick="moremeets()">更多&gt;&gt;</a>
</div>

</div>