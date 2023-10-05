<!--  �\���`110916041  -->
<!--  �������Ƭۥ[���,�Ы��Ӷ����I��A operator B
 	    �ŦX�������зǡG1. �䴩��ƥ[����p��A2.�䴩�p�� �A3. ��L�S�O���Υ\��
 	    �۵��G100    -->

<!--  �ϥλ���
	   ���ƿ�J�p���I�A�ӼƷ|�H��J�ĤG�Ӥp���I�H�e���ƭp��   �d�ҡG123.3.5   �|�o��  123.3
            %�G�p��4 + 5 ��% �A�Y4 + 5 %  �|�o��0.09   -->

<!--  �i�䴩a+b+c+d�A���@�w�C�����n��=
            ���O�p�G��J1+2*3 �|�o��9�A�S��k��������[��    -->

<%@ page contentType="text/html; charset=Big5"%>

<%!
	boolean pointUse1 = true;   	 //�P�_�Ʀr�O�_�w�ϥΤp���I
	boolean pointUse2 = true;   	 //�P�_�Ʀr�O�_�w�ϥΤp���I
	double calculate = 0;       	 //�ΨӰO����Ƹg�B��᪺��
	double front = 0;           	 //��ƹB�⪺�Ĥ@�ӼƦr
	double back = 0;				 //��ƹB�⪺�ĤG�ӼƦr
	String operator = "";			 //����operator
	String[] input = new String[3];  //String[0,1] �soperand  String[2]�soperator
%>
<%!
	boolean isNumeric(String str){          //�P�_�I�����O�_���Ʀr
		for(int i=str.length();--i>=0;){   
			int chr=str.charAt(i);   
	   		if(chr<48 || chr>57)   
	      		return false;   
		}   
		return true;   
} 
%>

<HTML>
<HEAD>
<TITLE>Calculator</TITLE>
</HEAD>
<style>
  #text{
  	width:90%;
  	height:15%;
  	border:2px solid;
  	margin:10px auto;
  	background-color:#D4F0F7;
  }
  .delete, .C, .CE, .percent, .reciprocal, .square, .root, .devide,
  .time, .minus, .plus, .sin, .cos, .log, ._2x, .ln, .ex, .xPlus, ._10x{
  	width:21%;
  	height:12%;
  	font-size:20px;
  	color:black;
  	margin-left:1.8%;
  	background-color:#B0E8F8;
  	border-color:#9DDCFF;
  	margin-top:0.5%;
  	border-radius:10px;
  }
   .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .PN, .zero, .point{
   	width:21%;
  	height:12%;
  	font-size:20px;
  	color:black;
  	margin-left:1.8%;
  	background-color:#E3F7FD;
  	border-color:#9DDCFF;
  	margin-top:0.5%;
  	border-radius:10px;
   }
   .equal{
   	width:21%;
  	height:12%;
  	font-size:20px;
  	color:black;
  	margin-left:1.8%;
  	background-color:#54C5E8;
  	border-color:#9DDCFF;
  	margin-top:0.5%;
  	border-radius:10px;
   }
</style>

<BODY>
<%
	String temp = "";                  //�ΨӪ�ܿ�X���ܼ�
	
	String btn = request.getParameter("button");
	try{
		if(btn == null){
			btn = request.getParameter("button");
			for(int i=0 ; i<3 ; i++){
				input[i] = "";
			}
		}else if(btn.equals("C")){
			calculate = 0;
			front = 0;
			back = 0;
			operator = "";
			pointUse1 = true;
			pointUse2 = true;
			for(int i=0 ; i<3 ; i++){
				input[i] = "";
			}
		}else if((isNumeric(btn))){   //btn���Ʀr
			if( operator.equals("=")){
				temp = btn;
				input[0] = temp;
				operator = "";
			}else if(input[2] == ""){
				input[0] += btn;
				temp = input[0];
			}else{
				input[1] += btn;
				temp = input[1];
			}
		}else if(!(isNumeric(btn))){  //btn�����Ʀr
			if(input[2] == ""){
				if(btn.equals(".")){
					if(pointUse1 == true){
						input[0] += btn;
						temp = input[0];
						pointUse1 = false;
					}
				}else if(btn.equals("Delete")){
					input[0] = input[0].substring(0 , input[0].length()-1);
					temp = input[0];
				}else if(btn.equals("1/x")){
					front = Double.parseDouble(input[0]);
					front = Math.pow(front, -1);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("CE")){
					input[0] = "";
				}else if(btn.equals("2^x")){
					front = Double.parseDouble(input[0]);
					front = Math.pow(2, front);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("X^2")){
					front = Double.parseDouble(input[0]);
					front = front * front;
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("��x")){
					front = Double.parseDouble(input[0]);
					front = Math.pow(front, 0.5);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("10^x")){
					front = Double.parseDouble(input[0]);
					front = Math.pow(10, front);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("+/-")){
					front = Double.parseDouble(input[0]);
					front = front * -1;
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("sin")){
					front = Double.parseDouble(input[0]);
					double rad = Math.toRadians(front);
					front = Math.sin(rad);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("cos")){
					front = Double.parseDouble(input[0]);
					double rad = Math.toRadians(front);
					front = Math.cos(rad);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("log")){
					front = Double.parseDouble(input[0]);
					front = Math.log10(front);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("ln")){
					front = Double.parseDouble(input[0]);
					front = Math.log(front);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("e^x")){
					front = Double.parseDouble(input[0]);
					front = Math.exp(front);
					input[0] = Double.toString(front);
					temp = input[0];
				}else if(btn.equals("|x|")){
					front = Double.parseDouble(input[0]);
					front = Math.abs(front);
					input[0] = Double.toString(front);
					temp = input[0];
				}else{ 
					input[2] = btn;
					operator = input[2];
					temp = input[2];
				}
			}else{ 
				front = Double.parseDouble(input[0]);
				back = Double.parseDouble(input[1]);
				if(btn.equals(".")){
					if(pointUse2 == true){
						input[1] += btn;
						temp = input[1];
						pointUse2 = false;
					}
				}else if(btn.equals("=") || btn.equals("%")){
					front = Double.parseDouble(input[0]);
					back = Double.parseDouble(input[1]);
					if(operator.equals("+")){
						calculate = front + back;
					}else if(operator.equals("-")){
						calculate = front - back;
					}else if(operator.equals("*")){
						calculate = front * back;
					}else if(operator.equals("/")){
						calculate = front / back;
					}
					if(btn.equals("=")){
						input[0] = Double.toString(calculate);
						temp = input[0];
						input[1] = "";
						input[2] = "";
						operator = "=";
					}else{
						calculate = calculate / 100;
						input[0] = Double.toString(calculate);
						temp = input[0];
						input[1] = "";
						input[2] = "";
					}
				}else if(btn.equals("Delete")){
					input[1] = input[1].substring(0 , input[1].length()-1);
					temp = input[1];
				}else if(btn.equals("1/x")){
					back = Double.parseDouble(input[1]);
					back = Math.pow(back, -1);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("CE")){
					input[1] = "";
				}else if(btn.equals("2^x")){
					back = Double.parseDouble(input[1]);
					back = Math.pow(2, back);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("X^2")){
					back = Double.parseDouble(input[1]);
					back = back * back;
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("��x")){
					back = Double.parseDouble(input[1]);
					back = Math.pow(back, 0.5);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("10^x")){
					back = Double.parseDouble(input[1]);
					back = Math.pow(10, back);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("+/-")){
					back = Double.parseDouble(input[1]);
					back = back * -1;
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("sin")){
					back = Double.parseDouble(input[1]);
					double rad = Math.toRadians(back);
					back = Math.sin(rad);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("cos")){
					back = Double.parseDouble(input[1]);
					double rad = Math.toRadians(back);
					back = Math.cos(rad);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("log")){
					back = Double.parseDouble(input[1]);
					back = Math.log10(back);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("ln")){
					back = Double.parseDouble(input[1]);
					back = Math.log(back);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("e^x")){
					back = Double.parseDouble(input[1]);
					back = Math.exp(back);
					input[1] = Double.toString(back);
					temp = input[1];
				}else if(btn.equals("|x|")){
					back = Double.parseDouble(input[1]);
					back = Math.abs(back);
					input[1] = Double.toString(back);
					temp = input[1];
				}else{
					front = Double.parseDouble(input[0]);
					back = Double.parseDouble(input[1]);
					if(operator.equals("+")){
						calculate = front + back;
					}else if(operator.equals("-")){
						calculate = front - back;
					}else if(operator.equals("*")){
						calculate = front * back;
					}else if(operator.equals("/")){
						calculate = front / back;
					}
					input[0] = Double.toString(calculate);
					temp = input[0];
					temp = btn;
					input[2] = btn;
					operator = input[2];
					input[1] = "";
				}
			}
		}		
	}
	catch(NumberFormatException s1){    //���~����
		calculate = 0;
		back = 0;
		pointUse2 = true;
		input[1] = "";
	} 
	catch(StringIndexOutOfBoundsException s2){      //���~����
		calculate = 0;
		front = 0;
		back = 0;
		operator = "";
		pointUse1 = true;
		pointUse2 = true;
		for(int i=0 ; i<3 ; i++){
			input[i] = "";
		}
	}
	
	
%>
  <div>
  	<div style="width:40%;height:60%;border:3px solid;margin:0px auto;background-color:#C0EFFC">
	  <div id="text" style="text-align:right;">
	  
	  <font color = black ; size = 70.95pxpx ;>      <!-- ��X���G�μ˦�  -->
	  <%= temp %>           
	  </font>
	  
	  </div>
	  <form name="form" method=post action="cal-110916041.jsp">
	  <input type="submit" name="button" value="Delete" class="delete">
	  <input type="submit" name="button" value="C" class="C">
	  <input type="submit" name="button" value="CE" class="CE">
	  <input type="submit" name="button" value="%" class="percent">
	  <input type="submit" name="button" value="1/x" class=reciprocal>
	  <input type="submit" name="button" value="X^2" class="square">
	  <input type="submit" name="button" value="��x" class="root">
	  <input type="submit" name="button" value="/" class="devide">
	  <input type="submit" name="button" value="7" class="seven" >
	  <input type="submit" name="button" value="8" class="eight">
	  <input type="submit" name="button" value="9" class="nine">
	  <input type="submit" name="button" value="*" class="time">
	  <input type="submit" name="button" value="4" class="four">
	  <input type="submit" name="button" value="5" class="five">
	  <input type="submit" name="button" value="6" class="six">
	  <input type="submit" name="button" value="-" class="minus">
	  <input type="submit" name="button" value="1" class="one">
	  <input type="submit" name="button" value="2" class="two">
	  <input type="submit" name="button" value="3" class="three">
	  <input type="submit" name="button" value="+" class="plus">
	  <input type="submit" name="button" value="+/-" class="PN">  <!-- Positive or Negative -->
	  <input type="submit" name="button" value="0" class="zero">
	  <input type="submit" name="button" value="." class="point">
	  <input type="submit" name="button" value="=" class="equal">
	  </form>
	</div>
 
   	<div style="width:40%;height:60%;;margin:10px auto;">
     <form name="form" method=post action="cal-110916041.jsp">
	 <input type="submit" name="button" value="2^x" class="_2x">         <!--  2��x���� -->
	 <input type="submit" name="button" value="sin" class="sin">
	 <input type="submit" name="button" value="cos" class="cos">
	 <input type="submit" name="button" value="log" class="log">
	 <input type="submit" name="button" value="ln" class="ln">
 	 <input type="submit" name="button" value="e^x" class="ex">		   <!--e��x���� -->
	 <input type="submit" name="button" value="|x|" class="xPlus">      <!--x������� -->
	 <input type="submit" name="button" value="10^x" class="_10x">       <!--10��x���� -->
 	 </form>
    </div>
  </div>

</BODY>
</HTML>
