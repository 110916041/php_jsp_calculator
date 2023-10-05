<!--  許証曜110916041  -->
<!--  欲執行兩數相加減乘除,請按照順序點擊A operator B
 	    符合的評分標準：1. 支援整數加減乘除計算，2.支援小數 ，3. 其他特別有用功能
 	    自評：100    -->

<!--  使用說明
            %：計算4 + 5 按% ，即4 + 5 %  會得到0.09   
           避免輸出數字呈現太多位數，某些計算只取到小數點後第八位。      -->

<!--  可支援a+b+c+d，不一定每次都要按=    -->
<?php     //將錯誤關閉
error_reporting(E_ERROR);
ini_set("display_errors","Off");
?>


<HTML>
<HEAD>
<TITLE>Calculator</TITLE>
</HEAD>

<!--計算機外觀-->
<style>    
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
<?php                        //變數宣告
 $boolean1 = true;
 $boolean2 = true;
 $input0 = "";
 $input1 = "";
 $input2 = "";
 $calculate = 0.0;
 $operator = "";
?>
<?php            //偵測submit之後該變數是否有被賦值(設置)，若有則取代目前變數。
if(isset($_POST["de_input0"])){
    $input0 = $_POST["de_input0"];
} 
if(isset($_POST["de_input1"])){
    $input1 = $_POST["de_input1"];
}
if(isset($_POST["de_input2"])){
    $input2 = $_POST["de_input2"];
}
if(isset($_POST["de_calculate"])){
    $calculate = $_POST["de_calculate"];
}
if(isset($_POST["de_operator"])){
    $operator = $_POST["de_operator"];
}
if(isset($_POST["de_boolean1"])){
    $boolean1 = $_POST["de_boolean1"];
}
if(isset($_POST["de_boolean2"])){
    $boolean2 = $_POST["de_boolean2"];
}
if(isset($_POST["de_temp"])){
    $temp = $_POST["de_temp"];
}
?>
<?php
global $temp;
    try {
        if(isset($_POST['button'])){
            $btn = $_POST["button"];      //若button有被設置，則使其value等於btn
            if($btn == ("C")){
                $boolean1 = TRUE;         //判斷第一數字是否已使用小數點
                $boolean2 = TRUE;         //判斷第二數字是否已使用小數點
                $calculate = 0.0;         //用來記錄兩數經運算後的值
                $operator = "";           //紀錄上一個operator
                $input0 = "";             //儲存第一operand
                $input1 = "";             //儲存第二operand
                $input2 = "";             //儲存當前operator
                $temp = "";
            }else if((is_numeric($btn))){         //按鈕為數字      
                if($input2 == ("")){
                    if($input0 == ""){
                        $temp = $input0 = $btn;
                    }elseif($operator == "="){
                        $temp = $input0 = "";
                        $operator = "";
                    }else{
                        $input0 = $input0.$btn;
                        $temp = $input0;
                    }
                }else{
                    if($input1 == ""){
                        $temp = $input1 = $btn;
                    }else{
                        $input1 = $input1.$btn;
                        $temp = $input1;
                    }
                }
            }else if(!(is_numeric($btn))){         //按鈕不為數字，分辨按到的按紐為什麼
                if($input2 == ("")){
                    if($btn == (".")){
                        if($boolean1){            //判斷是否使用過小數點
                            $input0 = "$input0".".";
                            $temp = $input0;
                            $boolean1 = FALSE;
                        }
                    }else if($btn == ("Delete")){
                        $input0 = substr($input0, 0, -1);
                        $temp = $input0;
                    }else if($btn == ("1/x")){
                        $input0 = pow($input0, -1);
                        $temp = round($input0 , 10);
                    }else if($btn == ("CE")){
                        $input0 = "";
                        $temp = $input0;
                    }else if($btn == ("2^x")){
                        $input0 = pow(2 , $input0);
                        $temp = round($input0 , 8);
                    }else if($btn == ("X^2")){
                        $input0 = pow($input0 , 2);
                        $temp = round($input0 , 8);
                    }else if($btn == ("√x")){
                        $input0 = pow($input0 , 0.5);
                        $temp = round($input0 , 8);
                    }else if($btn == ("10^x")){
                        $input0 = pow(10 , $input0);
                        $temp = round($input0 , 8);
                    }else if($btn == ("+-")){
                        $input0 = $input0 * -1;
                        $temp = $input0;
                    }else if($btn == ("sin")){
                        $input0 = sin(deg2rad($input0));
                        $temp = round($input0 , 8);
                    }else if($btn == ("cos")){
                        $input0 = cos(deg2rad($input0));
                        $temp = round($input0 , 8);
                    }else if($btn == ("log")){
                        $input0 = log10($input0);
                        $temp = round($input0 , 8);
                    }else if($btn == ("ln")){
                        $input0 =  log10($input0) / log10(2.7182818284);
                        $temp = round($input0 , 8);
                    }else if($btn == ("e^x")){
                        $input0 = exp($input0);
                        $temp = round($input0 , 8);
                    }else if($btn == ("|x|")){
                        $input0 = abs($input0);
                        $temp = round($input0 , 8);
                    }else{
                        $input2 = $btn;
                        $operator = $input2;
                        $temp = $input2;
                    }
                }else{
                    if($btn == (".")){                  //判斷是否使用過小數點
                        if($boolean2){
                            $input1 = "$input1"."$btn";
                            $temp = $input1;
                            $boolean2 = FALSE;
                        }
                    }else if($btn == ("=") || $btn == ("%")){
                        if($operator == ("+")){
                            $calculate = round($input0 + $input1 , 8);
                        }else if($operator == ("-")){
                            $calculate = round($input0 - $input1 , 8);
                        }else if($operator == ("*")){
                            $calculate = round($input0 * $input1 , 8);
                        }else if($operator == ("/")){
                            $calculate = round($input0 / $input1 , 8);
                        }
                        if($btn == ("=")){
                            $temp = round($calculate , 8);
                            $input0 = $temp;
                            $input1 = "";
                            $input2 = "";
                            $operator = $btn;
                        }else{
                            $calculate = $calculate / 100;
                            $temp = round($calculate , 8);
                            $input0 = $temp;
                            $input1 = "";
                            $input2 = "";
                        }
                    }else if($btn == ("Delete")){
                        $input1 = substr($input1, 0, -1);
                        $temp = $input1;
                    }else if($btn == ("1/x")){
                        $input1 = pow($input1, -1);
                        $temp = round($input1 , 8);
                    }else if($btn == ("CE")){
                        $input1 = "";
                        $temp = $input1;
                    }else if($btn == ("2^x")){
                        $input1 = pow(2 , $input1);
                        $temp = round($input1 , 8);
                    }else if($btn == ("X^2")){
                        $input1 = pow($input1 , 2);
                        $temp = round($input1 , 8);
                    }else if($btn == ("√x")){
                        $input1 = pow($input1 , 0.5);
                        $temp = round($input1 , 8);
                    }else if($btn == ("10^x")){
                        $input1 = pow(10 , $input1);
                        $temp = round($input1 , 8);
                    }else if($btn == ("+-")){
                        $input1 = $input1 * -1;
                        $temp = $input1;
                    }else if($btn == ("sin")){
                        $input1 = sin(deg2rad($input1));
                        $temp = round($input1 , 8);
                    }else if($btn == ("cos")){
                        $input1 = cos(deg2rad($input1));
                        $temp = round($input1 , 8);
                    }else if($btn == ("log")){
                        $input1 = log10($input1);
                        $temp = round($input1 , 8);
                    }else if($btn == ("ln")){
                        $input1 =  log10($input1) / log10(2.7182818284);
                        $temp = round($input1 , 8);
                    }else if($btn == ("e^x")){
                        $input1 = exp($input1);
                        $temp = round($input1 , 8);
                    }else if($btn == ("|x|")){
                        $input1 = abs($input1);
                        $temp = $input1;
                    }else if($btn == ("+") || $btn == ("-") || $btn == ("*") || $btn == ("/")){
                        if($operator == ("+")){
                            $calculate = round($input0 + $input1 , 8);
                        }else if($operator == ("-")){
                            $calculate = round($input0 - $input1 , 8);
                        }else if($operator == ("*")){
                            $calculate = round($input0 * $input1 , 8);
                        }else if($operator == ("/")){
                            $calculate = round($input0 / $input1 , 8);
                        }   
                        $input0 = $calculate;
                        $temp = $input0;
                        $temp = $btn;
                        $input2 = $btn;
                        $operator = $input2;
                        $input1 = "";
                    }
                }
            }
        }
    } catch (DivisionByZeroError $s) {     //錯誤偵測
        echo $s->getMessage();
        $boolean1 = TRUE;
        $boolean2 = TRUE;
        $calculate = 0.0;
        $operator = "";
        $input0 = "";
        $input1 = "";
        $input2 = "";
        $temp = "";
    } catch (Exception $a){                //錯誤偵測
        echo $a->getMessage();
        $boolean1 = TRUE;
        $boolean2 = TRUE;
        $calculate = 0.0;
        $operator = "";
        $input0 = "";
        $input1 = "";
        $input2 = "";
        $temp = "";
    }
