package shop.seulmeal.web.community;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import shop.seulmeal.common.Page;
import shop.seulmeal.common.Search;
import shop.seulmeal.service.attachments.AttachmentsService;
import shop.seulmeal.service.community.CommunityService;
import shop.seulmeal.service.domain.Attachments;
import shop.seulmeal.service.domain.Comment;
import shop.seulmeal.service.domain.Post;
import shop.seulmeal.service.domain.Report;
import shop.seulmeal.service.domain.User;
import shop.seulmeal.service.product.ProductService;
import shop.seulmeal.service.user.UserService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AttachmentsService attachmentsService;
	
	int pageUnit = 5;	
	int pageSize = 5;
	
	//C
	public CommunityController() {
		System.out.println(this.getClass());
	}

	
	//M
	// 무한스크롤
	@GetMapping("/communityMain") // x
	public String communityMain(@ModelAttribute Search search, String userId ,HttpSession session,Model model) {
		
		//1. communityService.getListPost(null, null);
		//2. userService.getUser()? 유저프로필 -> Session.getAttribute() 로 대체가능?
		//3. productService.getListProduct(null) 추천밀키트 리스트
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		final int PAGE_SIZE = 1;
		search.setPageSize(PAGE_SIZE);
		
		//communityService.getListPost(search, (User)session.getAttribute("user").getUserId);
		Map<String,Object> map = communityService.getListPost(search, userId);
		
		Page resultPage = new Page(search.getCurrentPage(),(int)map.get("postTotalCount"),pageUnit, PAGE_SIZE);
		
		
		model.addAttribute("postList", (List<Post>)map.get("postList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);

		
		return "/community/communityMain";
	}
	
	//Post
	@GetMapping("/insertPost") // o
	public String insertPost() {
		return "community/insertCommunityPost";
	}
	
	@PostMapping("/insertPost") // o
	public String insertPost(@ModelAttribute Post post, MultipartFile[] uploadfile,Attachments attachments,HttpSession session) throws IllegalStateException, IOException {

		post.setUser(((User)session.getAttribute("user")));
		communityService.insertPost(post);
		
		attachments.setPostNo(Integer.toString(post.getPostNo()));
		
		attachmentsService.insertAttachments(uploadfile, attachments);
		
		return "redirect:getPost/"+ post.getPostNo(); 
	}
	
	@GetMapping("/getPost/{postNo}") // x
	public String getPost(@PathVariable int postNo, Model model) {
		
		Post post = communityService.getPost(postNo);
		
		//무한스크롤?

//		Map<String,Object> map = communityService.getListcomment(search, postNo);
		
//		model.addAttribute("post", post);
//		model.addAttribute("post", (List<Comment>)map.get("commentList"));
		
		return "community/getCommunityPost";
	}

	
	
	@GetMapping("/updatePost/{postNo}") // o
	public String updatePost(@PathVariable int postNo, Model model) {
		
		Post post = communityService.getPost(postNo);
		
		model.addAttribute("post", post);
		
		return "community/updateCommunityPost";
	}
	
	@PutMapping("/updatePost/{postNo}") // o
	public String updatePost(@ModelAttribute Post post, @PathVariable int postNo) {
		
		communityService.updatePost(post);
		
		return "redirect:/community/getPost/"+ postNo; 
	}
	
	@PutMapping("/deletePost/{postNo}") // o
	public String deletePost(@PathVariable int postNo) {
		
		communityService.deletePost(postNo);
		
		return "community/communityMain"; 
	}
	
	
	//Comment
	@PostMapping("/insertComment") // o
	public String insertComment(@ModelAttribute Comment comment) {
		
		communityService.insertComment(comment);
		
		return "redirect:getPost/"+ comment.getPostNo(); 
	}
	
	
	//RestController?
	@GetMapping("/updateComment/{commentNo}") // o
	public String updateComment(@PathVariable int commentNo, Model model) {
		
		Comment comment = communityService.getComment(commentNo);

		model.addAttribute("comment", comment);
		
		return "redirect:/community/getPost/"+ comment.getPostNo(); 
	}
	
	//RestController?
	@PutMapping("/updateComment/{commentNo}") // o
	public String updateComment(@PathVariable int commentNo, @ModelAttribute Comment comment) {
		
		communityService.updateComment(comment);
		
		return "redirect:/community/getPost/"+ comment.getPostNo(); 
	}
	
	//parameter Comment?
	@PutMapping("/deleteComment/{commentNo}") // ^
	public String deleteComment(@PathVariable int commentNo) {
		
		communityService.deleteComment(commentNo);
		Comment comment = communityService.getComment(commentNo);
		
		return "redirect:/community/getPost/"+ comment.getPostNo(); 
	}
	
	//Post
	@PostMapping("/insertReportPost") // o
	public String insertReportPost(@ModelAttribute Report report) {
		
		communityService.insertReportPost(report);
		return "redirect:/community/getPost/"+ report.getPostNo(); 
	}
	
	@GetMapping("/getListReportPost") // o
	public String getListReportPost(@RequestParam(value = "currentPage", required = false, defaultValue = "1")Integer currentPage, Model model  ) {
		
		System.out.println("type : "+currentPage.getClass().getTypeName());
		System.out.println("값 : "+currentPage);
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		System.out.println("////////"+search);
		
		Map<String,Object> map = communityService.getListReportPost(search);		
		Page resultPage = new Page(search.getCurrentPage(),(int)map.get("reportTotalCount"),pageUnit, pageSize);
		System.out.println("////////"+resultPage);

		model.addAttribute("reportList", (List<Report>)map.get("reportList"));
		model.addAttribute("resultPage", resultPage);
		//search 필요x	
		
		return "/community/listCommunityReportPost";
	}
	
	@PutMapping("/deleteReportPost/{postNo}") // o
	public String deleteReportPost(@PathVariable int postNo) {
		
		communityService.deleteReportPost(postNo);
		return "redirect:/community/getListReportPost"; 
	}
	
	
	

}
