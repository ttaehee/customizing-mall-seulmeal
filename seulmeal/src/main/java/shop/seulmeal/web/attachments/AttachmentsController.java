package shop.seulmeal.web.attachments;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class AttachmentsController {
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/download/{fileName}")
	public ResponseEntity<Object> attachMentsDownload(@PathVariable String fileName) throws IOException{
		String path = System.getProperty("user.dir")+"/src/main/resources/attachments/"+fileName;
		
		Path filePath = Paths.get(path);
		Resource resource = new InputStreamResource(Files.newInputStream(filePath));
		
		File file = new File(path);
		
		HttpHeaders headers = new HttpHeaders();
		
		// 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지 알려주는 헤더
		headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());
		
		return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
	}
}
