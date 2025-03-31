'use client'

import ProgramComponent from '@/app/components/ProgramComponent/ProgramComponent'
import ErrorComponent from '@/app/components/ErrorComponent/ErrorComponent'
import CompileAndRunComponent, {CompileAndRunHandle} from '@/app/components/CompileAndRunComponent/CompileAndRunComponent'
import {useRef, useState} from 'react'

export default function Main(){

    const [programCode, setProgramCode] = useState('')
    const [programInput, setProgramInput] = useState('')
    const [compileErrorMessage, setCompileErrorMessage] = useState('')

    const submitRef = useRef<CompileAndRunHandle>(null)
    const handleCompileAndRun = () => {
        submitRef.current?.compileAndRun();
    }

    return (
        <div className="text-[25px] leading-[1.4em]">
            <div className="flex w-full min-h-[500px] pb-1">
                <div className="flex flex-row flex-1 gap-1">
                    <div className="flex-[3.5] h-full">
                        <ProgramComponent programCode={programCode} setProgramCodeAction={setProgramCode}/>
                    </div>
                    <div className="flex-[2.6] h-full">
                        <ErrorComponent programCode={programCode} compileErrorMessage={compileErrorMessage}/>
                    </div>
                    <div className="h-full">
                        <CompileAndRunComponent programCode={programCode} programInput={programInput}
                                                compileErrorMessage={compileErrorMessage}
                                                setCompileErrorMessageAction={setCompileErrorMessage}
                                                ref={submitRef}/>
                    </div>
                </div>
            </div>
            <textarea
                className="w-[350px] h-[100px] border border-gray-200 mx-2 mb-1 resize-none text-2xl text-left align-top rounded focus:outline-none focus:ring-0"
                value={programInput}
                onChange={(e) => setProgramInput(e.target.value)}
                placeholder="入力値"
            />
            <div className="flex justify-between items-center ml-2">
                <div className="flex items-center space-x-1">
                    <button
                        onClick={() => handleCompileAndRun()}
                        className="border-2 border-blue-300 text-blue-500 font-medium py-2 px-4 rounded-md hover:bg-blue-100 focus:outline-none focus:ring-2 focus:ring-blue-200 h-12 flex items-center justify-center">
                        コンパイル＆実行
                    </button>
                    <button
                        onClick={() => window.location.reload()}
                        className="border-2 border-blue-300 text-blue-500 font-medium py-2 px-4 rounded-md hover:bg-blue-100 focus:outline-none focus:ring-2 focus:ring-blue-200 h-12 flex items-center justify-center">
                        Reset
                    </button>
                </div>
            </div>
        </div>
    )
}