// Maggie código
s0.initImage("https://res.cloudinary.com/dk8ffjlmo/image/upload/v1704255774/img/3.jpg");
src(s0)
	.scale(0.5)
	.repeat(2, 2)
	.blend(src(s0)
		.scale(0.5)
		.repeat(2, 2)
		.scrollX(0.537), 0.5)
	.modulate(osc(10, 0.1, 1), 0.5)
	.out();
