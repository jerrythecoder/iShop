package com.ishop.model;

import java.io.Serializable;

/**
 * Class for composite primary key of entity Authority.
 * 
 * @see http://stackoverflow.com/questions/3585034/how-to-map-a-composite-key-with-hibernate
 * 
 * @author Jerry
 *
 */
public class AuthorityPK implements Serializable {

	private static final long serialVersionUID = 2173841373624510801L;
	
	private String username;
	private String authority;
	
	public AuthorityPK() {}

	public AuthorityPK(String username, String authority) {
		this.username = username;
		this.authority = authority;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((authority == null) ? 0 : authority.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AuthorityPK other = (AuthorityPK) obj;
		if (authority == null) {
			if (other.authority != null)
				return false;
		} else if (!authority.equals(other.authority))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

}
