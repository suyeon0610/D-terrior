package com.spring.myWeb.complete.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.myWeb.command.CompleteVO;
import com.spring.myWeb.command.MyHomeVO;
import com.spring.myWeb.complete.mapper.ICompleteMapper;
import com.spring.myWeb.myhome.mapper.IMyHomeMapper;
import com.spring.myWeb.myhome.util.PageVO;

@Service
public class CompleteService implements ICompleteService{
	
	//mapper 의존성 주입
	@Autowired
	private ICompleteMapper mapper;

	//글 등록
	@Override
	public void regist(CompleteVO vo) {
		mapper.regist(vo);
	}

	//글 목록 불러오기
	@Override
	public List<CompleteVO> getList(PageVO paging) {
		List<CompleteVO> list = mapper.getList(paging);
		for(CompleteVO vo : list) {
			vo.setProfile(mapper.getProfile(vo.getWriter()));
		}
		
		return list;
	}
	

	//글 상세보기
	@Override
	public CompleteVO getDetail(int bno) {
		
		//조회수 설정	
		/*
		Cookie cookie = new Cookie(String.valueOf(bno), "true");
		cookie.setMaxAge(10);
		response.addCookie(cookie);
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		for(Cookie coo : cookies) {
			if(coo.getName().equals(String.valueOf(bno))) {
				flag = true;
				break;
			}
		}
		
		if(!flag) {
			service.plusView(bno);
		}*/
		
		return mapper.getDetail(bno);
	}

	//게시글 수 불러오기
	@Override
	public int getTotalArticles(PageVO paging) {
		return mapper.getTotalArticles(paging);
	}

	//글 수정
	@Override
	public void update(CompleteVO vo) {
		if(vo.getThumbImg() == null)
			vo.setThumbImg(getProfile(vo.getWriter()));
		if(vo.getImgs() == null)
			vo.setImgs(getDetail(vo.getBno()).getImgs());
		
		mapper.update(vo);
	}

	//글 삭제
	@Override
	public void delete(int bno) {
		//삭제 전 스크랩 처리
		CompleteVO vo = getDetail(bno);
		
		if(updateScrap(vo.getWriter(), getScrap(vo.getWriter()), bno) == 1) {
			updateScrap(vo.getWriter(), getScrap(vo.getWriter()), bno);
		}	
		mapper.delete(bno);
	}
	
	//글쓴이 정보 불러오기
	@Override
	public String getProfile(String writer) {
		return mapper.getProfile(writer);
	}
	
	//좋아요 처리
	@Override
	public void like(CompleteVO vo) {
		mapper.like(vo);
	}
	
	@Override
	public String getScrap(String writer) {				
		System.out.println(mapper.getScrap(writer));
		return mapper.getScrap(writer);
	}
	
	@Override
	public int updateScrap(String writer, String scrap, int bno) {
		boolean flag = false;
		int idx = -1;
		int result;
		String newScrap = "";
		String[] scraps = null;
		
		if(scrap != null) { 
			scraps = scrap.split(",");				
		
			for(int i=0;i<scraps.length;i++) {
				if(scraps[i].equals("" + bno)) {
					flag = true;
					idx = i;
					break;
				}
			}		
		}
		else //스크랩된 글 한개도 없을 경우
			scrap = "";
		
		if(flag) { //이미 스크랩 된 글일 경우
			for(int j=0;j<scraps.length;j++) {
				if(j != idx) { //이미 스크랩된 글번호가 아닐 경우
					newScrap += scraps[j];	
					
					if(j != scraps.length -1) //끝글 아니고 스크랩된 글번호 아닐 때
						newScrap += ",";						
				}
				else
					continue;						
			}
			result = -1;
		}
		else { //스크랩 안되어 있는 글일 경우
			newScrap = scrap;
			newScrap += "," + bno;
			
			result = 1;
		}
		
		if(newScrap != "") {
			if(newScrap.charAt(0) == ',')
				newScrap = newScrap.substring(1, newScrap.length());				
			if(newScrap.charAt(newScrap.length()-1) == ',')
				newScrap = newScrap.substring(0, newScrap.length()-1);
		}
		
		mapper.updateScrap(writer, newScrap);
		
		return result;
	}	
	
	//조회수 up
	@Override
	public void plusView(int bno) {
		mapper.plusView(bno);
	}
	
	//좋아요 up
	@Override
	public void plusLike(int bno, int num) {
		mapper.plusLike(bno, num);
	}
	
	//스크랩 up
	@Override
	public void plusScrap(int bno, int num) {
		mapper.plusScrap(bno, num);
	}
	
}
