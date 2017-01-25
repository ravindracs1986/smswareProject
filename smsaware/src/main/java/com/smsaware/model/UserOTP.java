package com.smsaware.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "USER_OTP")
public class UserOTP {
	/**
	 * SMSAWARE
	 */
	// @Column(name = "userId")
	@Id
	@Column(name = "userId")
	private Long userId;
	// @Column(name = "OTP")
	private String currentOtp;
	// @Column(name = "otpTime")
	private Date otpTime;
	// @Column(name = "isAuthenticated")
	private Integer isAuthenticated;

	public UserOTP() {
	}

	public UserOTP(Long userId, String currentOtp, Date otpTime, Integer isAuthenticated) {
		this.userId = userId;
		this.currentOtp = currentOtp;
		this.otpTime = otpTime;
		this.isAuthenticated = isAuthenticated;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getCurrentOtp() {
		return currentOtp;
	}

	public void setCurrentOtp(String currentOtp) {
		this.currentOtp = currentOtp;
	}

	public Date getOtpTime() {
		return otpTime;
	}

	public void setOtpTime(Date otpTime) {
		this.otpTime = otpTime;
	}

	public Integer getIsAuthenticated() {
		return isAuthenticated;
	}

	public void setIsAuthenticated(Integer isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}

	@Override
	public String toString() {
		return "UserOTP [userId=" + userId + ", currentOtp=" + currentOtp + ", otpTime=" + otpTime
				+ ", isAuthenticated=" + isAuthenticated + "]";
	}

}
