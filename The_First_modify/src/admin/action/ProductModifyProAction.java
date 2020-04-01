package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.svc.ProductModifyProService;
import shop.vo.ShopBean;
import vo.ActionForward;

public class ProductModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProductModifyProAction");
		
		ActionForward forward = null;
		
		// 파라미터로 전달된 상품코드 (product_cod) 가져와서 변수에 저장
		String product_cod = request.getParameter("product_cod");
		
		ProductModifyProService productModifyProService = new ProductModifyProService();
			
		
			// ShopBean 객체에 수정된 게시물 내용 저장 후
			// ProductModifyProService 클래스의 modifyProduct() 메서드를 호출
			// => 파라미터 : ShopBean   리턴타입 : boolean(isModifySuccess)
			ShopBean product = new ShopBean();
			product.setProduct_cod("product_cod");
			product.setProduct_name(request.getParameter("product_name"));
			product.setPrice(Integer.parseInt(request.getParameter("price")));
			product.setStock(Integer.parseInt(request.getParameter("stock")));
			product.setPurchase_count(Integer.parseInt(request.getParameter("purchase_count")));
			
			boolean isModifySuccess = productModifyProService.modifyProduct(product);
			
			if(!isModifySuccess) {
				// 리턴받은 수정 결과(isModifySuccess)가 false 일 경우
				// => 자바스크립트를 사용하여 "글 수정 실패!" 출력 후 이전 페이지로 이동
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				// 리턴받은 수정 결과(isModifySuccess)가 true 일 경우
				// => ActionForward 객체를 사용하여 수정된 게시물로 이동(Redirect 방식)
				//    (URL : NoticeDetail.no?num=x&page=y)
				forward = new ActionForward();
				forward.setPath("/ProductList.ad");
				forward.setRedirect(true);
			}
			
			

		
		return forward;
	}

}
