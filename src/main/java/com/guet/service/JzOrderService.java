package com.guet.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.AccountDao;
import com.guet.dao.JzOrderDao;
import com.guet.entity.JzOrder;



@Service("jzOrderService")
public class JzOrderService{

	@Autowired
	private JzOrderDao jzOrderDao;
	@Autowired
	private AccountDao accountDao;
	
	//查已经完成，未完成
	public List<JzOrder> findState(int state){
		return jzOrderDao.findState(state);
	}
	
	//查已经完成，未完成
	public List<JzOrder> findMyState(int state,int id,int isServer){
		if(isServer == 1) {
			return jzOrderDao.findSState(state, id);
		}else {
			return jzOrderDao.findCState(state, id);
		}
	}
	//查所有
	public List<JzOrder> findAll(){
		return jzOrderDao.findAll();
	}
	
	public List<JzOrder> findServerOrder(int id,int isCompany){
		return jzOrderDao.findServerOrder(id, isCompany);
	}

	
	//根据id查询
	public JzOrder findById(int id) {
		return jzOrderDao.findById(id);
	}
	//删除
	public int delete(int id) {
		return jzOrderDao.delete(id);
	}
	//更新
	public int update(JzOrder jo) {
		return jzOrderDao.update(jo);
	}
	//更新state
	public int updateState(int id ,int state) {
		return jzOrderDao.updateState(id, state);
	}
	
	public int payAndReFund(int id,int state) {
		if(state == 2) {
			//支付
			//查订单
			JzOrder jo = jzOrderDao.findById(id);
			//扣款
			accountDao.changeGold(jo.getXiadanId(), -jo.getGold());
			return jzOrderDao.updateState(id, state);
		}else if(state == 5){
			//退款
			//查订单
			JzOrder jo = jzOrderDao.findById(id);
			//退款
			accountDao.changeGold(jo.getXiadanId(), jo.getGold());
			return jzOrderDao.updateState(id, state);
		}else {
			//完成订单支付给服务者
			//查订单
			JzOrder jo = jzOrderDao.findById(id);
			//支付
			accountDao.changeGold(jo.getJiedanId(), jo.getGold());
			return jzOrderDao.updateState(id, state);
		}
	}
	
	private boolean checkTime(List<JzOrder> jos,JzOrder jo) throws ParseException {
		  
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制  
 
        long _StartTime = jo.getStartTime().getTime(); 
        long _EndTime = jo.getEndTime().getTime();
        
		for(JzOrder tmpJo : jos) {
			long tmpStartTime = tmpJo.getStartTime().getTime(); 
	        long tmpEndTime = tmpJo.getEndTime().getTime();
	        
			if((tmpStartTime > _StartTime) && (tmpEndTime > _EndTime) && (_EndTime > tmpStartTime)) {
				return false;
			}else if((tmpStartTime > _StartTime) && (tmpEndTime < _EndTime)) {
				return false;
			}else if((tmpStartTime < _StartTime) && (tmpEndTime > _EndTime)) {
				return false;
			}else if((tmpStartTime < _StartTime) && (tmpEndTime < _EndTime) && (_StartTime < tmpEndTime)) {
				return false;
			}else if((tmpStartTime == _StartTime) && (tmpEndTime == _EndTime)) {
				return false;
			}
			
		}
		return true;
	}
	
	//插入一条 0插入失败  1插入成功  2时间重复  3时间区间不对
	public int insert(JzOrder jo) throws ParseException {
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		jo.setCreateTime(nowTime);
		jo.setoId("DD"+nowTime.getTime());
		List<JzOrder> jos = jzOrderDao.findOrderTime(jo);
		if(jo.getIsCompany() == 0) {
			//私人才查重
			//判断是否时间重复
			try {
				boolean flag = checkTime(jos, jo);
				if(!flag) {
					return 2;
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");//24小时制  
		 
        long _StartTime = jo.getStartTime().getTime(); 
        long _EndTime = jo.getEndTime().getTime();
		
		//计算金额
		if("家庭保姆".equals(jo.getServerType())) {
			int day = (int) ((_EndTime - _StartTime)/(24*60*60*1000)) + 1;
			jo.setGold(jo.getGold()*day);
		}else {
			int hour = (int) ((_EndTime - _StartTime)/(60*60*1000)) + 1;
			if(hour == 0) {
				return 3;
			}
			jo.setGold(jo.getGold()*hour);
		}
		
		
		return jzOrderDao.insert(jo);
	}
	
}
