<?php
session_start();
require_once 'config.php';
require_once '/var/gmcs_config/staff.conf';
require_once 'common_table_function.php';
require_once 'menu.php';
//my_print_r($_POST);

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

$dk=get_dependant_table($link,$d,$t);

//my_print_r($dk);


$pk=get_primary_key($link,$d,$t);	
$pka=array();
$pka_value=false;

	foreach($pk as $pk_key)
	{
		if(isset($_POST[$pk_key['Field']]))
		{
			$pka[$pk_key['Field']]=$_POST[$pk_key['Field']];
			$pka_value=true;
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
menu();

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
}

elseif($action=='show_search_details')
{
	show_search_rows_by_pka($link,$d,$t,$pka);
	show_parent_rows($link,$d,$t,$pka);
	show_dependent_rows($link,$d,$t,$pka);
	add_dependent_rows($link,$d,$t,$pka);
}

elseif($action=='save')
{
	save($link,$d,$t,$_POST,$_FILES);
	show_search_rows_by_pka($link,$d,$t,$pka);
}
elseif($action=='insert')
{
	insert($link,$d,$t,$_POST,$_FILES);
	show_search_rows_by_pka($link,$d,$t,$pka);
}

////////////////////////////////////////////////////////////////
//table specific data///////////////////////////////////////////
//if $pka and $default is defined do not need to change     ////
elseif($action=='edit')										////
{															////
		edit($link,$d,$t,$pka,$pka);						////
		//edit($link,$d,$t,$pka,$default);					////
}															////
elseif($action=='delete')									////
{															////
		delete($link,$d,$t,$pka);							////
}															////
////////End/////////////////////////////////////////////////////

tail();
?>

