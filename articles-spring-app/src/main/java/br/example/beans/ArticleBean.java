/**
 * 
 */
package br.example.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import org.springframework.binding.message.MessageContext;

import br.example.validator.ArticleValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.ui.context.Theme;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import br.example.model.Article;
import br.example.service.ArticleService;
import org.springframework.webflow.action.MultiAction;
import org.springframework.webflow.execution.RequestContext;


@ManagedBean
@RequestScoped
public class ArticleBean extends MultiAction implements Serializable {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private ArticleValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	// Entity Handlers
	private List<Article> items;
	private Article item = new Article();
	private static long id = -1;

	
	public void save() {

		//if (validator.validate(this.item, context.getMessageContext())) {
		//validator.validate(this.item, context.getMessageContext());

			if (this.id > 0) {
				this.item.setId(this.id);
				this.articleService.update(this.item);
				this.id = -1;
				addMessage("Article updated!");
			} else {
				this.articleService.create(this.item);
				addMessage("Article saved!");
				//return true;
			}
		//}

		this.item = new Article();
		//return false;
	}
	
	public void destroy(Article article) {
		try {
			this.articleService.destroy(article);
			addMessage("Article deleted!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Article> getItems() {
		return this.articleService.findAll();
	}
	public void setItems(List<Article> items) {
		this.items = items;
	}
	public Article getItem() {
		return this.item;
	}
	
	public void setItem(Article article) {
		//RequestContext context = RequestContextHolder.getRequestContext();
		//Article article = (Article) context.getFlowScope().get("article");
		//System.out.println(article.getTitle());
		this.item = article;
		this.setId(article.getId());
		//return true;
	}

	//autocomplete method
	public List<String> completeArea(String query) {
		List<String> results = new ArrayList<String>();

		if(query.equals("Port")) {
			results.add("Port Louis");

		}
		else if (query.equals("Grand")){
		    results.add("Grand port");
		    results.add("Grand baie");
		    results.add("Grand bassin");
        }
		else {
			for(int i = 0; i < 10; i++) {
				results.add(query + i);
			}
		}

		return results;
	}
	public void addMessage(String summary) {
		FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, summary, null);
		FacesContext.getCurrentInstance().addMessage(null, message);
	}
	public void setId(long id) {
		this.id = id;
	}


	public boolean validateField(MessageContext messageContext){
		if (this.item.getTitle() == ""){
			messageContext.addMessage(new MessageBuilder().error().code("title.error").build());
			return false;
		}
		if (this.item.getStatus() == ""){
			messageContext.addMessage(new MessageBuilder().error().code("status.error").build());
			return false;
		}
		return true;
	}
public List<String> getList(){
		List<String> listResult = new ArrayList<>();
		listResult.add("Shipped");
		listResult.add("Cancelled");
		listResult.add("Unavailable");
		return listResult;
}

}
