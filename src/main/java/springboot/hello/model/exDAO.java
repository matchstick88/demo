package springboot.hello.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class exDAO {
    @Autowired
    JdbcTemplate jt;

    public List<Map<String,?>> selectAll() {
        return jt.query("select * from user", (rs, rowNum)-> {
            Map<String,Object> mss = new HashMap<>();
            mss.put("name", rs.getString(1));
            mss.put("age", rs.getInt(2));
            mss.put("gender", rs.getString(3));
            mss.put("address", rs.getString(4));
            return mss;
        });
    }
}
