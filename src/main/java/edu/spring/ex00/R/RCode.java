package edu.spring.ex00.R;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RCode {
	
	public REXP x = null;
	public RConnection c = null;
	public String retStr = "";
	
	public String returnRClass() throws RserveException, REXPMismatchException{
		// 카운트로 점*선 그래프를 그림
		// x 축은 날짜, y 축은 카운트
		// TOP 3 만 출력
		// 카운트 값, 날짜 값 -> 카운트 별 정렬
		// 
		
		c = new RConnection();
        x = c.eval("1+2");
        retStr = x.asString();

        return retStr;
	}
	
}
