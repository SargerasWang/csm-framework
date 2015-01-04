package com.sargeraswang.webmanager.bean.sys;

import java.util.List;

/**
 * Created by SagerasWang on 14/12/31.
 */
public class TreeMenu {
    private Integer id;
    private String name;
    private String url;
    private Integer level;
    private String icon;
    private List<TreeMenu> childrens;

    public TreeMenu(SystemMenu menu){
        super();
        this.setId(menu.getId());
        this.setName(menu.getName());
        this.setLevel(menu.getLevel());
        this.setIcon(menu.getIcon());
        this.setUrl(menu.getUrl());
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public List<TreeMenu> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<TreeMenu> childrens) {
        this.childrens = childrens;
    }
}
