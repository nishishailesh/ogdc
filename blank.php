<?php
//example file to show its use, delete this line to make it work
exit(0);	//donot run anything, delete this line to make it work
session_start();
require_once 'config.php';
require_once '/var/gmcs_config/staff.conf';
require_once 'common_table_function.php';
require_once 'menu.php';
//my_print_r($_POST);

/*
 
 prepare menu entry as follows
 value=ACTION|DATABASE|TABLE
 ACTION={new|search}
 edit and delete are after search
 
	<form method=post style="display:inline">
		<button class="btn btn-primary btn-block"  
		formaction=client_details.php 
		type=submit 
		name=action 
		value="new|ogdc|Client_Detail"
		onclick="hidemenu()" >New</button>
	</form>

	This will create a facility to search,insert,edit,delete records.
	If any field needs to be readonly, supply it in $default array
	If no such defaults are required, no change is required in this file
*/

$ex=explode('|',$_POST['action']);
//print_r($ex);
if(count($ex)==3)
{
	$d=$ex[1];
	$t=$ex[2];
	$action=$ex[0];
}
else
{
	$d=$_POST['^database'];
	$t=$_POST['^table'];
	$action=$_POST['action'];	
}

if(isset($action))
{
	if($_POST['action']=='download')
	{
		$GLOBALS['nojunk']=TRUE;
	}
}

$link=set_session();



$pk=get_primary_key($link,$d,$t);	
$pka=array();
	foreach($pk as $pk_key)
	{
		if(isset($_POST[$pk_key['Field']]))
		{
			$pka[$pk_key['Field']]=$_POST[$pk_key['Field']];
		}
		else
		{
			$pka[$pk_key['Field']]='';
		}
	}

	if($action=='download')									
	{														
		download($link,$d,$t,$_POST['blob_field'],$pka);	
		exit(0);											
	}																	
	
////////////////////////////////////////////////////////////////
//table specific data///////////////////////////////////////////
///////////////////Field array for readonly data////////////////
$default=array();											////
////////End/////////////////////////////////////////////////////

head();
echo '<div class="row">';
echo '<div class="col-md-12">';
menu();
echo '</div>';
echo '</div>';

if($action=='search')
{
	search($link,$d,$t,$default);		
}
elseif($action=='new')
{
	add($link,$d,$t,$default);		
}
elseif($action=='show_search_rows')
{
	show_search_rows($link,$d,$t,$_POST);
	//shows multiple tables with same pk
	//search_tables($link,$d,array('Client_Detail','Obstetric_History'),$_POST);
}
elseif($action=='save')
{
	save($link,$d,$t,$_POST,$_FILES);
}
elseif($action=='insert')
{
	insert($link,$d,$t,$_POST,$_FILES);
}

////////////////////////////////////////////////////////////////
//table specific data///////////////////////////////////////////
//if $pka and $default is defined do not need to change     ////
elseif($action=='edit')										////
{															////
		edit($link,$d,$t,$pka,$default);					////
}															////
elseif($action=='delete')									////
{															////
		delete($link,$d,$t,$pka);							////
}															////
////////End/////////////////////////////////////////////////////

tail();
?>


