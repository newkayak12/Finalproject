<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<section class="mt-5 pt-5">
		<div id="root" class="container mt-5">
			<form action="<%=request.getContextPath()%>/movie/movieWriteEnd">
			<div id="review-box" class="mt-3 pt-2 col-12 justify-content-center" style="border: 1px solid black; height: 850px; margin: 0 auto;">
				<h2>리뷰작성</h2>
				<div id="direct-point" class="col-4 mt-3" style="height: 4rem; border: 1px solid black;">
					<span style="display: inline-block; font-size: 2rem;">연출</span>
					<div class="star-rating">
					  <input type="radio" id="5-stars-direct" name="direct" value="5" />
					  <label for="5-stars-direct" class="star">&#9733;</label>
					  <input type="radio" id="4-stars-direct" name="direct" value="4" />
					  <label for="4-stars-direct" class="star">&#9733;</label>
					  <input type="radio" id="3-stars-direct" name="direct" value="3" />
					  <label for="3-stars-direct" class="star">&#9733;</label>
					  <input type="radio" id="2-stars-direct" name="direct" value="2" />
					  <label for="2-stars-direct" class="star">&#9733;</label>
					  <input type="radio" id="1-star-direct" name="direct" value="1" checked/>
					  <label for="1-star-direct" class="star">&#9733;</label>
					</div>
				 </div>
				 <div id="visual-point" class="col-4 mt-3" style="height: 4rem; border: 1px solid black;">
					<span style="display: inline-block; font-size: 2rem;">영상미</span>
					<div class="star-rating">
					  <input type="radio" id="5-stars-visual" name="visual" value="5" />
					  <label for="5-stars-visual" class="star">&#9733;</label>
					  <input type="radio" id="4-stars-visual" name="visual" value="4" />
					  <label for="4-stars-visual" class="star">&#9733;</label>
					  <input type="radio" id="3-stars-visual" name="visual" value="3" />
					  <label for="3-stars-visual" class="star">&#9733;</label>
					  <input type="radio" id="2-stars-visual" name="visual" value="2" />
					  <label for="2-stars-visual" class="star">&#9733;</label>
					  <input type="radio" id="1-star-visual" name="visual" value="1" checked/>
					  <label for="1-star-visual" class="star">&#9733;</label>
					</div>
				 </div>
				 <div id="story-point" class="col-4 mt-3" style="height: 4rem; border: 1px solid black;">
					<span style="display: inline-block; font-size: 2rem;">스토리</span>
					<div class="star-rating">
					  <input type="radio" id="5-stars-story" name="story" value="5" />
					  <label for="5-stars-story" class="star">&#9733;</label>
					  <input type="radio" id="4-stars-story" name="story" value="4" />
					  <label for="4-stars-story" class="star">&#9733;</label>
					  <input type="radio" id="3-stars-story" name="story" value="3" />
					  <label for="3-stars-story" class="star">&#9733;</label>
					  <input type="radio" id="2-stars-story" name="story" value="2" />
					  <label for="2-stars-story" class="star">&#9733;</label>
					  <input type="radio" id="1-star-story" name="story" value="1" checked/>
					  <label for="1-star-story" class="star">&#9733;</label>
					</div>
				 </div>
				 <div id="acting-point" class="col-4 mt-3" style="height: 4rem; border: 1px solid black;">
					<span style="display: inline-block; font-size: 2rem;">연기력</span>
					<div class="star-rating">
					  <input type="radio" id="5-stars-acting" name="acting" value="5" />
					  <label for="5-stars-acting" class="star">&#9733;</label>
					  <input type="radio" id="4-stars-acting" name="acting" value="4" />
					  <label for="4-stars-acting" class="star">&#9733;</label>
					  <input type="radio" id="3-stars-acting" name="acting" value="3" />
					  <label for="3-stars-acting" class="star">&#9733;</label>
					  <input type="radio" id="2-stars-acting" name="acting" value="2" />
					  <label for="2-stars-acting" class="star">&#9733;</label>
					  <input type="radio" id="1-star-acting" name="acting" value="1" checked/>
					  <label for="1-star-acting" class="star">&#9733;</label>
					</div>
				 </div>
				 <div id="ost-point" class="col-4 mt-3" style="height: 4rem; border: 1px solid black;">
					<span style="display: inline-block; font-size: 2rem;">OST</span>
					<div class="star-rating">
					  <input type="radio" id="5-stars-ost" name="ost" value="5" />
					  <label for="5-stars-ost" class="star">&#9733;</label>
					  <input type="radio" id="4-stars-ost" name="ost" value="4" />
					  <label for="4-stars-ost" class="star">&#9733;</label>
					  <input type="radio" id="3-stars-ost" name="ost" value="3" />
					  <label for="3-stars-ost" class="star">&#9733;</label>
					  <input type="radio" id="2-stars-ost" name="ost" value="2" />
					  <label for="2-stars-ost" class="star">&#9733;</label>
					  <input type="radio" id="1-star-ost" name="ost" value="1" checked/>
					  <label for="1-star-ost" class="star">&#9733;</label>
					</div>
				 </div>
				 <div class="col-12 mt-3" style="height: 300px; border: 1px solid black" >
					<div class="form-group">
						  <label for="comment">Comment:</label>
						  <textarea class="form-control" rows="7" id="comment" name="content" placeholder="영화는 어떠셨나요? 간단한 리뷰를 작성해보세요."></textarea>
					</div>
				 </div>
				 <input type="hidden" value="${ movieSeq }" name="movieSeq">
				<div class="row justify-content-center">
					<button class="btn btn-primary mt-3 col-2" type="submit">작성</button>
				</div>
				</form>
			</div>
		</div>
	</section>
	

	<style>
		#root{
	     	font-family:'NanumBarunGothic';
	     	
	     }
        .star-rating {
		  display:inline-flex;
		  flex-direction: row-reverse;
		  font-size:2.0em;
		  justify-content:space-around;
		  text-align:center;
		  float: right;

		}
		
		.star-rating input {
		  display:none;
		}
		
		.star-rating label {
		  color:#ccc;
		  cursor:pointer;
		}
		
		.star-rating :checked ~ label {
		  color:#f90;
		}
		
		.star-rating label:hover,
		.star-rating label:hover ~ label {
		  color:#fc0;
		}


	     
	</style>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>