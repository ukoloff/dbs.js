###
Entry point
###

q = yaml.safeLoad """
x: 5
y: z
"""
echo q.y

S = yaml.safeDump a: b: "Hi!"
echo S
