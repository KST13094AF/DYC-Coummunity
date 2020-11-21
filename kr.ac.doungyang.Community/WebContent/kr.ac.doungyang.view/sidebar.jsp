<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">Home</li>
                    <li>
                        <a href="home.do" aria-expanded="false">
                            <i class="ti-home"></i><span class="nav-text">메인 화면</span>
                        </a>
                    </li>
                    <li>
                        <a href="postHome.do" aria-expanded="false">
                           	<i class="icon-envelope menu-icon"></i><span class="nav-text">우편함</span>
                        </a>
                        <br>
                    </li>
                    <li class="nav-label">Major board</li>
                    <li>
                        <a href="bbsAction.do?major=자유게시판" aria-expanded="false">
                           	<i class="icon-grid menu-icon"></i><span class="nav-text">자유게시판</span>
                        </a>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">공학부</span>
                        </a>
                        <ul aria-expanded="false">
                         	<li>
                         	  	<a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav">컴퓨터공학부</span></a>
                        		<ul aria-expanded="false">
                            		<li><a href="bbsAction.do?depart=컴퓨터공학부&major=컴퓨터공학과">컴퓨터공학과</a></li>
                            		<li><a href="bbsAction.do?depart=컴퓨터공학부&major=컴퓨터소프트웨어공학과">컴퓨터소프트웨어공학과</a></li>
                        		</ul>
                    		</li>
                           	<li>
                         	  	<a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav">전기전자공학부</span></a>
                        		<ul aria-expanded="false">
                            		<li><a href="bbsAction.do?depart=전기전자공학부&major=전기공학과">전기공학과</a></li>
                            		<li><a href="bbsAction.do?depart=전기전자공학부&major=정보전자공학과">정보전자공학과</a></li>
                            		<li><a href="bbsAction.do?depart=전기전자공학부&major=반도체전자공학과">반도체전자공학과</a></li>
                            		<li><a href="bbsAction.do?depart=전기전자공학부&major=정보통신공학과">정보통신공학과</a></li>
                        		</ul>
                    		</li>
                    		<li>
                         	  	<a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav">로봇자동화공학부</span></a>
                        		<ul aria-expanded="false">
                            		<li><a href="bbsAction.do?depart=로봇자동화공학부&major=자동화공학과">자동화공학과</a></li>
                            		<li><a href="bbsAction.do?depart=로봇자동화공학부&major=로봇공학과">로봇공학과</a></li>
                        		</ul>
                    		</li>
                    		<li>
                         	  	<a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav">기계공학부</span></a>
                        		<ul aria-expanded="false">
                            		<li><a href="bbsAction.do?depart=기계공학부&major=기계공학과">기계공학과</a></li>
                            		<li><a href="bbsAction.do?depart=기계공학부&major=기계설계공학과">기계설계공학과</a></li>
                        		</ul>
                    		</li>
                    		<li>
                         	  	<a class="has-arrow" href="javascript:void()" aria-expanded="false"><span class="nav">생활환경공학부</span></a>
                        		<ul aria-expanded="false">
                            		<li><a href="bbsAction.do?depart=생활환경공학부&major=생명화학공학과">생명화학공학과</a></li>
                            		<li><a href="bbsAction.do?depart=생활환경공학부&major=식품공학과">식품공학과</a></li>
                            		<li><a href="bbsAction.do?depart=생활환경공학부&major=건축과">건축과</a></li>
                            		<li><a href="bbsAction.do?depart=생활환경공학부&major=실내환경디자인과">실내환경디자인과</a></li>
                            		<li><a href="bbsAction.do?depart=생활환경공학부&major=시각정보디자인과">시각정보디자인과</a></li>
                        		</ul>
                    		</li>
                  		</ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">경영학부</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="bbsAction.do?depart=경영학부&major=경영학과">경영학과</a></li>
                            <li><a href="bbsAction.do?depart=경영학부&major=세무회계학과">세무회계학과</a></li>
                            <li><a href="bbsAction.do?depart=경영학부&major=유통마케팅학과">유통마케팅학과</a></li>
                            <li><a href="bbsAction.do?depart=경영학부&major=관광컨벤션학과">관광컨벤션학과</a></li>
                            <li><a href="bbsAction.do?depart=경영학부&major=경영정보학과">경영정보학과</a></li>
                        </ul>
                        <br>
                    </li>
                    <li class="nav-label">Share</li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">이 수업 어때요?</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="bbsAction.do?depart=이 수업 어때요?&major=공학부">공학부</a></li>
                            <li><a href="bbsAction.do?depart=이 수업 어때요?&major=경영학부">경영학부</a></li>
                            <li><a href="bbsAction.do?depart=이 수업 어때요?&major=교양과">교양</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">기타</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="bbsAction.do?depart=기타&major=수업교환">수업 교환</a></li>
                            <li><a href="bbsAction.do?depart=기타&major=취미공유">취미 공유</a></li>
                        </ul>
                        <br>
                    </li>
                    <li class="nav-label">Report</li>
                    <li>
                        <a href="report.do" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i><span class="nav-text">제보 부탁해요!</span>
                        </a>
                        <br>
                    </li>
                </ul>
            </div>
        </div>