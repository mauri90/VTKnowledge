<?php
 
/**
 * Table data gateway.
 * 
 *  OK I'm using old MySQL driver, so kill me ...
 *  This will do for simple apps but for serious apps you should use PDO.
 */
class QuestionGateway {
     
    public function selectAll($order) {
        if ( !isset($order) ) {
            $order = "name";
        }
        $dbOrder =  mysql_real_escape_string($order);
        $dbres = mysql_query("SELECT * FROM topic ORDER BY $dbOrder ASC");
         
        $topics = array();
        while ( ($obj = mysql_fetch_object($dbres)) != NULL ) {
            $topics[] = $obj;
        }
         
        return $topics;
    }
     
    public function selectById($id) {
        $dbId = mysql_real_escape_string($id);
         
        $dbres = mysql_query("SELECT * FROM topic WHERE id=$dbId");
         
        return mysql_fetch_object($dbres);
         
    }
     
    public function insert($text, $user1,$user2,$topic1,$topic2) {
         
        $dbText = ($text != NULL)?"'".mysql_real_escape_string($text)."'":'NULL';
        $dbUser1 = ($user1 != NULL)?"'".mysql_real_escape_string($user1)."'":'NULL';
		$dbUser2 = ($user2 != NULL)?"'".mysql_real_escape_string($user2)."'":'NULL';
        $dbTopic1 = ($topic1 != NULL)?"'".mysql_real_escape_string($topic1)."'":'NULL';
        $dbTopic2 = ($topic2 != NULL)?"'".mysql_real_escape_string($topic2)."'":'NULL';
        
        
        mysql_query("INSERT INTO question (text,date,vote,user_id,user_id1, topic_id,topic_id1) VALUES ($dbText,now(),0,$dbUser1,$dbUser2,$dbTopic1,$dbTopic2)");
        return mysql_insert_id();
        
    }
     
    public function delete($id) {
        $dbId = mysql_real_escape_string($id);
        mysql_query("DELETE FROM topic WHERE id=$dbId");
    }
     
    public function update( $id, $name, $desc ) {
         
        $dbId = ($id != NULL)?"'".mysql_real_escape_string($id)."'":'NULL';
        $dbName = ($name != NULL)?"'".mysql_real_escape_string($name)."'":'NULL';
        $dbDesc = ($desc != NULL)?"'".mysql_real_escape_string($desc)."'":'NULL';
		
        mysql_query("update topic set name=$dbName, description=$dbDesc,date=now() where id=$dbId");
        
    }
}
 
?>