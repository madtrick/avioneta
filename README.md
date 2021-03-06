[![Analytics](https://ga-beacon.appspot.com/UA-46795389-1/avioneta/README)](https://github.com/igrigorik/ga-beacon)

#AVIONETA

Frontend of the game [Avioneta](https://madtrick.github.io/avioneta)

##About the game

Avioneta is a multiplayer game where players fight to destroy its opponents. The game runs in the browser using HTML5 technologies like WebSockets and Canvas.

The game is architectured in a client-server fashion where the [client](https://github.com/madtrick/avioneta) send commands to the [server](https://github.com/madtrick/avioneta-server) to update the game state.

The code for the server of the game is on this other repository: [https://github.com/madtrick/avioneta-server](https://github.com/madtrick/avioneta-server)

##About the frontend
The frontend reacts to user actions updating its game state, redrawing the game-world and sending the user actions to the server encapsulated as commands.

The frontend does not use any framework or game engine to do the rendering, game state handling or other gaming related actions. Everything was built from scratch just as a pedagogical experience for myself.
  
##Author

This game was developed by Farruco Sanjurjo. You can find me:

  * On Twitter [@madtrick](https://twitter.com/madtrick)
  * Email [madtrick@gmail.com](madtrick@gmail.com)

##License
Copyright [2013] [Farruco Sanjurjo Arcay]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
