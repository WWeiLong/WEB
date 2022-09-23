package com.wwl.pojo;

public class Page {
    //上一页
    private String previous;
    //下一页
    private String next;
    //当前页条数
    private String total;
    //当前页
    private String currentPage;

    public String getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(String currentPage) {
        this.currentPage = currentPage;
    }

    public Page(String previous, String next, String total, String currentPage, String totalPage, String totalData, String lastPage) {
        this.previous = previous;
        this.next = next;
        this.total = total;
        this.currentPage = currentPage;
        this.totalPage = totalPage;
        this.totalData = totalData;
        this.lastPage = lastPage;
    }

    //总页数
    private String totalPage;
    //总条数
    private String totalData;
    //最后一页
    private String lastPage;

    public Page(String previous, String next, String total, String totalPage, String totalData, String lastPage) {
        this.previous = previous;
        this.next = next;
        this.total = total;
        this.totalPage = totalPage;
        this.totalData = totalData;
        this.lastPage = lastPage;
    }

    public String getPrevious() {
        return previous;
    }

    public void setPrevious(String previous) {
        this.previous = previous;
    }

    public String getNext() {
        return next;
    }

    public void setNext(String next) {
        this.next = next;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(String totalPage) {
        this.totalPage = totalPage;
    }

    public String getTotalData() {
        return totalData;
    }

    public void setTotalData(String totalData) {
        this.totalData = totalData;
    }

    public String getLastPage() {
        return lastPage;
    }

    public void setLastPage(String lastPage) {
        this.lastPage = lastPage;
    }

    public Page() {
    }

    @Override
    public String toString() {
        return "Page{" +
                "previous='" + previous + '\'' +
                ", next='" + next + '\'' +
                ", total='" + total + '\'' +
                ", totalPage='" + totalPage + '\'' +
                ", totalData='" + totalData + '\'' +
                ", lastPage='" + lastPage + '\'' +
                '}';
    }
}
