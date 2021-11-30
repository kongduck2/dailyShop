package com.nyang.shop.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
public class PageDto {
	//생성자로 전달받을값
	private int currentPage; 	//현재페이지
	private int pageSize;		//한 화면에 띄울 게시글 limit 범위
	private int totalCount;		//전체 게시글
	
	//계산에 필요한 값
	private int startNo;		//limit 시작 인덱스
	private int totalPage;		//전체 페이지 개수       처음 <1 2 3> 끝
	private int startPage;		//페이지 안에 띄울 게시글 시작 idx
	private int endPage;		//페이지 안에 띄울 게실글 끝 idx
	
	//검색에 필요한 값
	private String findText;
	
	//생성자
	public PageDto(int currentPage, int pageSize, int totalCount, String findText) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		totalPage = (totalCount-1)/pageSize +1; //ex) (81-1)/(10+1)=8 > 정수/정수=정수
		
		//현재페이지가 계산한 토탈페이지보다 크거나 1보다 작으면 무조건 1이고 아니면 가져온 현재페이지로 진행
		this.currentPage = (currentPage > totalPage || currentPage < 1)? 1:currentPage; 
		startNo = (currentPage-1) * pageSize;
		
		//startPage, endPage 의 수식은 나중에 추가
		startPage = (this.currentPage - 1) / 10 * 10 + 1;   //currentPage 14일때 , 11 
		endPage = startPage + pageSize-1;							//currentPage 14일때 , 20
		endPage = endPage > totalPage ? totalPage : endPage;   //마지막 페이지목록에서 필요함.
		
		this.findText = findText;
	}

	
}
