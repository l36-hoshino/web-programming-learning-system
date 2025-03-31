type ProgramTextAreaProps = {
    programCode: string
    setProgramCodeAction: React.Dispatch<React.SetStateAction<string>>
}

export default function ProgramTextArea({programCode, setProgramCodeAction}: ProgramTextAreaProps){

    //Tabを押したときにインデント挿入
    const handleKeyDown = (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
        if (e.key === 'Tab') {
            e.preventDefault() //デフォルトのTab動作を無効化

            const textarea = e.currentTarget
            const start = textarea.selectionStart
            const end = textarea.selectionEnd
            const spaces = '    ' //空白4つ

            //現在の行を対象に空白を挿入
            const lines = programCode.split('\n') // 複数行の分割
            const currentLineIndex = textarea.value.substring(0, start).split('\n').length - 1
            const currentLine = lines[currentLineIndex]

            //カーソル位置に空白を挿入
            const newLine =
                currentLine.substring(0, start - textarea.value.lastIndexOf('\n', start - 1) - 1) +
                spaces +
                currentLine.substring(end - textarea.value.lastIndexOf('\n', start - 1) - 1)

            //更新された行を挿入
            lines[currentLineIndex] = newLine
            const newValue = lines.join('\n')

            setProgramCodeAction(newValue)

            //カーソル位置を調整
            requestAnimationFrame(() => {
                textarea.selectionStart = textarea.selectionEnd = start + spaces.length
            })
        }
    }

    return (
        <textarea
            spellCheck="false"
            className="w-full min-h-[500px] resize-none pl-2 pb-5 focus:outline-none overflow-hidden overflow-x-auto"
            wrap="off"
            value={programCode}
            onKeyDown={handleKeyDown}
            onChange={(e) => setProgramCodeAction(e.target.value)}
        />
    )
}


