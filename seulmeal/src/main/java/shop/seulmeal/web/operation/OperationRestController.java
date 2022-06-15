package shop.seulmeal.web.operation;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.confirm.ConfirmService;
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
	
	@Autowired
	private ConfirmService confirmService;
	
	@PostMapping(value ="insertAnswer", consumes = {"multipart/form-data"})
	public Comment insertAnswer(@RequestParam(value="uploadfile", required = false) MultipartFile[] uploadfile,
								@RequestParam(value="content") String content, HttpSession session,
								@RequestParam(value="postNo") int postNo, Comment comment, Attachments attachments) throws IllegalStateException, IOException {
		User user = (User)session.getAttribute("user");
		comment.setUser(user);
		comment.setPostNo(postNo);
		comment.setContent(content);
		System.out.println(comment);
		operationService.insertAnswer(comment);
		System.out.println(uploadfile.length);
		if(uploadfile.length > 1) {
			attachments.setCommentNo(Integer.toString(comment.getCommentNo()));
			
			attachmentsService.insertAttachments(uploadfile, attachments);
		}
		user = null;
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		user = (User) authentication.getPrincipal();
		
		comment.setUser(user);
		System.out.println("TESTSAETSAETFD");

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
		
		Post sPost = operationService.getOperation(post);
		
		if(sPost.getPassword() == post.getPassword()) {
			json.put("result","true");
		} else {
			json.put("result","false");
		}
		
		return json;
	}
	
	@PostMapping("confirm")
	public JSONObject confirmUser(@RequestBody User user, HttpSession session) {
		System.out.println("유저 : "+user);
		int num = confirmService.confirmNum();
		String message = "인증번호는 ["+num+"] 입니다";
		if(user.getEmail() != null) {
			confirmService.sendMail(message, user.getEmail());
			session.setAttribute(user.getEmail(), message);
		} else if(user.getPhone() != null) {
			confirmService.sendSMS(user.getPhone(), message);
			session.setAttribute(user.getPhone(), message);
		}
		
		JSONObject json = new JSONObject();
		json.put("result", "sucess");
		return json;
	}
}
