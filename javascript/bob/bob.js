var Bob = function(){

  this.response = {
    silent : "Fine. Be that way!",
    shouting : "Woah, chill out!",
    question : "Sure.",
    other : "Whatever.",
  }

  this.hey = function(message){
    msg = new Message(message);

    if (msg.is_silence()){
      return this.response.silent;
    }
    else if (msg.is_shouting()){
      return this.response.shouting;
    }
    else if (msg.is_question()){
      return this.response.question;
    }
    return this.response.other;
  }

}

var Message = function(msg){
    this.msg = msg.trim();

    this.is_silence = function(){
      return this.msg === "";
    }

    this.is_shouting  = function(){
      return this.msg === this.msg.toUpperCase();
    }

    this.is_question = function(){
      return this.msg[this.msg.length-1] === "?";
    }
}

module.exports = Bob;
