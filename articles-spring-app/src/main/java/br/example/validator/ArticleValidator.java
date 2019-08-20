package br.example.validator;

import br.example.model.Article;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.binding.validation.ValidationContext;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.io.Serializable;


@Component
public class ArticleValidator implements Validator, Serializable {
    @Override
    public boolean supports(Class clazz) {
        return Article.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Article article = (Article)o;
        if (article.getTitle() == null){
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "error.title", "Title is empty!");

        }
    }

    public boolean validate(Article article, MessageContext context){

        if(article.getTitle()==""){
           // messages.addMessage(new MessageBuilder().error().source("title").code("null").build());
            context.addMessage(new MessageBuilder().error().source("title").defaultText("Title cannot be empty!").build());
            return false;
        }
        if(article.getStatus()==""){
            context.addMessage(new MessageBuilder().error().source("status").defaultText("Status cannot be empty!").build());
            return false;
        }
        return true;
    }

    /*public void validate(Article article, MessageContext context){
        if(article.getTitle()==""){
            // messages.addMessage(new MessageBuilder().error().source("title").code("null").build());
            context.addMessage(new MessageBuilder().error().source("title").defaultText("Title cannot be empty!").build());
        }
        if(article.getStatus()==""){
            context.addMessage(new MessageBuilder().error().source("status").defaultText("Status cannot be empty!").build());
        }
    }*/
}
