#include "graphicsdisplay.h"
#include <string>
#include "window.h"

using namespace std;

GraphicsDisplay:: GraphicsDisplay(int height, int width, bool darkMode) {
    if (darkMode) { // switch to dark mode
      backgroundclor = Xwindow::Grey19;
      Lclor = Xwindow::Pink2;
      Tclor = Xwindow::SteelBlue;
      Nclor = Xwindow::Grey19;
      L4clor = Xwindow::MediumPurple3;
      Hclor = Xwindow::WhiteSmoke;
      stringclor = Xwindow::WhiteSmoke;
    }
    int side = 30; // the side length of a cell
    int spacebetweenlines = 50;
    xw = make_shared<Xwindow>(650, side * height);
    int cnt = 0;
    xw->fillRectangle(0, 0, 700, side * height + 50, backgroundclor);
    // fill the background colour
    for (int i = 15; i < side * height; i += side) {
        xw->drawString(1, i, to_string(cnt), stringclor);
        cnt++;
    } // the verticle axis
    xw->fillRectangle(25, 0, 2, side * height, stringclor);
    xw->fillRectangle(30 + side * width, 0, 2, side * height, stringclor);
    xw->drawString(30 + side * width + 10, 15, "Level:", stringclor);
    xw->drawString(30 + side * width + 10, 15 + spacebetweenlines, "Score:", stringclor);
    xw->drawString(30 + side * width + 10, 15 + 2 * spacebetweenlines, "Hi Score:", stringclor);
    xw->drawString(30 + side * width + 10, 15 + 3 * spacebetweenlines, "Blocks since last clear:", stringclor);
    xw->drawString(30 + side * width + 10, 15 + 4 * spacebetweenlines, "Next:", stringclor);
    // print message informations
    xw->drawString(25 + side * width + 10, 515, "Quadris. Created by M. Zhang, R. Liu and Y. Ren", stringclor);
    xw->drawString(25 + side * width + 10, 530, "Copyright 2018 VCW. All rights reserved.", stringclor);
}

void GraphicsDisplay:: notify(Subject &whoNotified) {
    Info info = whoNotified.getInfo();
    int side = 30;
    int error = 2;
    int len = side-error;
    int r = (int) info.col;
    int c = (int) info.row;
    BlockType type = info.type;
    switch(type) {
            // if a cell has changed, change the cell's colour according to the corresponding state
        case BlockType::I :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Iclor);
            break;
        case BlockType::J :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Jclor);
            break;
        case BlockType::L :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Lclor);
            break;
        case BlockType::O :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Oclor);
            break;
        case BlockType::S :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Sclor);
            break;
        case BlockType::Z :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Zclor);
            break;
        case BlockType::T :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Tclor);
            break;
        case BlockType::N :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Nclor);
            break;
        case BlockType::L4 :
            xw->fillRectangle((side * r) + 30, side * c, len, len, L4clor);
            break;
        case BlockType::Hint :
            xw->fillRectangle((side * r) + 30, side * c, len, len, Hclor);
            break;
    }
}

void GraphicsDisplay:: printMessage(int level, int score, int hiscore, int sinceLastclear, int height, int width, BlockType type) {
    int side = 30;
    int error = 2;
    int len = side - error;
    int spacebetweenlines = 50;
    // cover/erase the original information
    xw->fillRectangle(30 + side * width + 10, 20, 200, 30, backgroundclor);
    xw->fillRectangle(30 + side * width + 10, 20 + spacebetweenlines, 200, 30, backgroundclor);
    xw->fillRectangle(30 + side * width + 10, 20 + 2 * spacebetweenlines, 200, 30, backgroundclor);
    xw->fillRectangle(30 + side * width + 10, 20 + 3 * spacebetweenlines, 200, 30, backgroundclor);
    xw->fillRectangle(30 + side * width + 10, 20 + 4 * spacebetweenlines, 4 * side, 4 * side, backgroundclor);
    // update the new information
    xw->drawString(30 + side * width + 10, 35, to_string(level), stringclor);
    xw->drawString(30 + side * width + 10, 35 + spacebetweenlines, to_string(score), stringclor);
    xw->drawString(30 + side * width + 10, 35 + 2 * spacebetweenlines, to_string(hiscore), stringclor);
    xw->drawString(30 + side * width + 10, 35 + 3 * spacebetweenlines, to_string(sinceLastclear), stringclor);
    int startr = 30 + side * width + 10;
    int startc = 30 + 4 * spacebetweenlines;
    switch(type) {
            // draw next type
        case BlockType::I :
            xw->fillRectangle(startr, startc, len, len, Iclor);
	    xw->fillRectangle(startr + side, startc, len, len, Iclor);
	    xw->fillRectangle(startr + 2 * side, startc, len, len, Iclor);
            xw->fillRectangle(startr + 3 * side, startc, len, len, Iclor);
            break;
        case BlockType::J :
            xw->fillRectangle(startr, startc, len, len, Jclor);
	    xw->fillRectangle(startr, startc + side, len, len, Jclor);
	    xw->fillRectangle(startr + side, startc + side, len, len, Jclor);
	    xw->fillRectangle(startr + 2 * side, startc + side, len, len, Jclor);
            break;
        case BlockType::L :
            xw->fillRectangle(startr + 2 * side, startc, len, len, Lclor);
            xw->fillRectangle(startr, startc + side, len, len, Lclor);
	    xw->fillRectangle(startr + side, startc + side, len, len, Lclor);
	    xw->fillRectangle(startr + 2 * side, startc + side, len, len, Lclor);
            break;
        case BlockType::O :
            xw->fillRectangle(startr, startc, len, len, Oclor);
	    xw->fillRectangle(startr + side, startc, len, len, Oclor);
	    xw->fillRectangle(startr, startc + side, len, len, Oclor);
	    xw->fillRectangle(startr + side, startc + side, len, len, Oclor);
            break;
        case BlockType::S :
            xw->fillRectangle(startr + side, startc, len, len, Sclor);
	    xw->fillRectangle(startr + 2 * side, startc, len, len, Sclor);
            xw->fillRectangle(startr, startc + side, len, len, Sclor);
	    xw->fillRectangle(startr + side, startc + side, len, len, Sclor);
            break;
        case BlockType::Z :
            xw->fillRectangle(startr, startc, len, len, Zclor);
	    xw->fillRectangle(startr + side, startc, len, len, Zclor);
            xw->fillRectangle(startr + side, startc + side, len, len, Zclor);
	    xw->fillRectangle(startr + 2 * side, startc + side, len, len, Zclor);
            break;
        case BlockType::T :
            xw->fillRectangle(startr, startc, len, len, Tclor);
            xw->fillRectangle(startr + side, startc, len, len, Tclor);
	    xw->fillRectangle(startr + 2 * side, startc, len, len, Tclor);
	    xw->fillRectangle(startr + side, startc + side, len, len, Tclor);
            break;
        case BlockType::N :
            break;
    }
}

GraphicsDisplay:: ~GraphicsDisplay(){
}

