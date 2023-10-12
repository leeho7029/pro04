package kr.co.haebop.service;

import kr.co.haebop.domain.Category;
import kr.co.haebop.domain.Community;
import kr.co.haebop.domain.CommunityVO;
import kr.co.haebop.repository.CommunityRepository;
import kr.co.haebop.util.CommunityPage;
import kr.co.haebop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommunityServiceImpl implements CommunityService{
    @Autowired
    private CommunityRepository communityRepository;

    @Override
    public List<CommunityVO> communityList(CommunityPage page) throws Exception {
        return communityRepository.communityList(page);
    }

    @Override
    public int getCount(Page page) throws Exception {
        return communityRepository.getCount(page);
    }

    @Override
    public List<Category> categoryList() throws Exception {
        return communityRepository.categeryList();
    }

    @Override
    public CommunityVO communityDetail(int cno) throws Exception {
        return communityRepository.communityDetail(cno);
    }

    @Override
    public void communityInsert(Community dto) throws Exception {
        communityRepository.communityInsert(dto);
    }

    @Override
    public void communityDelete(int cno) throws Exception {
        communityRepository.communityDelete(cno);
    }

    @Override
    public void communityEdit(Community dto) throws Exception {
        communityRepository.communityEdit(dto);
    }

    @Override
    public int communityCnt() throws Exception {
        return communityRepository.communityCnt();
    }
}
