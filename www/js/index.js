/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        this.receivedEvent('deviceready');
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var button = document.getElementById("initAdfurikun");
        button.addEventListener("click", initAdfurikun);
        
        var showRewardAd = document.getElementById("showReward");
        showRewardAd.addEventListener("click", showReward);
    }
};

app.initialize();

function initAdfurikun() {
    cordova.exec(onInitSuccess,
                 onInitFail,
                 "adfurikun",
                 "initWithAppID",
                 ["587448b42e3495fa11000d61"]);
}

function onInitSuccess() {
    alert("ready to showAd");
}

function onInitFail(message) {
    alert('Failed because: ' + message);
}

function showReward() {
    cordova.exec(onShowAdSuccess,
                 onShowAdFail,
                 "adfurikun",
                 "showReward",
                 ["587448b42e3495fa11000d61"]);
}

function onShowAdSuccess() {
    alert("did show reward");
    
    cordova.exec(onInitSuccess,
                 onInitFail,
                 "adfurikun",
                 "resetInitCallbackId",
                 ["587448b42e3495fa11000d61"]);
}

function onShowAdFail(message) {
    alert('Failed because: ' + message);
}

