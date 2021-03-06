package com.service;

import java.util.List;

import com.file.TDataacquiretask;

public interface DataAcqService {
	
	public List<TDataacquiretask> getByProjId(Integer projectId);
	
	public void newDataAcq(TDataacquiretask task);
	
	public TDataacquiretask getById(Integer id);
	
	public void delDataAcq(Integer id, Integer projectId);
}
