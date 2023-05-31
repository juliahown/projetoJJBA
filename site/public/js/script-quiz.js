const question = document.querySelector(".question");
const answers = document.querySelector(".answers");
const questionQtd = document.querySelector(".questionQtd");
const textFinish = document.querySelector(".finish span");
const content = document.querySelector(".content");
const contentFinish = document.querySelector(".finish");
const btnFinalizar = document.querySelector(".finish button");

import questions from "./questions.js";

let questaoAtual = 0;
let questoesAcertos = 0;

btnFinalizar.onclick = () => {
  // content.style.display = "flex";
  // contentFinish.style.display = "none";

  setTimeout(function () {
    window.location = "score.html";
}, 0);
};

function ProximaQuestao(e) {
  if (e.target.getAttribute("data-correct") === "true") {
    questoesAcertos++;
  }

  if (questaoAtual < questions.length - 1) {
    questaoAtual++;
    CarregarQuestao();
  } else {
    finish();
  }
}

function finish() {
  textFinish.innerHTML = `Você acertou ${questoesAcertos} de ${questions.length}`;
  content.style.display = "none";
  contentFinish.style.display = "flex";
}

function CarregarQuestao() {
  questionQtd.innerHTML = `${questaoAtual + 1}/${questions.length}`;
  const item = questions[questaoAtual];
  answers.innerHTML = "";
  question.innerHTML = item.question;

  item.answers.forEach((answer) => {
    const div = document.createElement("div");

    div.innerHTML = `
    <button class="answer" data-correct="${answer.correct}">
      ${answer.option}
    </button>
    `;

    answers.appendChild(div);
  });

  document.querySelectorAll(".answer").forEach((item) => {
    item.addEventListener("click", ProximaQuestao);
  });
}

CarregarQuestao();