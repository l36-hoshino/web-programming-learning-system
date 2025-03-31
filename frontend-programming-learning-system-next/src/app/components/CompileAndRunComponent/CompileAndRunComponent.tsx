'use client'

import {forwardRef, useImperativeHandle} from "react";
import {compileAndRunWithBackend} from "@/app/components/CompileAndRunComponent/compileAndRunWithBackend";

type CompileAndRunComponentProps = {
    programCode: string
    programInput: string
    compileErrorMessage: string
    setCompileErrorMessageAction: React.Dispatch<React.SetStateAction<string>>
}

export type CompileAndRunHandle = {
    compileAndRun: () => void
}

//refで親コンポーネントで呼び出せるようにする
const CompileAndRunComponent = forwardRef<CompileAndRunHandle, CompileAndRunComponentProps>(({ programCode, programInput, compileErrorMessage, setCompileErrorMessageAction }, ref) => {

    //compileAndRunWithBackend.tsでバックエンドのコンパイル＆実行のphpプログラムを呼び出す
    const compileAndRun = async () => {
        const result = await compileAndRunWithBackend({programCode, programInput})
        setCompileErrorMessageAction(result)
    }

    useImperativeHandle(ref, () => ({compileAndRun}))

    return (
        <div className={"h-full flex flex-col"} style={{ width: '51ch' }}>
            <div>コンパイル&実行結果</div>
            <div className={"h-full border border-gray-200"}>
                <pre className="w-full font-mono break-words whitespace-pre-wrap m-0 p-0"
                     style={{wordBreak: 'break-all', whiteSpace: 'pre-wrap'}}>
                    {compileErrorMessage}
                </pre>
            </div>
        </div>
    )
})

CompileAndRunComponent.displayName = 'CompileAndRunComponent'
export default CompileAndRunComponent