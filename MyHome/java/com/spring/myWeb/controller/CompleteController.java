package com.spring.myWeb.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myWeb.command.CompleteVO;
import com.spring.myWeb.command.UserVO;
import com.spring.myWeb.complete.service.ICompleteService;
import com.spring.myWeb.myhome.util.PageVO;



@Controller
@RequestMapping("/comp")
public class CompleteController {
	@Autowired
	private ICompleteService service;

	@GetMapping("/compList")
	public String compList() {
		System.out.println("/comp/compList: GET");
		PageVO paging = new PageVO();
		System.out.println("총 게시물 수: " + service.getTotalArticles(paging));

		return "complete/compList";
	}

	//완성형인테리어 글 목록 이동 (페이지 이동)
	@ResponseBody
	@GetMapping("/getList")
	public Map<String, Object> getList(PageVO paging, Model model) {
		System.out.println("/comp/getList: GET");
		System.out.println("page객체: " + paging);

		List<CompleteVO> list = service.getList(paging);				
		int total = service.getTotalArticles(paging);
		
		for(CompleteVO vo : list) {
			System.out.println(vo);
		}

		Map<String, Object> map = new HashMap<>();

		map.put("list", list);
		map.put("total", total);		

		System.out.println("총 게시물 수: " + service.getTotalArticles(paging));

		return map;
	}

	//완성형인테리어 글쓰기 페이지 이동
	@GetMapping("/compWrite")
	public String compWrite() {
		System.out.println("/comp/compWrite: GET");
		
		return "complete/compWrite";
	}		


	//완성형인테리어 글 등록
	@PostMapping("/compWrite")
	public String compWrite(CompleteVO vo, @RequestParam("file") MultipartFile file, MultipartHttpServletRequest files, HttpSession session, RedirectAttributes ra) {
		System.out.println("/comp/compWrite: POST");

		try {
			int userNum = ((UserVO)(session.getAttribute("user"))).getUserNum();
			
			//업로드 경로 설정
			String fileRealName = file.getOriginalFilename();
			long size = file.getSize();		
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."));
			String path = "C:\\home\\complete\\upload\\" + userNum;

			//폴더 생성
			File folder = new File(path);
			if(!folder.exists())
				folder.mkdirs();		

			//날짜객체 생성
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileDate = sdf.format(date);

			//파일명 난수화
			UUID uuid = UUID.randomUUID();
			String codeName = uuid.toString().split("-")[0];
			String fileName = codeName + "_" + fileDate + fileExtension;

			//파일 저장
			File saveFile = new File(path + "\\" + fileName);			
			file.transferTo(saveFile);	

			//DB에 저장
			vo.setThumbImg(fileName);
			vo.setUserNum(userNum);
			System.out.println("이미지 경로: " + userNum + "/" + fileName);
			
			
			
			List<MultipartFile> list = files.getFiles("myhomeImgs");
			
			for(int i=0;i<list.size();i++) {
				// 서버에 저장할 파일 이름
				fileRealName = list.get(i).getOriginalFilename();
				
				// 파일명을 고유한 랜덤 문자로 작성 (중복 방지)
				uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				
				// 확장자
				fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				fileName = uniqueName + "_" + fileDate + fileExtension;
				
				// 파일 경로 + 이름
				String filePath = path + "\\" + fileName;
				System.out.println(filePath);
				
				saveFile = new File(filePath);
				list.get(i).transferTo(saveFile);
				
				// sql에 저장할 파일 경로
				vo.setImgs(vo.getImgs() + fileName + ",");
				
			}
			
			service.regist(vo);

		} catch (Exception e) {
			e.printStackTrace();
		}	

		return "redirect:/comp/compList";

	}
	

	//완성형인테리어 글 상세보기 이동
	@GetMapping("/compDetail")
	public String compDetail(int bno, Model model) {
		System.out.println("/comp/compDetails: GET");
		CompleteVO vo = service.getDetail(bno);
		vo.setProfile(service.getProfile(vo.getWriter()));
		
		if(service.getProfile(vo.getWriter()) != null) {
			String profile = service.getProfile(vo.getWriter());
			
			//프로필 경로 저장
			vo.setProfile(profile);
			System.out.println("프로필 경로: " + vo.getProfile());
		}
		
		//조회수 up
		service.plusView(bno);
		
		//이미 스크랩된 글일 경우
		if(service.updateScrap(vo.getWriter(), service.getScrap(vo.getWriter()), bno) == -1) {
			vo.setScrapValue(1); //스크랩된 글임을 표기
			service.updateScrap(vo.getWriter(), service.getScrap(vo.getWriter()), bno);
		}
		else
			vo.setScrapValue(0); //스크랩 안된 글임을 표기
		
		//내집 사진 처리
		String[] imgs = vo.getImgs().split(",");
//		for(int i=0;i<imgs.length;i++)
//			System.out.println(imgs[i]);
		
		System.out.println("userNum: " + vo.getUserNum());
		vo.setHomeImg(imgs);			

		model.addAttribute("home", vo);
		
		return "complete/compDetail";
	}
	
