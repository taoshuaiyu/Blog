package com.sojson.article.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sojson.article.dao.ArticleMapper;
import com.sojson.article.entiy.Article;
import com.sojson.article.service.ArticleService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.sojson.user.dao.UUserMapper;
import com.sojson.permission.dao.UUserRoleMapper;
import com.sojson.user.enity.UUser;
import com.sojson.permission.enity.UUserRole;
import com.sojson.common.utils.LoggerUtils;
import com.sojson.core.mybatis.BaseMybatisDao;
import com.sojson.core.mybatis.page.Pagination;
import com.sojson.core.shiro.session.CustomSessionManager;
import com.sojson.core.shiro.token.manager.TokenManager;
import com.sojson.permission.bo.URoleBo;
import com.sojson.permission.bo.UserRoleAllocationBo;
import com.sojson.user.service.UUserService;

@Service
public class ArticleServiceImpl extends BaseMybatisDao<ArticleMapper> implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public Pagination<Article> findByPage(Map<String, Object> resultMap, Integer pageNo, Integer pageSize) {
        return super.findPage(resultMap, pageNo, pageSize);
    }

    @Override
    public Article selectByPrimaryKey(Long id) {
        return articleMapper.selectByPrimaryKey(id);
    }
}
