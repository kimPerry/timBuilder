import { Component, OnInit } from '@angular/core';
import { Tim } from '../../classes/tim';
import { RSU } from '../../classes/rsu';
import { TimMessage } from '../../classes/tim-message';
import { TimSample } from '../../classes/tim-sample';
import { DataFrame } from '../../classes/data-frame';
import { ITISCODES } from '../../data/itis-codes';
import { RSUDATA } from '../../data/rsu-data';
import { ItisCode } from '../../classes/itis-code';
import { Region } from '../../classes/region';
import { J2735Position3D } from '../../classes/J2735-Position-3D';
import { Geometry } from '../../classes/geometry';
import { Circle } from '../../classes/circle';
import { SNMP } from '../../classes/snmp';
import { TimCreatorService } from '../../services/tim-creator.service';
import { Response } from '@angular/http';

@Component({
	selector: 'tc-home',
	templateUrl: './home.component.html',
	providers: [TimCreatorService]
})
export class HomeComponent implements OnInit{

	tim: TimMessage;
	itisCodes: ItisCode[];
	testJSON: string;
	df: DataFrame;
	rsuData: RSU[];	

   	constructor(private timCreatorService : TimCreatorService){ }

	ngOnInit(){			
		this.tim = new TimMessage();
		this.itisCodes = ITISCODES;
		this.df = new DataFrame();
		this.rsuData = RSUDATA;
	}

	checkChanged(e){
		for(let r of this.rsuData){  			
			if(r.rsuTarget == e.target.name){ 
				if(e.target.checked)
					r.isSelected = true;			
				else
					r.isSelected = false;
			}
		}
	}

	submitForm(){
		let timSample = new TimSample();
		let tim = new Tim();
		tim.msgCnt = "13";
		tim.timeStamp = "2017-03-13T01:07:11-05:00";
		tim.packetID = "1";
		tim.urlB = "null";

		this.df.sspTimRights = "0";
		this.df.frameType = "0";
		this.df.msgID = "RoadSignID";
		this.df.position = new J2735Position3D();
		this.df.position.latitude = "41.678473";
		this.df.position.longitude = "-108.782775";
		this.df.position.elevation = "917.1432";
		this.df.viewAngle = "1010101010101010";
		this.df.mutcd = "5";
		this.df.crc = "0000000000000000";
		this.df.priority = "0";
		this.df.sspLocationRights = "3";
		this.df.regions = [];

		let region = new Region();
		region.name = "TRIHYDRO TEST";
		region.regulatorID = "23";
		region.segmentID = "33";
		region.anchorPosition = new J2735Position3D();
		region.anchorPosition.latitude = "41.678473";
		region.anchorPosition.longitude = "-108.782775";
		region.anchorPosition.elevation = "917.1432";
		region.laneWidth = "7";
		region.directionality = "3";
		region.closedPath = "false";
		region.direction = "1010101010101010";
		region.description = "geometry";
		region.geometry = new Geometry();
		region.geometry.direction = "1010101010101010";
		region.geometry.extent = "1";
		region.geometry.laneWidth = "33";
		region.geometry.circle = new Circle();
		region.geometry.circle.position = new J2735Position3D();
		region.geometry.circle.position.latitude = "41.678473";
		region.geometry.circle.position.longitude = "-108.782775";
		region.geometry.circle.position.elevation = "917.1432";
		region.geometry.circle.radius = "15";
		region.geometry.circle.units = "7";

		this.df.sspMsgTypes = "2";
		this.df.sspMsgContent = "3";
		this.df.content = "Advisory";
		this.df.items = [];
		this.df.items.push("250");
		this.df.url = "null";

		this.df.regions.push(region);
		let dfa: DataFrame[] = [];
		dfa.push(this.df);
		tim.dataframes = dfa;
		timSample.tim = tim;

		timSample.rsus = [];

		// selected RSUs
		for(let r of this.rsuData){  			
			if(r.isSelected){ 
				timSample.rsus.push(r);
			}
		}


		timSample.snmp = new SNMP();
		timSample.snmp.rsuid = "8300";
		timSample.snmp.msgid = "31";
		timSample.snmp.mode = "1";
		timSample.snmp.channel = "178";
		timSample.snmp.interval = "1";
		timSample.snmp.deliverystart = "2017-01-01T17:47:11-05:00";
		timSample.snmp.deliverystop = "2019-01-01T17:47:11-05:15";
		timSample.snmp.enable = "1";
		timSample.snmp.status = "4";

		this.testJSON = JSON.stringify(timSample);	

		// this.timCreatorService
  //     	.sendTim(timSample)
  //     	.subscribe(
  //     		(r: Response) => { console.log(''); }
  // 		);
        
	}
}