	//비동기 글정보 불러오기
	@ResponseBody
	@GetMapping("/liveDetail/{bno}")
	public CompleteVO liveDetail(@PathVariable("bno") int bno) {
		System.out.println("/comp/liveDetail: GET");
		
		return service.getDetail(bno);
	}

	//썸네일 가져오는 메서드
	@GetMapping("/display")	
	public ResponseEntity<byte[]> display(String userNum, String fileName) {
		String path = "C:\\home\\complete\\upload\\";
		System.out.println("fileLoca: " + fileName);
		
		File file = new File(path + userNum + "\\" + fileName);
		System.out.println(file);

		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			//probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 반환해 주는 메서드.
			//사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태 코드를 다르게 리턴할 수도 있습니다.
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			//ResponseEntity<>(바디에 담을 내용, 헤더에 담을 내용, 상태 메세지)
			//FileCopyUtils: 파일 및 스트림 복사를 위한 간단한 유틸리티 메서드의 집합체.
			//file 객체 안에 있는 내용을 복사해서 byte배열 형태로 바디에 담아서 전달.
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	//완성형인테리어 글 수정페이지 이동
	@GetMapping("/compModify")
	public String compModify(Model model, int bno) {
		System.out.println("/comp/compModify: GET");
		
		model.addAttribute("home", service.getDetail(bno));
		
		return "complete/compModify";
	}

	//완성형인테리어 글 수정
	@PostMapping("/compUpdate")
	public String compUpdate(CompleteVO vo, @RequestParam("file") MultipartFile file, MultipartHttpServletRequest files, HttpSession session, RedirectAttributes ra) {
		System.out.println("/comp/compUpdate: POST");		
		
		try {
			int userNum = ((UserVO)session.getAttribute("user")).getUserNum();
			String path = "C:\\home\\complete\\upload\\" + userNum;
			
			//폴더 생성
			File folder = new File(path);
			if(!folder.exists())
				folder.mkdirs();
			
			String fileRealName = "";
			String fileExtension = "";
			UUID uuid = null;
			
			//날짜객체 생성
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileDate = sdf.format(date);
					
			if(file != null) {
				//업로드 경로 설정
				fileRealName = file.getOriginalFilename();
				fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());							
	
				//파일명 난수화
				uuid = UUID.randomUUID();
				String codeName = uuid.toString().split("-")[0];
				String fileName = codeName + "_" + fileDate + fileExtension;
	
				//파일 저장
				File saveFile = new File(path + "\\" + fileName);			
				file.transferTo(saveFile);	
	
				//DB에 저장
				vo.setThumbImg(fileName);
				vo.setUserNum(userNum);
				System.out.println("이미지 경로: " + userNum + "/" + fileName);
			}
			
						
			List<MultipartFile> list = files.getFiles("myhomeImgs");
			if(list != null) {			
				for(int i=0;i<list.size();i++) {
					// 서버에 저장할 파일 이름
					fileRealName = list.get(i).getOriginalFilename();
					
					// 파일명을 고유한 랜덤 문자로 작성 (중복 방지)
					uuid = UUID.randomUUID();
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];
					
					// 확장자
					fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
					String fileName = uniqueName + "_" + fileDate + fileExtension;
					
					// 파일 경로 + 이름
					String filePath = path + "\\" + fileName;
					System.out.println(filePath);
					
					File saveFile = new File(filePath);
					list.get(i).transferTo(saveFile);
					
					// sql에 저장할 파일 경로
					vo.setImgs(vo.getImgs() + fileName + ",");				
				}
			}			
		
			service.update(vo);
			
			ra.addFlashAttribute("msg", "updateSuccess");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/comp/compDetail?bno=" + vo.getBno();
	}

	//완성형인테리어 글 삭제
	@GetMapping("/compDelete")
	public String compDelete(int bno, RedirectAttributes ra) {
		System.out.println("/comp/compDelete: GET");
		
		service.delete(bno);
		ra.addFlashAttribute("msg", "delSuccess");

		return "redirect:/comp/compList";
	}	
	
	//좋아요 클릭 처리
	@ResponseBody
	@PostMapping("/like")
	public String like(@RequestBody CompleteVO vo) {
		System.out.println("/comp/like: POST");
		service.like(vo);
		
		return "likeSuccess";
	}
	
	//스크랩 클릭 처리
	@ResponseBody
	@PostMapping("/scrap")
	public String scrap(@RequestBody CompleteVO vo) {
		System.out.println("/comp/scrap: POST");		
		
		String scrap = service.getScrap(vo.getWriter());
		System.out.println("현재 저장된 스크랩: " + scrap);
		
		int decide = service.updateScrap(vo.getWriter(), scrap, vo.getBno());
		
		System.out.println("스크랩 처리 후 저장된 스크랩: " + service.getScrap(vo.getWriter()));
		if(decide == 1) {
			service.plusScrap(vo.getBno(), 1);
			return "addScrap";
		}
		else {
			service.plusScrap(vo.getBno(), -1);
			return "removeScrap";
		}
	}

}
