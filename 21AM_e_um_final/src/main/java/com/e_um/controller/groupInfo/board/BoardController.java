package com.e_um.controller.groupInfo.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.groupInfo.board.BoardServiceInterface;
import com.e_um.model.sevice.userInfo.user.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class BoardController {

	@Autowired
	BoardServiceInterface service;
}
