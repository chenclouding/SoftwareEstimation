package action;

import service.BookService;

import com.opensymphony.xwork2.Action;

public class AddBookAction implements Action{
	private String book;

	public String getBook() {
		return book;
	}

	public void setBook(String book) {
		this.book = book;
	}
	
	public String execute() throws Exception{
		//BookService bs = new BookService();
		//bs.addBook(book);
		return SUCCESS;
	}
}
