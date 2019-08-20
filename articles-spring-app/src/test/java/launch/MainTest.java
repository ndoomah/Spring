package launch;


import br.example.model.Article;
import br.example.service.ArticleService;
import org.easymock.EasyMock;
import org.springframework.webflow.config.FlowDefinitionResource;
import org.springframework.webflow.config.FlowDefinitionResourceFactory;
import org.springframework.webflow.core.collection.LocalAttributeMap;
import org.springframework.webflow.core.collection.MutableAttributeMap;
import org.springframework.webflow.test.MockExternalContext;
import org.springframework.webflow.test.MockFlowBuilderContext;
import org.springframework.webflow.test.execution.AbstractXmlFlowExecutionTests;

public class MainTest extends AbstractXmlFlowExecutionTests {

    private ArticleService articleService;

    protected void setUp() {
        articleService = EasyMock.createMock(ArticleService.class);
    }

    @Override
    protected FlowDefinitionResource getResource (FlowDefinitionResourceFactory resourceFactory){
        return resourceFactory.createFileResource("src/main/webapp/WEB-INF/flows/parent-flow.xml");
    }

    @Override
    protected void configureFlowBuilderContext(MockFlowBuilderContext builderContext){
        builderContext.registerBean("articleService", articleService);
    }

    private Article createTestArticle(){
        Article article = new Article();
        article.setId(1L);
        article.setTitle("Article test spring");
        article.setStatus("Sold");
        return article;
    }

    public void testStartMain(){
        Article a = createTestArticle();
        Article test = new Article();
        test.setId(1L);
        test.setTitle("Article test spring");
        test.setStatus("Sold");

        EasyMock.expect(articleService.create(test)).andReturn(a);

        EasyMock.replay(articleService);

        MutableAttributeMap input = new LocalAttributeMap();
        input.put("id", 1);
        MockExternalContext context = new MockExternalContext();
        context.setCurrentUser("admin");
        startFlow(input, context);

        assertCurrentStateEquals("new");
        assertResponseWrittenEquals("new", context);
        assert(getRequiredFlowAttribute("article") instanceof Article);

        EasyMock.verify(articleService);

    }


}
