package co.reservation.web; 

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import co.reservation.service.BoardService;
import co.reservation.vo.ArticleVO;
@WebServlet("/boardController.boa")
public class BoardController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static String ARTICLE_IMAGE_REPO="c:\\\\board\\\\article_image";
	BoardService boardService;
	ArticleVO articleVO;
	
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo(); // 요청명 가져오기
		List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		try {

			if (action == null) {
				// action 값이 널값이라도 db에서 list 받아옴
				System.out.println("action null 일때");
				articlesList = boardService.listArticles();
				request.setAttribute("articlesList", articlesList);
				nextPage = "/board/listArticle.tiles";
				System.out.println("action null일때"+nextPage);
			
			} else if (action.equals("/list")) {
				// action 값이 list 이면 전체글 조회
				articlesList = boardService.listArticles();// 전체글 조회
				request.setAttribute("articlesList", articlesList);
				nextPage ="listArticle.tiles";
				System.out.println("action list일때"+nextPage);
				System.out.println(articlesList);
			
			} else if(action.equals("/addArticle")) {
				nextPage="articleForm.tiles";
			
			
			} else if (action.equals("/addArticle.do")) {
				Map<String,String> articleMap = upload(request, response); 
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				
				articleVO.setParentNO(0);
				articleVO.setId(id);
				articleVO.setTitle(title);
				articleVO.setContent(content);
				articleVO.setImageFileName(imageFileName);
				boardService.addArticle(articleVO);
				nextPage="listArticle.tiles";
			}
				System.out.println(nextPage);
				RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
				dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	} 
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String,String> articleMap = new HashMap<String,String>();
		String encoding = "utf-8";
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath); 
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for (int i=0; i<items.size();i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName()+"="+fileItem.getString(encoding));
					articleMap.put(fileItem.getFieldName(),fileItem.getString(encoding));
				}else {
					System.out.println("파라미터이름:"+fileItem.getName());
					System.out.println("파일이름:"+fileItem.getName());
					System.out.println("파일크기"+fileItem.getSize()+"bytes");
					if (fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx==-1) {
							idx=fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx+1);
						articleMap.put(fileItem.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath+"\\"+fileName);
						fileItem.write(uploadFile);
					}//end of if
				}//end of if
			}//end of for
		}catch(Exception e){
			e.printStackTrace();
		}
		return articleMap;
	}


}
