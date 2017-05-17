package com.sojson.article.service;

import java.util.List;
import java.util.Map;

import com.sojson.article.entiy.Article;
import com.sojson.permission.enity.UPermission;
import org.springframework.ui.ModelMap;

import com.sojson.user.enity.UUser;
import com.sojson.core.mybatis.page.Pagination;
import com.sojson.permission.bo.URoleBo;
import com.sojson.permission.bo.UserRoleAllocationBo;

public interface ArticleService {

    int insert(Article article);

    int updateByPrimaryKey(Article article);

    Pagination<Article> findByPage(Map<String, Object> resultMap, Integer pageNo,
                                   Integer pageSize);

    Article selectByPrimaryKey(Long id);
}
