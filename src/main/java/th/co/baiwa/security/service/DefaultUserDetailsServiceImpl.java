package th.co.baiwa.security.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import th.co.baiwa.admin.entity.User;
import th.co.baiwa.common.util.BooleanToStringConverter;
import th.co.baiwa.security.dao.UserDetailsDao;
import th.co.baiwa.security.model.UserDetails;

@Service("userDetailsService")
public class DefaultUserDetailsServiceImpl implements UserDetailsService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserDetailsDao userDetailsDao;
	
	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("loadUserByUsername username=" + username);
		
		User user = userDetailsDao.findByUsername(username);
		
		if(user==null) throw new UsernameNotFoundException("Can not find data in ADM_USER with username: " + username);
		
		// Get User Profile & Theme
		
		// Initial Granted Authority
		List<GrantedAuthority> grantedAuthorityList = new ArrayList<GrantedAuthority>();
		// Add Role
		grantedAuthorityList.addAll(userDetailsDao.findGrantedRoleByUserId(user.getUserId()));
		// Add Operation
//		grantedAuthorityList.addAll(userDetailsDao.findGrantedOperationByUserId(user.getUserId()));
		
		UserDetails userDetails = new UserDetails(
			user.getUsername(),
			user.getPassword(),
			BooleanToStringConverter.convertToBeanAttribute(user.getEnabled()),
			BooleanToStringConverter.convertToBeanAttribute(user.getAccountNonExpired()),
			BooleanToStringConverter.convertToBeanAttribute(user.getCredentialsNonExpired()),
			BooleanToStringConverter.convertToBeanAttribute(user.getAccountNonLocked()),
			grantedAuthorityList
		);
		userDetails.setUserId(user.getUserId());
		userDetails.setUserProfile(user);
		return userDetails;
	}
	
}
