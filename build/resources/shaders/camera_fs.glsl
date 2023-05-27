#version 330 core
out vec4 FragColor;

in vec2 TexCoord;
in vec3 FragPos;

// texture sampler
uniform sampler2D texture1;
uniform vec3 CameraPos;

void main()
{
	float fragmentDistance = sqrt(pow(abs(FragPos.x - CameraPos.x), 2)+pow(abs(FragPos.z - CameraPos.z), 2) + pow(abs(FragPos.y - CameraPos.y), 2));
	float fogMultiplier = pow(2, 50/fragmentDistance)/100;
	
	if (fogMultiplier < 0.025) discard;
	if (fogMultiplier > 1) fogMultiplier = 1;
	FragColor = texture(texture1, TexCoord) * vec4(1, 1, 1, fogMultiplier);
}