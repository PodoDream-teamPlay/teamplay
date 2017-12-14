package edu.spring.ex00.pagination;

//페이지를 위한 기준 설정 클래스
public class PaginationCriteria {
	
	private int page;
	private int numsPerPage;
	
	public PaginationCriteria() {
		this.page = 1; //기본으로 1페이지부터 보여줌
		this.numsPerPage = 5; //page 5개씩 보여줌
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getNumsPerPage() {
		return numsPerPage;
	}

	public void setNumsPerPage(int numsPerPage) {
		this.numsPerPage = numsPerPage;
	}
	
	
	
	public int getStart() {
		return (page - 1)*numsPerPage + 1;
	}
	
	public int getEnd() {
		return numsPerPage * page;
	}
	
}
