window.addEventListener("load", () => {
    const $head = document.querySelector("head");
    const $body = document.querySelector("body");
    const script = $body.innerHTML.split("\n");
    const content = script.reduce(
        (content, line) => {
            if (line.slice(0, 2) === "REM") {
                content.head.push(line.slice(2));
            } else {
                content.body.push(line);
            }
            return content;
        },
        { head: [], body: [] },
    );

    const code = Prism.highlight(
        content.body.join("\n"),
        Prism.languages.batch,
        "batch",
    );

    $body.innerHTML =
        "<pre class='language-batch'><code class='language-batch'>" +
        code +
        "</code></pre>";
    $head.innerHTML =
        "<title>KOONTIL</title>" + content.head.join("\n");
});