package jsp_project.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.dgit.mall.dao.ProductDao;
import com.dgit.mall.dto.Product;
import com.dgit.mall.util.MySqlSessionFactory;


public class ProductTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Test
	public void insert() {
		SqlSession session = null;
		try{ 
			session = MySqlSessionFactory.openSession();
			ProductDao dao = session.getMapper(ProductDao.class); 
			Product pro = new Product();
			pro.setCategory("목걸이");
			pro.setName("목걸이");
			pro.setSubDesc("목걸이 부가설명");
			pro.setCost(1000);
			pro.setSellingPrice(5000);
			pro.setDiscountPer("0");
			pro.setContent("목걸이 상세설명");
			pro.setSubDesc("0");
			pro.setStock(10);
			pro.setMainImg("목걸이 메인이미지");
			
			System.out.println(pro.toString());
			dao.insertProduct(pro);
			session.commit(); //insert, update, delete
		}catch(Exception e){ 
			e.printStackTrace(); 
		}finally{ 
			session.close(); 
		} 
	}

}
