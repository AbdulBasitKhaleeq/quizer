<?php
include "dbcon.php";
if(isset( $_POST['tag'])){
			$tag = $_POST['tag'];	
			$response = array("tag" => $tag, "error" => FALSE);
	
			if($tag=='newUser'){
				
				$ssoId  = $_POST['ssoId'];
				$fname  = $_POST['fname'];
				$lname  = $_POST['lname'];
				$email 	= $_POST['email'];
				$password 	= $_POST['password'];
				
				$sql="SELECT * FROM app_user WHERE sso_id = $ssoId";
				 $result=mysqli_query($con,$sql);
				
				if(mysqli_num_rows($result)>0){
						$response["error"] = TRUE;
						$response["error_msg"] = "User already exist";
						echo json_encode($response);
				}
			else{
					$insertApplicant="INSERT INTO app_user(sso_id, password, first_name, last_name, email) values('$ssoId','$password' ,'$fname', '$lname','$email')";
					$resulte = mysqli_query($con,$insertApplicant);
					if($resulte){
						 $app_id = mysqli_insert_id($con);
						
						$resultf=mysqli_query($con,"select * from applicants where app_id='$app_id'");
						
						$user=mysqli_fetch_array($resultf);
						$response["error"] = FALSE;
						$response["user"]["id"] = $user['id'];

						$response["user"]["fname"] = $user['fname'];
						$response["user"]["lname"] = $user['lname'];
						$response["user"]["email"] = $user['email'];
						$response["user"]["sso_id"] = $user['sso_id'];
						$response["user"]["password"] = $user['password'];
						echo json_encode($response);
					}
					else{
						$response["error"] = TRUE;
						$response["error_msg"] = "Error occured in Registration";
						echo json_encode($response);
						}
					
				}
				
				
			}	
			else if($tag=='newQuiz' ){
				$user_id=$_POST['user_id'];
				$title=$_POST['title'];
				$description  = $_POST['description'];
				
								
								$sql="INSERT INTO quiz( user_id, title, description)values
									('$user_id','$title','$description')";
										$quiz_result=mysqli_query($con,$sql);
									
									if($quiz_result){
												
										$quiz_no = mysqli_insert_id($con);
										$response["error"] = FALSE;
										$response["quiz_no"] =$quiz_no;
										echo json_encode($response);
									}else{
											$response["error"] = TRUE;
										$response["error_msg"] = "Error occured in complaint Registration";
										echo json_encode($response);
										}
				
			}
			else if($tag=='allQuizzesByUser' ){
				$user_id=$_POST['user_id'];								
								$sql="SELECT * FROM quiz where user_id='$user_id'";
									$quiz_result=mysqli_query($con,$sql);
									
									if($quiz_result){
												$response["error"] = FALSE;
									$response["count"]=mysqli_num_rows($quiz_result);
									$i=0;
									while($quiz=mysqli_fetch_array($quiz_result)){
							
											$response["quiz$i"]["title"] =$quiz['title'];
											$response["quiz$i"]["description"] = $quiz['description'];
											$i++;
							
											}

										echo json_encode($response);
									}else{
											$response["error"] = TRUE;
										$response["error_msg"] = "Error occured in complaint Registration";
										echo json_encode($response);
										}
			}
			else if($tag=='allQuizzes' ){
								
								$sql="SELECT * FROM quiz ";
									$quiz_result=mysqli_query($con,$sql);
									
									if($quiz_result){
												$response["error"] = FALSE;
									$response["count"]=mysqli_num_rows($quiz_result);
									$i=0;
									while($quiz=mysqli_fetch_array($quiz_result)){
							
											$response["quiz$i"]["title"] =$quiz['title'];
											$response["quiz$i"]["description"] = $quiz['description'];
											$i++;
							
											}

										echo json_encode($response);
									}else{
											$response["error"] = TRUE;
										$response["error_msg"] = "Error occured in complaint Registration";
										echo json_encode($response);
										}
			}
						else if($tag=='allQuestionByQuiz' ){
				$quiz_id=$_POST['quiz_id'];								
								$sql="SELECT * FROM question where quiz_id='$quiz_id'";
									$question_result=mysqli_query($con,$sql);
									
									if($question_result){
									$response["error"] = FALSE;	
									$response["count"]=mysqli_num_rows($question_result);
									$i=0;
									while($question=mysqli_fetch_array($question_result)){
							
											$response["question$i"]["title"] =$question['title'];
											$response["question$i"]["answer"] = $question['answer'];
											$response["question$i"]["type"] =$question['question_type'];
											$response["question$i"]["option1"] = $question['opt1'];
											$response["question$i"]["option2"] =$question['opt2'];
											$response["question$i"]["option3"] = $question['opt3'];
											$response["question$i"]["option4"] = $question['opt4'];
											$response["question$i"]["marks"] = $question['marks'];
											$i++;
											}

										echo json_encode($response);
									}else{
											$response["error"] = TRUE;
											$response["error_msg"] = "Error occured in complaint Registration";
										echo json_encode($response);
										}
			}

			else if($tag=='allUser' ){
								
								$sql="SELECT * FROM app_user";
									$user_result=mysqli_query($con,$sql);
									
									if($user_result){
									$response["error"] = FALSE;	
									$response["count"]=mysqli_num_rows($user_result);
									$i=0;
									while($user=mysqli_fetch_array($user_result)){
							
											$response["user$i"]["sso_id"] =$user['sso_id'];
											$response["user$i"]["fname"] = $user['first_name'];
											$response["user$i"]["lname"] =$user['last_name'];
											$response["user$i"]["email"] = $user['email'];
											$response["user$i"]["password"] = $user['password'];
											$i++;
											}

										echo json_encode($response);
									}else{
											$response["error"] = TRUE;
											$response["error_msg"] = "Error occured in complaint Registration";
										echo json_encode($response);
										}
			}


			else if($tag=='newQuestion' ){
				
				$quiz_id=$_POST['quiz_id'];
				$title=$_POST['title'];
				
				$type=$_POST['type'];
				$answer=$_POST['answer'];
				
				$option1=$_POST['option1'];
				$option2=$_POST['option2'];
				$option3=$_POST['option3'];
				$option4=$_POST['option4'];

				$marks=$_POST['marks'];
				
								
								$sql="INSERT INTO question(quiz_id, question_type, title, answer, opt1, opt2, opt3, opt4, marks)values
									('$quiz_id','$type','$title','$answer','$option1','$option2','$option3','$option4','$marks')";
										$question_result=mysqli_query($con,$sql);
									
									if($question_result){
												
										$question_no = mysqli_insert_id($con);
										$response["error"] = FALSE;
										$response["question_no"] =$question_no;
										echo json_encode($response);
									}else{
											$response["error"] = TRUE;
										$response["error_msg"] = "Error occured in question Registration";
										echo json_encode($response);
										}	
			}


			else if($tag=='login' ){
				$sso_id  = $_POST['sso_id'];
				$pass 	= $_POST['password'];
				$sql="SELECT * from app_user where sso_id='$sso_id' and password='$pass'";
				$res=mysqli_query($con,$sql);
				
				$rows=mysqli_num_rows($res);
				if($rows==1)
				{
						$appli=mysqli_fetch_array($res);
						
						$response["error"] = FALSE;
						$response["user"]["id"] = $appli['id'];
						$response["user"]["fname"] = $appli['first_name'];
						$response["user"]["lname"] = $appli['last_name'];
						$response["user"]["email"] = $appli['email'];
						$response["user"]["sso_id"] = $appli['sso_id'];
						echo json_encode($response);
				}
				else{
						$response["error"] = TRUE;
						$response["error_msg"] = "Error occured in login ";
						echo json_encode($response);
				}
			}
			else{
				
				
			}
			
}
else{
	$response["error"] = TRUE;
	$response["error_msg"] = "Required parameter ";
	
	echo json_encode($response);
}
?>