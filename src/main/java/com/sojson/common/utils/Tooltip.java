package com.sojson.common.utils;

/**
 * Created by BaoBao on 2017/5/7.
 */
public class Tooltip {

    /** 返回结果码 一般1成功0失败 */
    private int resultCode;
    /** 成功提示 */
    private String succMsg;
    /** 失败提示 */
    private String errMsg;
    /** 需要携带数据 */
    private Object data;

    public static Tooltip Tip(int code){
        Tooltip t = new Tooltip();
        t.setResultCode(code);
        return t;
    }

    public static Tooltip Tip(int code, Object data) {
        Tooltip t = new Tooltip();
        t.setResultCode(code);
        t.setData(data);
        return t;
    }

    public static Tooltip error(int code, String errMsg) {
        Tooltip t = new Tooltip();
        t.setResultCode(code);
        t.setErrMsg(errMsg);
        return t;
    }

    public static Tooltip succ(int code, String succMsg) {
        Tooltip t = new Tooltip();
        t.setResultCode(code);
        t.setSuccMsg(succMsg);
        return t;
    }
    /**
     *
     * @Description 操作成功，resultCode为200
     * @param succMsg 成功提示语
     * @return
     */
    public static Tooltip succ(String succMsg) {
        Tooltip t = new Tooltip();
        t.setResultCode(200);
        t.setSuccMsg(succMsg);
        return t;
    }

    /**
     *
     * @Description 操作成功，resultCode为200，提示为操作成功
     * @return
     */
    public static Tooltip succ() {
        Tooltip t = new Tooltip();
        t.setResultCode(200);
        t.setSuccMsg("操作成功");
        return t;
    }

    /**
     *
     * @Description 操作失败，resultCode为500
     * @param errMsg 失败提示语
     * @return
     */
    public static Tooltip error(String errMsg) {
        Tooltip t = new Tooltip();
        t.setResultCode(500);
        t.setErrMsg(errMsg);
        return t;
    }
    /**
     *
     * @Description 操作失败，resultCode为500，提示为操作失败
     * @return
     */
    public static Tooltip error() {
        Tooltip t = new Tooltip();
        t.setResultCode(500);
        t.setErrMsg("操作失败");
        return t;
    }

    /**
     *
     * @Description 操作成功，resultCode为200，提示为操作成功
     * @param data 携带数据
     * @return
     */
    public static Tooltip succdata(Object data) {
        Tooltip t = new Tooltip();
        t.setResultCode(200);
        t.setSuccMsg("操作成功");
        t.setData(data);
        return t;
    }

    public int getResultCode() {
        return resultCode;
    }
    public void setResultCode(int resultCode) {
        this.resultCode = resultCode;
    }
    public String getSuccMsg() {
        return succMsg;
    }
    public void setSuccMsg(String succMsg) {
        this.succMsg = succMsg;
    }
    public String getErrMsg() {
        return errMsg;
    }
    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
