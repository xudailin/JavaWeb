package com.wtu.sss.service;

import java.util.List;

import com.wtu.sss.model.Bank;
import com.wtu.sss.model.Place;
import com.wtu.sss.model.Provider;
import com.wtu.sss.util.PageBean;

public interface ProviderService {

	public abstract List<Place> getPlaceItems();
	public abstract List<Bank> getBankItems();
	public abstract PageBean getProviders(Provider provider,int pageSize,int page);
	public abstract Boolean addProvider(Provider provider);
	public abstract Bank getBankByName(String bankName);
	public abstract Place getPlaceByName(String placeName);
	public abstract Provider getProviderById(long Id);
	public abstract boolean updateProvider(Provider provider);
	public abstract boolean deleteOneProvider(Provider provider);
	public abstract Provider queryProviderByName(String providerName);
	public abstract boolean deleteSome(String[] ids);
	public abstract PageBean getProvidersForPage(int pageSize,int page);
	public abstract boolean checkProviderId(int providerId);
	public abstract boolean checkProviderName(String providerName);
}