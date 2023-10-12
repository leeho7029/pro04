package kr.co.haebop.repository;

import kr.co.haebop.domain.Category;
import kr.co.haebop.domain.Community;
import kr.co.haebop.domain.CommunityVO;
import kr.co.haebop.util.Page;

import java.util.List;

public interface CommunityRepository {
    public List<CommunityVO> communityList(Page page) throws Exception;
    public int getCount(Page page) throws Exception;
    public List<Category> categeryList() throws Exception;
    public CommunityVO communityDetail(int cno) throws Exception;
    public void communityInsert(Community dto) throws Exception;
    public void communityDelete(int cno) throws Exception;
    public void communityEdit(Community dto) throws Exception;
    public int communityCnt() throws Exception;
}
