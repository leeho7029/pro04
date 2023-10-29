package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Review;
import kr.ed.haebeop.domain.ReviewVO;

import java.util.List;

public interface ReviewService {

    public List<Review> reviewList(String type, String lcode) throws Exception;
    public int starAvg(String lcode) throws Exception;
    public void reviewInsert(Review review) throws Exception;
    public int getCount(String id) throws Exception;
    public List<ReviewVO> randomReview() throws Exception;
}
