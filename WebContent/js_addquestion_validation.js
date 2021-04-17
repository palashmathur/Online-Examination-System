function validation()
{
       document.getElementById('s1').innerHTML=" ";	
        document.getElementById('s2').innerHTML=" ";	
       document.getElementById('s3').innerHTML=" ";	
       document.getElementById('s4').innerHTML=" ";	
       document.getElementById('s5').innerHTML=" ";	
        document.getElementById('s6').innerHTML=" ";	
    //  t1              t3                t4              t5         
  if(question() &&  op_1() && op_2() && op_3() && op_4() && op_correct())
  {
	   //alert(" registration done!!  ");
	  add_question_form.submit();
   	  
  }  
}

function question()
{
a=document.getElementById('t1').value;	
	if(a.length>=5)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s1').innerHTML="enter valid question";	
		 return false;
	}
}
function op_1()
{
a=document.getElementById('t2').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s2').innerHTML="enter valid option 1";	
		 return false;
	}
}
function op_2()
{
a=document.getElementById('t3').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s3').innerHTML="enter valid option 2";	
		 return false;
	}
}
function op_3()
{
a=document.getElementById('t4').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         
		 document.getElementById('s4').innerHTML="password not option 3";	
		 return false;

	}
}
function op_4()
{
a=document.getElementById('t5').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s5').innerHTML="invalid mobile option 4";	
		 return false;
	}
}
function op_correct()
{
a=document.getElementById('t6').value;	
	if(a.length>=3)
	{
		return true;
	}
	else
	{ 
         document.getElementById('s6').innerHTML="invalid mobile correct answer";	
		 return false;
	}
}

/**
 * 
 */