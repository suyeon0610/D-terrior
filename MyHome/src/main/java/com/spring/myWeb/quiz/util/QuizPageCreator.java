package com.spring.myWeb.quiz.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QuizPageCreator {

	private QuizPageVO page;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageTotalCount; // 총 게시물 수?
	private int pageBtn = 10; // 한 화면에 보여징 페이비 버튼 수

	private void pageCalc() {

		this.endPage = (int) (Math.ceil(page.getPageNum() / (double) pageBtn) * pageBtn);
		this.beginPage = endPage - pageBtn + 1;
		this.prev = beginPage == 1 ? false : true;
		this.next = pageTotalCount <= (endPage * page.getCountPerPage()) ? false : true;
		// endPage 보정
		if (!next) {
			this.endPage = (int) Math.ceil(pageTotalCount / (double) page.getCountPerPage());
		}
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
		pageCalc();

	}

}
