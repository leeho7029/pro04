package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.domain.ReviewVO;
import kr.ed.haebeop.persistence.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public List<Review> reviewList(String type, String lcode) throws Exception {
        Map<String, String> data = new HashMap<>();
        data.put("type", type);                     // 동적 IF문 사용을 위해 map으로 변환 후 넘겨주기
        data.put("lcode", lcode);
        return reviewMapper.reviewList(data);
    }

    @Override
    public int starAvg(String lcode) throws Exception {
        return reviewMapper.starAvg(lcode);
    }

    @Override
    public void reviewInsert(Review review) throws Exception {
        reviewMapper.reviewInsert(review);
    }

    @Override
    public int getCount(String id) throws Exception {
        return reviewMapper.getCount(id);
    }

    @Override
    public List<ReviewVO> randomReview() throws Exception {
        return reviewMapper.randomReview();
    }
}
