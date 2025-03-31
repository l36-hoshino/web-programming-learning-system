type ErrorLineProps = {
    compileErrorMessage:string
}

export default function ErrorLine({compileErrorMessage}: ErrorLineProps){

    const MAX_LINE_CHAR_COUNT = 51//横の文字数
    const POSITION_ERROR_LINE_Y_ADD = 35//文字の高さ


    const lineColumnPattern = /(\d+):(\d+):/g //エラーメッセージからエラー行を示す10:5:のようなパターン探す
    const lines = compileErrorMessage.split('\n') //エラーメッセージを行ごとに分割

    const results: { error: number; errorMessageLine: number }[] = []
    let accumulatedLineOffset = 0

    for (let i = 0; i < lines.length; i++) {
        let match: RegExpExecArray | null
        while ((match = lineColumnPattern.exec(lines[i])) !== null) {
            results.push({
                error: i + 1 + accumulatedLineOffset, //エラーメッセージの行番号（1始まり）
                errorMessageLine: parseInt(match[1], 10), //プログラムのエラー行番号
            })
        }

        //折り返しの行数を計算する（文字数を基準に判定）
        const lineWidth = lines[i].length
        const maxLineWidth = MAX_LINE_CHAR_COUNT
        if (lineWidth > maxLineWidth) accumulatedLineOffset += Math.floor(lineWidth / maxLineWidth)
    }

    console.log('Parsed Results:', results)

    return (
        <div className={"relative w-full h-full"}>
            <svg className={"absolute top-0 left-0 w-full h-full pointer-events-none -translate-y-[17px]"}>
                {/* 動的に線を描画 */}
                {(() => {
                    const lines = []
                    for (let i = 0; i < results.length; i++) {
                        const {error, errorMessageLine} = results[i]
                        lines.push(
                            <line
                                key={i}
                                x1={'0%'} //右端
                                y1={errorMessageLine * POSITION_ERROR_LINE_Y_ADD}
                                x2={'100%'} //左端
                                y2={error * POSITION_ERROR_LINE_Y_ADD}
                                stroke="red"
                                strokeWidth="2"
                            />,
                        )
                    }
                    return lines
                })()}
            </svg>
        </div>
    )
}