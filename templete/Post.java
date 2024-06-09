import java.util.ArrayList;
import java.util.List;

public class Post {
    private static int nextId = 1;
    private int id;
    private String author;
    private String content;
    private List<Comment> comments;

    public Post(String author, String content) {
        this.id = nextId++;
        this.author = author;
        this.content = content;
        this.comments = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public String getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void addComment(Comment comment) {
        comments.add(comment);
    }
}
