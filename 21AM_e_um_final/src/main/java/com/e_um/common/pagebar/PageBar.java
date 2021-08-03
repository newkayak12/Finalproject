package com.e_um.common.pagebar;

public class PageBar {
	
	public static String getPageBar(String profileId, int totalData, int cPage, int numPerPage, String url, String functionName) {
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
//		profileId="'"+profileId+"'";
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm selectColor'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' tabindex='-1' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' aria-label='Previous' href='javascript:"+functionName+"("+"'"+profileId+"',"+(pageNo-1)+")' tabindex='-1'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:"+functionName+"(\""+profileId+"\","+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:"+functionName+"("+profileId+","+pageNo+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		pageBar +="<script>function "+functionName+"(profileId,cPage){$.ajax({url:'"+url+"',data:{'profileId':profileId,'cPage': cPage},success:data=>{$('#guestbookmodalroot').html(data);}})}";
		
		pageBar+="</script>";
		
		return pageBar;
	}
	
	
	
	
	public static String getPageBar( int totalData, int cPage, int numPerPage, String functionName) {
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
//		profileId="'"+profileId+"'";
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm selectColor'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' tabindex='-1' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' aria-label='Previous' href='javascript:"+functionName+"("+(pageNo-1)+")' tabindex='-1'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:"+functionName+"("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:"+functionName+"("+pageNo+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		
		
		return pageBar;
	}
	
	
	public static String getPageBarModalName(String modalName, int totalData, int cPage, int numPerPage, String url, String functionName) {
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
//		profileId="'"+profileId+"'";
		
		String pageBar="<ul class='pagination justify-content-center pagination-sm selectColor'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' tabindex='-1' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' aria-label='Previous' href='javascript:"+functionName+"("+"'"+modalName+"',"+(pageNo-1)+")' tabindex='-1'><span aria-hidden='true'>&laquo;</span></a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:"+functionName+"(\""+modalName+"\","+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:"+functionName+"("+modalName+","+pageNo+")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		pageBar +="<script>function "+functionName+"(modalName,cPage){$.ajax({url:'"+url+"',data:{'modalName':modalName,'cPage': cPage},success:data=>{$('#myPageModal .modal-body').html(data);}})}";
		
		pageBar+="</script>";
		
		return pageBar;
	}

}
