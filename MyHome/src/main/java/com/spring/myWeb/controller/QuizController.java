package com.spring.myWeb.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myWeb.command.QuizVO;
import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.quiz.service.IQuizService;
import com.spring.myWeb.quiz.util.QuizPageCreator;
import com.spring.myWeb.quiz.util.QuizPageVO;

@Controller
@RequestMapping("/quiz")
public class QuizController {

	@Autowired
	private IQuizService service;
	

	// 질문 목록 요청
	@GetMapping("/quizList")
	public void getList(Model model, QuizPageVO vo) {
		System.out.println("quiz/quizList: GET");
		/*
		System.out.println("조건: " + vo.getCondition());
		System.out.println("키워드: " + vo.getKeyword());
		System.out.println("정렬 기준: " + vo.getSort());
		*/
		System.out.println(vo);
		List<QuizVO> list = service.getList(vo);
		
		QuizPageCreator qpc = new QuizPageCreator();
		qpc.setPage(vo);
		qpc.setPageTotalCount(service.getTotalCount(vo));
		
		model.addAttribute("articles", list);
		model.addAttribute("paging", qpc);
	}

	// 질문 상세보기 화면 요청
	@GetMapping("/quizDetail/{quizNum}")
	public String article(@PathVariable int quizNum, Model model,
							@ModelAttribute("page") QuizPageVO page) {
		System.out.println("/quiz/detail: GET");
		
		service.updateCnt(quizNum);
		
		QuizVO quiz = service.getDetail(quizNum);
		System.out.println(quiz);
		
		model.addAttribute("article", quiz);
		return "quiz/quizDetail";
	}

	// 질문 등록 화면 요청
	@GetMapping("/quizRegist")
	public void regist() {
		System.out.println("/quiz/quizRegist: GET");
	}

	// 질문 등록 요청
	@PostMapping("/quizRegist")
	public String insert(@RequestParam("file") MultipartFile file, QuizVO article,
							HttpSession session, RedirectAttributes ra) {
		System.out.println("/quiz/quizRegist: POST");

		try {
			int userNum = ((UserVO)session.getAttribute("user")).getUserNum();
			String fileLoca = "";

			// 파일 저장 경로
			//※경로를 resources로 잡르면 was 재실행 시 워크 스페이스 내용으로 바뀌면서 파일 자동 삭제 됨
//			String resource = servletContext.getRealPath("/resources"); 
			String path = "C:\\home\\quiz\\upload";
			
			// 파일 이름에 사용할 날짜
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String fileDate = sdf.format(date);
			
			
			if(!file.isEmpty()) { // 업로드 파일이 있는 경우
				
				// 저장할 폴더 경로
				String uploadPath = path + "\\" + userNum;
				
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdirs();
				}
				
				// 서버에 저장할 파일 이름
				String fileRealName = file.getOriginalFilename();
				
				// 파일명을 고유한 랜덤 문자로 작성 (중복 방지)
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				
				// 확장자
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				
				String fileName = fileDate + "_" + uniqueName + fileExtension;
				
				// 파일 경로 + 이름
				String filePath = uploadPath + "\\" + fileName;
				
				System.out.println(filePath);
				
				File saveFile = new File(filePath);
				file.transferTo(saveFile);
				
				// sql에 저장할 파일 경로
				fileLoca = userNum + "/" + fileName;
				
			}
			
			article.setFileLoca(fileLoca);
			service.regist(article);

		} catch (Exception e) {
			System.out.println("※파일 업로드 중 오류 발생※");
			e.printStackTrace();
		}
		
		ra.addFlashAttribute("msg", "regSuccess");

		return "redirect:/quiz/quizList?pageNum=" + 1;
	}
	
	// 질문 이미지 요청
	@GetMapping("/display")
	public ResponseEntity<byte[]> getProfile(@RequestParam String fileLoca) {
		System.out.println("프로필 사진 요청");
		// 프로필 사진 정보 전송
		File file = new File("C:\\home\\quiz\\upload" + "\\" + fileLoca);
		System.out.println(file);
		
		ResponseEntity<byte[]> imgInfo = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			imgInfo = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return imgInfo;
	}

	// 수정 화면 요청
	@GetMapping("/quizModify")
	public void modify(@ModelAttribute("article") QuizVO vo, @ModelAttribute("page") QuizPageVO page) {
		System.out.println("/quiz/quizModify: GET");
		System.out.println(vo);

	}

	// 질문 수정 요청
	@PostMapping("/quizModify")
	public String update(HttpSession session ,@RequestParam("file") MultipartFile file, 
							QuizVO article) {
		System.out.println("/quiz/quizModify: POST");
		System.out.println(file);
		int quizNum = article.getQuizNum();
		
		try {
			int userNum = ((UserVO)session.getAttribute("user")).getUserNum();
			System.out.println(userNum);
			String content = article.getContent();
			String title = article.getTitle();
			String type = article.getType();
			String fileLoca = article.getFileLoca();

			// 파일 저장 경로
			//※경로를 resources로 잡르면 was 재실행 시 워크 스페이스 내용으로 바뀌면서 파일 자동 삭제 됨
//			String resource = servletContext.getRealPath("/resources"); 
			String path = "C:\\home\\quiz\\upload";
			
			// 파일 이름에 사용할 날짜
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			String fileDate = sdf.format(date);
			
			
			if(!file.isEmpty()) { // 업로드 파일이 있는 경우
				
				// 저장할 폴더 경로
				String uploadPath = path + "\\" + userNum;
				
				File folder = new File(uploadPath);
				if (!folder.exists()) {
					folder.mkdir();
				}
				
				// 서버에 저장할 파일 이름
				String fileRealName = file.getOriginalFilename();
				
				// 파일명을 고유한 랜덤 문자로 작성 (중복 방지)
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				
				// 확장자
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				
				String fileName = fileDate + "_" + uniqueName + fileExtension;
				
				// 파일 경로 + 이름
				String filePath = uploadPath + "\\" + fileName;
				
				System.out.println(filePath);
				
				File saveFile = new File(filePath);
				file.transferTo(saveFile);
				
				// sql에 저장할 파일 경로
				fileLoca = userNum + "/" + fileName;
				
			}
			
			QuizVO vo = new QuizVO(quizNum, null, title, content, type, fileLoca, 0, null, null, 0, false);
			service.modify(vo);

		} catch (Exception e) {
			System.out.println("※파일 업로드 중 오류 발생※");
			e.printStackTrace();
		}
		

		return "redirect:/quiz/quizDetail/" + quizNum;
	}

	// 질문 삭제 요청
	@PostMapping("/quizDelete")
	public String delete(@RequestParam int quizNum, @RequestParam int pageNum,
							RedirectAttributes ra) {
		System.out.println("/quiz/quizDelete: POST");

		service.delete(quizNum);
		ra.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/quiz/quizList?pageNum=" + pageNum;
	}

}