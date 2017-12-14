package edu.spring.ex00.pagination;

//페이지 번호를 게시글 갯수에 맞춰 만들어주는 클래스
public class PageNumberMaker {
	
	private PaginationCriteria criteria; //현재 페이지 번호와 게시글 몇개씩 보여줄건지 들어있음
	private int totalCount;
	private int numsOfLinks;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public PageNumberMaker() {
		this.numsOfLinks = 10; //default로 페이지번호 열개 보이게 설정
	}

	public void setPageMakerData() {
		int totalPageNum = (int)Math.ceil((double)totalCount / criteria.getNumsPerPage());
		int temp = (int)Math.ceil((double)criteria.getPage() / numsOfLinks) * numsOfLinks;
		if(temp > totalPageNum) {
			endPage = totalPageNum;
		}else {
			endPage = temp;
		}
		
		startPage = ((endPage - 1) / numsOfLinks) * numsOfLinks + 1;
		
		//1페이지엔 prev 없음
		if(startPage == 1) {
			prev = false;
		} else {
			prev = true;
		}
		
		//마지막 페이지엔 next 없음
		if(endPage * criteria.getNumsPerPage() >= totalCount) {
			next = false;
		} else {
			next = true;
		}
	}
	
	//getter, setter
	public PaginationCriteria getCriteria() {
		return criteria;
	}

	public void setCriteria(PaginationCriteria criteria) {
		this.criteria = criteria;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNumsOfLinks() {
		return numsOfLinks;
	}

	public void setNumsOfLinks(int numsOfLinks) {
		this.numsOfLinks = numsOfLinks;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	
	
}
