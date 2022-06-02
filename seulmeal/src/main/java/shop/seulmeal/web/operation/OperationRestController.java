package shop.seulmeal.web.operation;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.operation.OperationService;

@RestController
@RequestMapping("operation/*")
public class OperationRestController {
	
	@Autowired
	@Qualifier("operationServiceImpl")
	private OperationService operationService;
	
	@PostMapping("api/insertAnswer")
	public Comment insertAnswer(@RequestBody Comment comment) {
		User user = new User();
		user.setUserId("jeong");
		comment.setUser(user);
		System.out.println(comment);
		operationService.insertAnswer(comment);
		
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
}
