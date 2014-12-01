package dating_system

import information.User

class UserComparator implements Comparator<User>{
	String field="";
	boolean asc=true;
	public UserComparator(String field,boolean asc){
		this.field=field;
		this.asc=asc;
	}
	@Override
	public int compare(User o1, User o2) {
		if(field.equalsIgnoreCase("revenue"))
			return (o1.getRevenue()-o2.getRevenue())*(asc?1:-1);
		else if(field.equalsIgnoreCase("numDates"))
			return (o1.getNumDates()-o2.getNumDates())*(asc?1:-1);
		return 0;
	}
}
