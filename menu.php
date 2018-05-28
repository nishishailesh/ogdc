<?php
function menu()
{	
	if($GLOBALS['nojunk']==TRUE){return;}

	echo '
<div class="container">
<div class="row">
<div class="col-md-12">	
	<table>		
			<tr>
				<td>
					<button  class=" btn btn-primary btn-block"  
							type=button onclick="showhidemenu(\'button2\')">Client
					</button>
						<table  id="button2" class="menu" style="position: absolute;display:none;z-index:100;">
						   <tr><td>
								   <form method=post style="display:inline">
										<button class="btn btn-primary btn-block"  
												formaction=client_details.php 
												type=submit 
												name=action 
												value="search|ogdc|Client_Detail" 
												onclick="hidemenu()" >Search</button>
									</form>
						   </td></tr>
							<tr><td>
									<form method=post style="display:inline">
										<button class="btn btn-primary btn-block"  
										formaction=client_details.php 
										type=submit 
										name=action 
										value="new|ogdc|Client_Detail"
										onclick="hidemenu()" >New</button>
									</form>
							 </td></tr>
						</table>
				</td>


				<td>
					<button  class=" btn btn-primary btn-block"  type=button onclick="showhidemenu(\'button3\')">Manage My Account('.$_SESSION['login'].')
					</button>
						<table  id="button3" class="menu" style="position: absolute;display:none;z-index:100;">
						   <tr><td>
								<form method=post style="display:inline">
									<button class="btn btn-primary btn-block"  
									formaction=index.php 
									type=submit 
									onclick="hidemenu()" 
									name=logout>Logout</button>
						   		</form>
							</td></tr>
							<tr><td>
								<form method=post style="display:inline">
									<button class="btn btn-primary btn-block"  
									formaction=change_password.php 
									type=submit 
									onclick="hidemenu()" 
									name=change_pwd>Change Password</button>
								</form>
							</td></tr>
						</table>	
				</td>
			</tr>
		</table>
	</div>
</div>
</div>	
	 ';

}

    //[^database] => ogdc
    //[^table] => Client_Detail
    //[action] => show_search_rows
    //[cb_Reg_No] => on
    //[Reg_No] => SUR/18/11223355
?>
