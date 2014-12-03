package cn.demo.common;

import org.springframework.stereotype.Repository;

@Repository
public class PageConstants {
	private int pageMax;

	public int getPageMax() {
		return pageMax;
	}

	public void setPageMax(int pageMax) {
		this.pageMax = pageMax;
	}

}
