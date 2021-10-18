package com.spring.myWeb.store.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StorePageCreator {

	private StorePageVO page;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int pageTotalCount;
	private int pageBtn = 10;

	private void pageCalc() {

		this.endPage = (int) (Math.ceil(page.getPageNum() / (double) pageBtn) * pageBtn);
		this.beginPage = endPage - pageBtn + 1;
		this.prev = beginPage == 1 ? false : true;
		this.next = pageTotalCount <= (endPage * page.getCountPerPage()) ? false : true;
		if (!next) {
			this.endPage = (int) Math.ceil(pageTotalCount / (double) page.getCountPerPage());
		}
		
	}

	public void setPageTotalCount(int pageTotalCount) {
		
		this.pageTotalCount = pageTotalCount;
		pageCalc();

	}

}
