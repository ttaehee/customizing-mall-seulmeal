package shop.seulmeal.web.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Report;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AttachmentsService attachmentsService;
	
	
	//C
	public CommunityController() {
		System.out.println(this.getClass());
	}

	
	//M
	// 무한스크롤
	@GetMapping("/communityMain")
	public String communityMain(Model model) {
		
		//1. communityService.getListPost(null, null);
		//2. userService.getUser 유저프로필
		//3. productService.getListProduct(null) 추천밀키트 리스트
		
		//model.addAttribute(null, model);
		
		return "community/communityMain";
	}
	
	//Post
	@GetMapping("/insertPost")
	public String insertPost() {
		return "community/insertCommunityPost";
	}
	
	@PostMapping("/insertPost")
	public String insertPost(@ModelAttribute Post post) {
		
		communityService.insertPost(post);
		
		return "redirect:community/getPost/"+ post.getPostNo(); 
	}
	
	@GetMapping("/getPost/{postNo}")
	public String getPost(@PathVariable int postNo, Model model) {
		
		//1. communityService.getListPost(null, null);
		//2. communityService.getListcomment(null, postNo);
		
		//model.addAttribute(null, model);
		
		return "community/getCommunityPost";
	}
	
//	// 무한스크롤..
//	@GetMapping("/getListPost")
//	public String getListPost(@PathVariable int postNo, Model model) {
//		
//		//1. communityService.getListPost(null, null);
//		//2. communityService.getListcomment(null, postNo);
//		
//		//model.addAttribute(null, model);
//		
//		return "community/getCommunityPost";
//	}
	
	
	@GetMapping("/updatePost/{postNo}")
	public String updatePost(@PathVariable int postNo, Model model) {
		
		Post post = communityService.getPost(postNo);
		
		model.addAttribute("post", post);
		
		return "community/updateCommunityPost";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(@ModelAttribute Post post) {
		
		communityService.updatePost(post);
		
		return "redirect:community/getPost/"+ post.getPostNo(); 
	}
	
	@PutMapping("/deletePost/{postNo}")
	public String deletePost(@PathVariable int postNo) {
		
		communityService.deletePost(postNo);
		
		return "community/communityMain"; 
	}
	
	
	//Comment
	@PostMapping("/insertComment")
	public String insertComment(@ModelAttribute Comment comment) {
		
		communityService.insertComment(comment);
		
		return "redirect:community/getPost/"+ comment.getPostNo(); 
	}
	
	
	//RestController?
	@GetMapping("/updateComment/{commentNo}")
	public String updateComment(@PathVariable int commentNo, Model model) {
		
		Comment comment = communityService.getComment(commentNo);

		model.addAttribute("comment", comment);
		
		return "redirect:community/getPost/"+ comment.getPostNo(); 
	}
	
	//RestController?
	@PutMapping("/updateComment")
	public String updateComment(@ModelAttribute Comment comment) {
		
		communityService.updateComment(comment);
		
		return "redirect:community/getPost/"+ comment.getPostNo(); 
	}
	
	// parameter Comment?
	@PutMapping("/deleteComment/{commentNo}")
	public String deleteComment(@PathVariable int commentNo) {
		
		communityService.deleteComment(commentNo);
		Comment comment = communityService.getComment(commentNo);
		
		return "redirect:community/getPost/"+ comment.getPostNo(); 
	}
	
	
	
	
	
//	@PostMapping("/insertReportPost")
//	public String insertReportPost(@ModelAttribute Report report) {
//		
//		communityService.insertReportPost(report);
//		
//		return "redirect:community/getPost/"+report.getReportNo();
//	}
//	
//	@DeleteMapping("/deleteReportPost")
//	public String deleteReportPost(@ModelAttribute Report report) {
//		
//		communityService.insertReportPost(report);
//		
//		return "redirect:community/getPost/"+report.getReportNo();
//	}
}
