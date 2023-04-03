package restaurant.model;
import org.springframework.data.domain.Sort;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public final class PageRequest {

   private int page;
   private int size;
   private Sort.Direction direction;
   PageRequest(){
	   this.page = 1;
	   this.size = 10;
	   this.direction = Sort.Direction.DESC;
   }
   public void setPage(int page) {
       this.page = page <= 0 ? 1 : page;
   }

   public void setSize(int size) {
       int DEFAULT_SIZE = 10;
       int MAX_SIZE = 50;
       this.size = size > MAX_SIZE ? DEFAULT_SIZE : size;
   }

   public void setDirection(Sort.Direction direction) {
       this.direction = direction;
   }
   // getter

   public org.springframework.data.domain.PageRequest of() {
       return org.springframework.data.domain.PageRequest.of(page -1, size, direction, "id");
   }
}