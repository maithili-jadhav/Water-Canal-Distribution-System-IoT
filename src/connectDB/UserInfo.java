package connectDB;

public class UserInfo
{
	static String fname, mobile, address, cid, planId, planHours;

	public static String getFname() {
		return fname;
	}

	public static String getPlanHours() {
		return planHours;
	}

	public static void setPlanHours(String planHours) {
		UserInfo.planHours = planHours;
	}													

	public static void setFname(String fname) {
		UserInfo.fname = fname;
	}

	public static String getMobile() {
		return mobile;
	}

	public static void setMobile(String mobile) {
		UserInfo.mobile = mobile;
	}

	public static String getAddress() {
		return address;
	}

	public static void setAddress(String address) {
		UserInfo.address = address;
	}

	public static String getCid() {
		return cid;
	}

	public static void setCid(String cid) {
		UserInfo.cid = cid;
	}

	public static String getPlanId() {
		return planId;
	}

	public static void setPlanId(String planId) {
		UserInfo.planId = planId;
	}
	
	
}
