package shop.seulmeal.web.operation;

import java.io.IOException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.operation.OperationService;

@RestController
@RequestMapping("operation/api/*")
public class OperationRestController {
	
	@Autowired
	@Qualifier("operationServiceImpl")
	private OperationService operationService;
	
	@Autowired
	private AttachmentsService attachmentsService;
	
	@PostMapping(value ="insertAnswer", consumes = {"multipart/form-data"})
	public Comment insertAnswer(@RequestParam(value="uploadfile", required = false) MultipartFile[] uploadfile,
								@RequestParam(value="content") String content,
								@RequestParam(value="postNo") int postNo, Comment comment, Attachments attachments) throws IllegalStateException, IOException {
		User user = new User();
		user.setUserId("jeong");
		comment.setUser(user);
		comment.setPostNo(postNo);
		comment.setContent(content);
		System.out.println(comment);
		operationService.insertAnswer(comment);
		
		attachments.setCommentNo(Integer.toString(comment.getCommentNo()));
		
		attachmentsService.insertAttachments(uploadfile, attachments);
				
		return comment;
	}
	
	public JSONObject deleteAnswer(Comment comment, JSONObject json) {
		int r = operationService.deleteAnswer(comment);
		
		if(r == 1) {
			json.put("result", "success");
		} else {
			json.put("result", "false");
		}		
		
		return json;
	}
	
	@PostMapping("confirmQueryPassword")
	public JSONObject confirmQueryPassword(@RequestBody Post post ) {
		JSONObject json = new JSONObject(); 
		Post sPost = operationService.getOperation(post.getPostNo());
		
		if(sPost.getPassword() == post.getPassword()) {
			json.put("result","true");
		} else {
			json.put("result","false");
		}
		
		return json;
	}
}
