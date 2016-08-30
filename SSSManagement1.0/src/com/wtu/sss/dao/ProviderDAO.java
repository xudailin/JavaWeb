package com.wtu.sss.dao;

import java.util.List;

import com.wtu.sss.model.Bank;
import com.wtu.sss.model.Place;
import com.wtu.sss.model.Provider;

public interface ProviderDAO {

	public abstract List<Place> getPlaceItems();
	public abstract List<Bank> getBankItems();
	public abstract List<Provider> getProviders(String hql,final int offset,final int length );
	public abstract Boolean addProvider(Provider provider);
	public abstract List<Provider> queryProviderByName(String providerName);
	public abstract Bank getBankByName(String bankName);
	public abstract Place getPlaceByName(String placeName);
	public abstract List<Provider> queryProvidersForPage(final String hql,final int offset,final int length);
	public abstract Provider getProviderById(long Id);
	public abstract boolean updateProvider(Provider provider);
	public abstract boolean deleteOneProvider(Provider provider);
	public abstract boolean deleteSome(String[] ids);
	public abstract int getAllRowCount(String hql);
	public abstract List<Provider> queryProviderId(int providerId);
}