?>

  <div>
  	<div style="width:40%;height:60%;border:2px solid;margin:0px auto;background-color:#C0EFFC">
	  <div id="text" style="text-align:right;width:90%;height:15%;border:2px solid;margin:10px auto;background-color:#D4F0F7;">
	  <font color = black size = 70px ;>    
      <?php 
      echo $temp;
      ?>
	  </font>
	  </div>
	  <form name="form" method=post action="cal-110916041.php">
	  <input type="submit" name="button" value="Delete" class="delete">
	  <input type="submit" name="button" value="C" class="C">
	  <input type="submit" name="button" value="CE" class="CE">
	  <input type="submit" name="button" value="%" class="percent">
	  <input type="submit" name="button" value="1/x" class=reciprocal>
	  <input type="submit" name="button" value="X^2" class="square">
	  <input type="submit" name="button" value="√x" class="root">
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
	  <input type="submit" name="button" value="+-" class="PN">  <!-- Positive or Negative -->
	  <input type="submit" name="button" value="0" class="zero">
	  <input type="submit" name="button" value="." class="point">
	  <input type="submit" name="button" value="=" class="equal">
	  
	  <div style="margin-top: 10%">
	  <input type="submit" name="button" value="2^x" class="_2x">         <!--  2的x次方  -->
	  <input type="submit" name="button" value="sin" class="sin">
	  <input type="submit" name="button" value="cos" class="cos">
	  <input type="submit" name="button" value="log" class="log">
	  <input type="submit" name="button" value="ln" class="ln">
 	  <input type="submit" name="button" value="e^x" class="ex">		   <!--e的x次方 -->
	  <input type="submit" name="button" value="|x|" class="xPlus">      <!--x的絕對值 -->
	  <input type="submit" name="button" value="10^x" class="_10x">       <!--10的x次方 -->
	  </div>
	  <!-- 在submit時連同當前變亮儲存的值進行傳遞，但不顯示出來 -->
 	  <input type="hidden" name="de_input0" value="<?php echo $input0 ?>">
      <input type="hidden" name="de_input1" value="<?php echo $input1 ?>">
      <input type="hidden" name="de_input2" value="<?php echo $input2 ?>">
      <input type="hidden" name="de_calculate" value="<?php echo $calculate ?>">
      <input type="hidden" name="de_operator" value="<?php echo $operator ?>">
      <input type="hidden" name="de_boolean1" value="<?php echo $boolean1 ?>">
      <input type="hidden" name="de_boolean2" value="<?php echo $boolean2 ?>">
      <input type="hidden" name="de_temp" value="<?php echo $temp ?>">
 	 </form>
    </div>
    
  </div>

</BODY>
</HTML>
