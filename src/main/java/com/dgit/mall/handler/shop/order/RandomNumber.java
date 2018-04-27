package com.dgit.mall.handler.shop.order;

import java.util.Random;

public class RandomNumber {
/*private int certNumLength = 12;
    
    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        
        int range = (int)Math.pow(9,certNumLength);
        int trim = (int)Math.pow(9, certNumLength-1);
        int result = random.nextInt(range)+trim;
         
        if(result>range){
            result = result - trim;
        }
        
        return String.valueOf(result);
    }

    public int getCertNumLength() {
        return certNumLength;
    }

    public void setCertNumLength(int certNumLength) {
        this.certNumLength = certNumLength;
    }
    */
    private int certCharLength = 12;
    private final char[] characterTable = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
    
    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        int tablelength = characterTable.length;
        StringBuffer buf = new StringBuffer();
        
        for(int i = 0; i < certCharLength; i++) {
            buf.append(characterTable[random.nextInt(tablelength)]);
        }
        
        return buf.toString();
    }

    public int getCertCharLength() {
        return certCharLength;
    }

    public void setCertCharLength(int certCharLength) {
        this.certCharLength = certCharLength;
    }
    public static void main(String[] args) {
        RandomNumber ge = new RandomNumber();
        ge.setCertCharLength(11);
        System.out.println(ge.excuteGenerate());
    }
}
