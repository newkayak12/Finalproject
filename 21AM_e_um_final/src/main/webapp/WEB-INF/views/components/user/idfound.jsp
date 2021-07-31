<%@ page language="java" contentType="text/html; charset=UTF-8"%>
               

                <div style="min-height:300px">
                     
                     <div class="d-flex justify-content-center flex-column align-items-center" id="loginContainer">
                         <span class="m-2 d-flex justify-content-center align-items-center p-3 w-fitcontent">
                             <span class="w-100" id="found" class="pointFont">찾으시는 아이디는 </span>
                                
                            
                         
                             
                         </span>
                        
                    </div>
                 
                    <script>

                            $(function(){
                                let userId = '${userId}';
                                    let longing = userId.length
                                    let idset = "";
                                    
                                for(let i=0; i<longing; i++){
                                    if(i<2&&i!=0){
                                        idset += userId.substring(0,i);
                                    }

                                         idset += "*"
                                    if(i>longing-2){
                                         idset += userId.substring(longing-2,longing);
                                    }
                                }
                                    $("#found").html("찾으시는 아이디는 "+idset+"입니다.")

                            })

                    </script>
