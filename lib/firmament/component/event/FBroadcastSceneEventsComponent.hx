package firmament.component.event;

import firmament.component.base.FEntityComponent;
import firmament.core.FEvent;
import firmament.util.FEntityUtils;
import firmament.core.FEntityFactory;
import firmament.core.FEntity;
import firmament.event.FEntityEvent;
import firmament.util.FLog;
import firmament.core.FConfig;
import firmament.scene.FScene;
import firmament.core.FGame;

/*
	Class: FEntityEmitterComponent
	emits the specified entities when an event is fired.
*/
class FBroadcastSceneEventsComponent extends FEntityComponent{

	public function new(){
		super();
		
	}

	override public function init(config:FConfig){
		var scene:FScene = FGame.getInstance().getCurrentScene();
		var listeners:FConfig = _config.getNotNull("listen");
		for(evt in listeners.fields() ){
			_entity.on(cast(evt,String),this,function(e:FEvent){
				FLog.debug("Sending <"+e.name+"> to scene");
				scene.trigger(new FEvent(e.name));
			});
		}
	}

	override public function getType(){
		return "broadcastSceneEvents";
	}	
}