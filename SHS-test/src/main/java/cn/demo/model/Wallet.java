package cn.demo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_wallet")
public class Wallet implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1203235024389978518L;
	private String addressId;
	private int memId;
	private double amount;
	private Date genTime;
	private Date lockTime;
	private boolean locked;

	@Id
	@Column(name = "address_id")
	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	@Column(name = "mem_id")
	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	@Column(name = "amount")
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Column(name = "gen_time")
	public Date getGenTime() {
		return genTime;
	}

	public void setGenTime(Date genTime) {
		this.genTime = genTime;
	}
	
	
	@Column(name = "lock_time")
	public Date getLockTime() {
		return lockTime;
	}

	public void setLockTime(Date lockTime) {
		this.lockTime = lockTime;
	}

	@Column(name = "locked")
	public boolean isLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
	}

	@Override
	public String toString() {
		return "Wallet [addressId=" + addressId + ", memId=" + memId
				+ ", amount=" + amount + ", locked=" + locked + "]";
	}
	
	

}
