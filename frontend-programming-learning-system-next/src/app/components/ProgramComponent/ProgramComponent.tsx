'use client'

import ProgramTextArea from "@/app/components/ProgramComponent/ProgramTextArea";
import LineNumbers from "@/app/components/ProgramComponent/LineNumbers";
import {useEffect, useState} from "react";

type ProgramComponentProps = {
    programCode: string
    setProgramCodeAction: React.Dispatch<React.SetStateAction<string>>
}

export default function ProgramComponent({programCode, setProgramCodeAction}: ProgramComponentProps){

    const [lineNumbers, setLineNumbers] = useState<string[]>(["1"])

    //programCode変更時に改行コードを数えてlineNumbersに反映
    useEffect(() => {
        const lineLength = (programCode.match(/\n/g) || []).length + 1
        const newLineNumbers = Array.from({ length: lineLength }, (_, i) => (i + 1).toString())
        setLineNumbers(newLineNumbers)
    }, [programCode])

    return (
        <div className={"h-full flex flex-col"}>
            <div className="break-keep pl-1">プログラム</div>
            <div className={"flex flex-start border border-gray-200 h-full"}>
                <LineNumbers lineNumbers={lineNumbers}/>
                <ProgramTextArea programCode={programCode} setProgramCodeAction={setProgramCodeAction}/>
            </div>
        </div>
    )
}