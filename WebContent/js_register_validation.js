function validation()
{
       document.getElementById('s1').innerHTML=" ";	
    //    document.getElementById('s2').innerHTML=" ";	
       document.getElementById('s3').innerHTML=" ";	
       document.getElementById('s4').innerHTML=" ";	
       document.getElementById('s5').innerHTML=" ";	
    //    document.getElementById('s6').innerHTML=" ";	
    //  t1              t3                t4              t5         
  if(username() &&  password() && confirm_password() && mobile() && password_check())
  {
	   //alert(" registration done!!  ");
	  form1.submit();
   	  
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
}
function confirm_password()
{
a=document.getElementById('t4').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         
		 document.getElementById('s4').innerHTML="password not matched";	
		 return false;

	}
}
function mobile()
{
a=document.getElementById('t5').value;	
	if(a.length==10)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s5').innerHTML="invalid mobile number";	
		 return false;
	}
}
function password_check()
{
a=document.getElementById('t3').value;	

b=document.getElementById('t4').value;	
	if(a==b)
	{
		return true;
	}
	else
	{ 
         
         document.getElementById('s3').innerHTML="password not matched";
         document.getElementById('s4').innerHTML="password not matched";	
		 return false;

	}
}
