package com.sojson.article.dao;

import java.util.List;
import java.util.Map;

import com.sojson.article.entiy.Article;
import com.sojson.user.enity.UUser;
import com.sojson.permission.bo.URoleBo;

public interface ArticleMapper {

	Article selectByPrimaryKey(Long id);
}