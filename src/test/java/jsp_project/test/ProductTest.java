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
			pro.setPrd_category("목걸이");
			pro.setPrd_name("목걸이");
			pro.setPrd_sub_desc("목걸이 부가설명");
			pro.setPrd_cost(1000);
			pro.setPrd_selling_price(5000);
			pro.setPrd_discount_per("0");
			pro.setPrd_content("목걸이 상세설명");
			pro.setPrd_use_option("0");
			pro.setPrd_stock(10);
			pro.setPrd_main_img("목걸이 메인이미지");
			
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
