package com.spring.domain;

public class Search
{
	private String	key;
	private String	value;

	private String	order;
	private String	sort;

	private int		curPage = 1;
	private int		perPage = 10;

	public String getKey()		{ return key;		}
	public String getValue()	{ return value;		}
	public String getOrder()	{ return order;		}
	public String getSort()		{ return sort;		}
	public int	  getCurPage()	{ return curPage;	}
	public int	  getPerPage()	{ return perPage;	}
	public int	  getOffset()	{ return (curPage-1)*perPage; }
	
	public void setKey(		String	key		) { this.key	 = key;		}
	public void setValue(	String	value	) { this.value	 = value;	}
	public void setOrder(	String	order	) { this.order	 = order;	}
	public void setSort(	String	sort	) { this.sort	 = sort;	}
	public void setCurPage(	int		curPage	) { this.curPage = curPage;	}
	public void setPerPage(	int		perPage	) { this.perPage = perPage;	}
	
	@Override
	public String toString() {
		return "Search [key=" + key + ", value=" + value + ", order=" + order + ", sort=" + sort + ", curPage="
				+ curPage + ", perPage=" + perPage + "]";
	}
}