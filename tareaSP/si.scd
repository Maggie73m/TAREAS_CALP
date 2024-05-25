s.boot;

SynthDef(\sampleSound, {
    arg bufnum, rate = 1, amp = 0.5;
    var sound;
    sound = PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum) * rate, doneAction: 2) * amp;
    Out.ar(0, sound);
}).add;


~loadBuffers = {
    ~buffers = [
        Buffer.read(s, "C:/Users/hooni/Downloads/tareaSP/1.wav"),
        Buffer.read(s, "C:/Users/hooni/Downloads/tareaSP/2.wav"),
        Buffer.read(s, "C:/Users/hooni/Downloads/tareaSP/3.wav"),
        Buffer.read(s, "C:/Users/hooni/Downloads/tareaSP/4.wav")
    ];
    s.sync;
    "Buffers loaded successfully.".postln;
};


~loadBuffers.value;


Pdef(\sampleSeq1, Pbind(
    \instrument, \sampleSound,
    \bufnum, ~buffers[0].bufnum,
    \rate, 1,
    \amp, 0.5,
    \dur, 0.5
));

Pdef(\sampleSeq2, Pbind(
    \instrument, \sampleSound,
    \bufnum, ~buffers[1].bufnum,
    \rate, 0.8,
    \amp, 0.6,
    \dur, 0.75
));

Pdef(\sampleSeq3, Pbind(
    \instrument, \sampleSound,
    \bufnum, ~buffers[2].bufnum,
    \rate, 1.2,
    \amp, 0.7,
    \dur, 0.25
));

Pdef(\sampleSeq4, Pbind(
    \instrument, \sampleSound,
    \bufnum, ~buffers[3].bufnum,
    \rate, 1,
    \amp, 0.8,
    \dur, 1
));


s.sync;
Pdef(\sampleSeq1).play;
Pdef(\sampleSeq2).play;
Pdef(\sampleSeq3).play;
Pdef(\sampleSeq4).play;
