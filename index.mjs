import OpenAI from "openai";
import { execSync } from "child_process";
import dotenv from "dotenv";
dotenv.config();

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

async function main() {
  // Captura o diff entre HEAD e o commit anterior
  const diff = execSync("git diff HEAD^ HEAD", { encoding: "utf8" });

  if (!diff.trim()) {
    console.log("Sem alterações no diff.");
    return;
  }

  console.log("Enviando diff para a IA...\n");

  const resposta = await openai.chat.completions.create({
    model: "gpt-4o-mini",
    messages: [
      {
        role: "user",
        content: `Bom base na diff informada analise e faça um comentário breve e curto para quem vai testar a tarefa descreverndo o que muda e possíveis impactos:\n\n${diff}`
      }
    ]
  });

  const conteudo = resposta.choices[0].message.content;
  console.log("🔍 Resposta da IA:\n", conteudo);
}

main().catch(err => {
  console.error("Erro:", err);
  process.exit(1);
});
