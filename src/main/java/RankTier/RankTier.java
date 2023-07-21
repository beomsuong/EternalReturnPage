package RankTier;

public class RankTier {
    public String Tier(int MMR) {
    	//미스릴 이상부터는 랭킹도 조회하는 코드 추가해야함
    	  if (MMR >= 2400) {
             return Rank(MMR);
         }
    else if (MMR <=2400) {
            return "Diamond";
        } else if (MMR <= 2000) {
            return "Platinum";
        } else if (MMR <= 1600) {
            return "Gold";
        } else if (MMR <= 800) {
            return "Bronze";
        } else {
            return "Iron";
        }
    }
    public String Rank(int MMR) {
    	int userRanking=0;//API사용해서 등수 받아오기
    	if(200>=userRanking) {
    		return "Immortal";
    	}
    	else if(700>=userRanking)
    		return "Titan";
    	else
    		return "Mithril";
    }
}
