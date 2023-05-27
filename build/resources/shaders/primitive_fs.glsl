#version 330 core
out vec4 FragColor;

struct DirectionalLight {
    vec3 direction, ambient, diffuse;
};

struct Material {
    vec3 ambient, diffuse;
};

uniform vec3 CameraPos;
uniform DirectionalLight directional_light;
uniform Material material;

in vec3 FragPos;
in vec3 Normal;

vec3 ambient = vec3(0);
vec3 diffuse = vec3(0);
vec3 norm = normalize(Normal);

void calculateLighting(vec3 light_ambient, vec3 light_diffuse, vec3 lightDir);

void main()
{
    vec3 lightDir = normalize(-directional_light.direction);
    calculateLighting(directional_light.ambient, directional_light.diffuse, lightDir);

    ambient = ambient * 0.5 * material.ambient;
    diffuse = diffuse * material.diffuse;

    // adds rudimentary fog
	float fragmentDistance = sqrt(pow(abs(FragPos.x - CameraPos.x), 2)+pow(abs(FragPos.z - CameraPos.z), 2) + pow(abs(FragPos.y - CameraPos.y), 2));
	float fogMultiplier = pow(2, 50/fragmentDistance)/100;
	
	if (fogMultiplier < 0.025) discard;
	else FragColor = vec4(ambient + diffuse, 1.0) * vec4(1, 1, 1, fogMultiplier);
}

void calculateLighting(vec3 light_ambient, vec3 light_diffuse, vec3 lightDir){
    ambient += light_ambient;
    float diff = max(dot(norm, lightDir), 0.0);
    diffuse += light_diffuse * diff;
}