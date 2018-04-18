package com.dgit.mall.dao.service;

public class AdBoardService {

	private static AdBoardService instance = new AdBoardService();
	private final String namespace = "com.dgit.mall.dao.AdBoardDao.";

	public static AdBoardService getInstance() {
		return instance;
	}

	private AdBoardService() {
	}
}
