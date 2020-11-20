float4x4 worldViewProj;

Texture2D DiffuseTexture 			: register(t0);
SamplerState Sampler			 	: register(s0);

struct VS_IN
{
	float4 pos : POSITION;
	float2 tex : TEXCOORD;
};

struct PS_IN
{
	float4 pos : SV_POSITION;
	float2 tex : TEXCOORD;
};

PS_IN VS( VS_IN input )
{
	PS_IN output = (PS_IN)0;
	
	output.pos = mul(input.pos, worldViewProj);
	output.tex = input.tex;
	
	return output;
}

float4 PS( PS_IN input ) : SV_Target
{
	return DiffuseTexture.Sample(Sampler, input.tex);
}
