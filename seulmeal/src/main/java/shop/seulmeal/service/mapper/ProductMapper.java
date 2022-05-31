package shop.seulmeal.service.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.Parts;

@Mapper
public interface ProductMapper {
	public int insertParts(Parts parts);
	public Parts getParts(Map<String,Object> map);
	public int updateParts(Parts parts);
	public int deleteParts(int no);
	public List<Parts> getListParts(Map<String,Object> map);
	
	// productParts
	public int insertProudctParts(List<Parts> list);
	public List<Parts> getProductParts(int productNo);
	public int deleteProductParts(Parts parts);
	
	// totalCount
	public int getTotalCount(Map<String,Object> map);
}
