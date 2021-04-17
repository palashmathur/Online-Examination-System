function admin_validation()
{
       document.getElementById('s1').innerHTML=" ";	
  
       document.getElementById('s3').innerHTML=" ";	
  if(username() &&  password())
  {
	   //alert(" registration done!!  ");
	  adminform.submit();
   	  
  }  
}

function username()
{
a=document.getElementById('t1').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s1').innerHTML="enter valid user name";	
		 return false;
	}
}

function password()
{
a=document.getElementById('t3').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s3').innerHTML="enter valid password";	
		 return false;
	}
}/**
 * 
 */