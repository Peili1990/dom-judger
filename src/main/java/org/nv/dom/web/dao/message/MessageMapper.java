package org.nv.dom.web.dao.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.domain.message.speech.Speech;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageMapper {
	
	public List<Speech> getSpeechListDao(long newspaperId);
	
	public int checkHasSpeech(@Param("newspaperId")long newspaperId, @Param("playerId")long playerId);

}
