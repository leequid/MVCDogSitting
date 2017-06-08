package entities;

public enum Availability {
	ANYTIME(1), WEEKENDS(2), WEEKDAYS(3), EVENINGS (4), OVERNIGHTS (5);

    private int description;

    //constructor
    private Availability(int description) {
        this.description = description;
    }

    //add a getter for description
	public int getDescription() {
		return description;
	}

	public static Availability valueOf(Integer availability) {
		for (Availability a : values()) {
			if (a.description == availability) {
				return a;
			}
		}
		return null;
	}

}