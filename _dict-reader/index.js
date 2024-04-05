const fs = require("fs")
const path = require("path")

const infoHead = JSON.parse(fs.readFileSync("../info-head.json", "utf-8"))
const dir = fs.readdirSync("../")
const finalData = [...infoHead]

console.log(dir)

for (const d of dir) {
    const p = path.resolve("../", d)
    const m = path.parse(p)
    const metaFilePath = path.resolve(p, "meta.json")

    if (fs.existsSync(metaFilePath)) {
        const metadata = JSON.parse(fs.readFileSync(metaFilePath, "utf-8"))

        let fp = d

        if (metadata['pathoverride']) {
            fp = metadata.pathoverride
        }

        finalData.push({
            path: fp,
            data: metadata,
            isA: "project"
        })
    }
}

console.log(finalData)

fs.writeFileSync("../info.json", JSON.stringify(finalData))