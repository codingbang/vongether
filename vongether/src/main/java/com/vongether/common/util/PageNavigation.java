package com.vongether.common.util;



public class PageNavigation {

//	private String root; //rootContext
	private int pageNo; //현재 페이지
	private int totalArticleCount; //전체 게시글 수
	private int totalPageCount; //전체 페이지 수
	private String navigator; //화면에 표시할 페이징

	public int getTotalArticleCount() {
		return totalArticleCount;
	}
	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}
	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getNavigator() {
		return navigator;
	}
	public void setNavigator(String navigator) {
		this.navigator = navigator;
	}
	public void makeNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();
		int pageSize = BoardConstance.PAGE_COUNT;//페이지숫자
		int articleSize = BoardConstance.PAGE_COUNT;//페이지당 글숫자
		int totalPageCount = (totalArticleCount-1) % articleSize + 1;//총페이지수
		int preEnd = (pageNo-1) % pageSize * pageSize + 1;//전 끝페이지
		int startPage = preEnd + 1;//시작페이지
		int endPage = preEnd + pageSize;//끝페이지

		if (endPage > totalPageCount) {
		    endPage = totalPageCount;
		}	    


		tmpNavigator.append("<div id='pagination'>");
		if(preEnd == 0){
		    
		}else{
		    tmpNavigator.append("  <button type='button' class='btn' move-page-no='"+1+"'>&laquo;</button>");
		    tmpNavigator.append("  <button type='button' class='btn' move-page-no='"+preEnd+"'>&lt;</button>");
		}

		for(int i = startPage;i <= endPage;i++){
			if(pageNo == i) {
				tmpNavigator.append("  <button type='button' class='btn btn-default' class='navi_now_page'>"+i+"</button>");				
			}else {
				tmpNavigator.append("  <button type='button' class='btn btn-default' move-page-no='"+i+"'>"+i+"</button>");
			}
			

		}
		if(endPage == totalPageCount){

		}else{
		    tmpNavigator.append("  <button type='button' class='btn' move-page-no='"+(endPage+1)+"'>&gt;</button>");
		    tmpNavigator.append("  <button type='button' class='btn' move-page-no='"+totalPageCount+"'>&raquo;</button>");
		}

		tmpNavigator.append("</div>");
		this.navigator = tmpNavigator.toString();
	}
}
