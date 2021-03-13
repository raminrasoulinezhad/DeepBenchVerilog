import tensorflow as tf

class MyModel(tf.keras.Model):

	def __init__(self):
		super(MyModel, self).__init__()
		self.dense1 = tf.keras.layers.Dense(40, activation=tf.nn.relu)
		self.dense2 = tf.keras.layers.Dense(50, activation=tf.nn.softmax)
		self.dropout = tf.keras.layers.Dropout(0.5)

	def call(self, inputs, training=False):
		x = self.dense1(inputs)
		if training:
			x = self.dropout(x, training=training)
		x = self.dense2(x)
		return x


if __name__ == "__main__":
	
	model = MyModel()

	#input_shape = (4, 28, 28, 3)
	input_shape = (4, 28)
	x = tf.random.normal(input_shape)
	y = model(x)
	print(y.shape)
