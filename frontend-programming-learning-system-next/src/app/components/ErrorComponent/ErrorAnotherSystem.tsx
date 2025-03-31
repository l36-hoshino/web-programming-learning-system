'use client'

import {useEffect, useState} from "react";
import analysisProgramWithBackend, {AnalysisError} from "@/app/components/ErrorComponent/analysisProgramWithBackend";

type ErrorAnotherSystemProps = {
    programCode: string
    compileErrorMessage: string
}

export default function ErrorAnotherSystem({programCode, compileErrorMessage}: ErrorAnotherSystemProps) {

    const [analysisErrorMessage, setAnalysisErrorMessage] = useState<AnalysisError[]>([])

    let accumulatedLines = 0; //累積行数を追跡
    const generateBreaks = (lineDiff: number, index: number) => {
        return lineDiff > 0 ? Array.from({ length: lineDiff }, (_, i) => (
            <br key={`br-${index}-${i}`} />
        )) : null;
    };

    useEffect(() => {
        (async () => {
            const result = await analysisProgramWithBackend(programCode)
            setAnalysisErrorMessage(result.print_error_messages)
        })()
    }, [compileErrorMessage])

    return (
        <div className={"border border-gray-200 w-full"}>
            {analysisErrorMessage.length > 0 ? (
                analysisErrorMessage.map((error, index) => {
                    const lineDiff = error.line_number - (index + 1 + accumulatedLines);
                    accumulatedLines += lineDiff > 0 ? lineDiff : 0;

                    const breaks = generateBreaks(lineDiff, index);

                    return (
                        <div key={index}>
                            {breaks}
                            {error.line_number}行目&nbsp;
                            {error.error_type === 'A' ? (
                                <span>{error.error_message}</span>
                            ) : (
                                <>
                                    <span className="relative inline-block cursor-pointer group text-blue-600">
                                        {error.error_message}
                                        <span
                                            className="absolute z-10 w-[300px] bg-gray-300 text-black text-left rounded p-2 mt-1 opacity-0 group-hover:opacity-100 transition-opacity">
                                        {error.error_message} の書き方は
                                        <br/>
                                        <br/>
                                            {error.correct_grammar.map((grammar, i) => (
                                                <div key={i}>
                                                    <div dangerouslySetInnerHTML={{__html: grammar}}/>
                                                    {i < error.correct_grammar.length - 1 && (
                                                        <div>
                                                            <br/>
                                                            もしくは
                                                            <br/>
                                                            <br/>
                                                        </div>
                                                    )}
                                                </div>
                                            ))}
                                        </span>
                                    </span>
                                    &nbsp;の文法が間違っています
                                </>
                            )}
                        </div>
                    );
                })
            ) : (
                <p className="m-0 p-0"/>
            )}
        </div>
    )
}