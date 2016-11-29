package org.nv.dom.web.dao.character;

import java.util.List;

import org.nv.dom.domain.character.CharacterData;
import org.nv.dom.domain.character.CharacterRecord;
import org.springframework.stereotype.Repository;

@Repository
public interface CharacterMapper {
	
	public List<CharacterData> getCharacterData();
	
	public int updateCharacterData(long gameId);

	public List<CharacterRecord> getCharacterRecord(Integer characterId);
}
