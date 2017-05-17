package com.sojson.article.controller;

import com.sojson.article.entiy.Article;
import com.sojson.article.service.ArticleService;
import com.sojson.common.controller.BaseController;
import com.sojson.common.utils.Tooltip;
import com.sojson.core.mybatis.page.Pagination;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@Scope(value="prototype")
@RequestMapping("/article")
public class ArticleController extends BaseController {

	@Resource
	private ArticleService articleService;

	/**
	 * 文章列表管理
	 * @return
	 */
	@RequestMapping(value="/index")
	public ModelAndView list(ModelMap map, Integer pageNo, String findContent){

		map.put("findContent", findContent);
		Pagination<Article> page = articleService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		return new ModelAndView("article/index");
	}

	/**
	 * 文章详情管理
	 * @return
	 */
	@RequestMapping(value = "/selectArticleById/{articleId}")
	@ResponseBody
	public Article selectArticleById(@PathVariable Long articleId){

		Article article=articleService.selectByPrimaryKey(articleId);
		return article;
	}

	/**
	 * 文章添加管理
	 * @return
	 */
	@RequestMapping(value = "/saveOrUpdateArticle")
	@ResponseBody
	public Tooltip saveArticle(Article article){
		if(null!=article.getId()){
			articleService.updateByPrimaryKey(article);
		}else{
			articleService.insert(article);
		}
		return Tooltip.succ("操作成功");
	}
}
