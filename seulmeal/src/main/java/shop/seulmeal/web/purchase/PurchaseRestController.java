package shop.seulmeal.web.purchase;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import shop.seulmeal.service.domain.CustomParts;
import shop.seulmeal.service.domain.Parts;
import shop.seulmeal.service.domain.Product;
import shop.seulmeal.service.domain.Purchase;
import shop.seulmeal.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	//@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	//@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	@PostMapping("api/updatePurchaseCode")
	public Purchase updatePurchaseCode( @RequestBody Purchase purchase) throws Exception{

	      System.out.println("/purchase/api/updateProduct : POST");
	      
	      purchaseService.updatePurchaseCode(purchase);
	      
	      return purchase;
	   }   
		
	
	


}
